const fs = require('fs');

function extractPlaceholders(str) {
  // Find all {{paramName}} patterns and return unique param names
  const matches = [...str.matchAll(/\{\{(\w+)\}\}/g)];
  return [...new Set(matches.map(m => m[1]))];
}

function fixString(str) {
  // Convert {{param}} to {param} for Flutter ICU format
  return str.replace(/\{\{(\w+)\}\}/g, '{$1}');
}

function fixArb(filePath, locale) {
  const raw = fs.readFileSync(filePath, 'utf-8');
  const data = JSON.parse(raw);

  const fixed = {};
  for (const [key, value] of Object.entries(data)) {

    if (key === '@@locale') {
      // Must be a plain string
      fixed[key] = typeof value === 'object' ? locale : value;

    } else if (key.startsWith('@')) {
      // Metadata entry — keep as object with string fields
      let parsed = value;
      if (typeof value === 'string') {
        try { parsed = JSON.parse(value); } catch { parsed = { description: value }; }
      }

      if (typeof parsed === 'object' && parsed !== null && !Array.isArray(parsed)) {
        const clean = {};
        for (const [k, v] of Object.entries(parsed)) {
          if (k === 'placeholders' && typeof v === 'object' && v !== null) {
            clean[k] = v;
          } else {
            clean[k] = typeof v === 'string' ? v : String(v);
          }
        }
        fixed[key] = clean;
      } else {
        fixed[key] = { description: String(parsed) };
      }

    } else {
      // Regular string value — fix {{param}} → {param}
      if (typeof value === 'string') {
        const params = extractPlaceholders(value);
        const fixedValue = fixString(value);
        fixed[key] = fixedValue;

        // If this string has placeholders, update its @ metadata entry
        if (params.length > 0) {
          const metaKey = '@' + key;
          // We'll patch this after the loop — store params for now
          fixed[metaKey] = fixed[metaKey] || { description: key };
          // Add placeholders definition
          const placeholders = {};
          for (const p of params) {
            placeholders[p] = { type: 'String' };
          }
          fixed[metaKey].placeholders = placeholders;
        }
      } else {
        fixed[key] = value;
      }
    }
  }

  fs.writeFileSync(filePath, JSON.stringify(fixed, null, 2), 'utf-8');
  console.log(`✅ Fixed: ${filePath}`);
}

fixArb('lib/l10n/app_ar.arb', 'ar');
fixArb('lib/l10n/app_en.arb', 'en');

console.log('🎉 Done! Now run: flutter clean && flutter pub get');
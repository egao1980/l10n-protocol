# l10n-protocol

Lispy **CLOS** localization for [cl-stack](https://github.com/egao1980/cl-stack) — collation and locale-aware formatters.

| System | Nick | Role |
|--------|------|------|
| `l10n-protocol` | `stack-l10n` | Collator, number/date/currency/list format, locale case |

**Not here:** MF2 templating / catalogs / locale identity → [`i18n-protocol`](https://github.com/egao1980/i18n-protocol). UCD / normalize / IDNA → [`unicode-protocol`](https://github.com/egao1980/unicode-protocol).

## Shape

| ICU | This protocol |
|-----|----------------|
| `Collator` | `make-collator` / `collate` / `sort-key` |
| `NumberFormatter` | `format-number` / `format-percent` / `format-currency` |
| `DateFormat` / relative | `format-date` / `format-datetime` / `format-relative-time` |
| `ListFormatter` | `format-list` |
| `u_strToLower(…, locale)` | `locale-downcase` / `locale-upcase` / `locale-titlecase` |

```lisp
(asdf:load-system "l10n-backend-icu")  ; forthcoming
(stack-l10n:collate "ä" "z" :locale "sv")
(stack-l10n:format-currency 12.5 "EUR" :locale "de-DE")
(stack-l10n:locale-downcase "I" :locale "tr")  ; → "ı"
```

Tracks [cl-stack#151](https://github.com/egao1980/cl-stack/issues/151).

## License

MIT

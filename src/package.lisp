(defpackage #:l10n-protocol
  (:use #:cl)
  (:nicknames #:stack-l10n)
  (:export
   ;; conditions
   #:l10n-error
   #:l10n-unsupported
   #:l10n-format-error
   #:l10n-error-message
   #:l10n-error-capability

   ;; backend
   #:l10n-backend
   #:*l10n-backend*
   #:backend-capabilities
   #:use-l10n-backend
   #:with-l10n-backend
   #:ensure-l10n-backend
   #:require-capability

   #:backend-make-collator
   #:backend-collate
   #:backend-sort-key
   #:backend-format-number
   #:backend-format-percent
   #:backend-format-currency
   #:backend-format-date
   #:backend-format-time
   #:backend-format-datetime
   #:backend-format-relative-time
   #:backend-format-list
   #:backend-parse-number
   #:backend-parse-date
   #:backend-locale-downcase
   #:backend-locale-upcase
   #:backend-locale-titlecase

   ;; collation (ICU Collator)
   #:collator
   #:make-collator
   #:collator-locale
   #:collator-strength
   #:collator-raw
   #:collate
   #:collation-key
   #:sort-key

   ;; number / date / currency / list (ICU NumberFormatter, DateFormat, …)
   #:format-number
   #:format-percent
   #:format-currency
   #:format-date
   #:format-time
   #:format-datetime
   #:format-relative-time
   #:format-list
   #:parse-number
   #:parse-date

   ;; locale-aware case (ICU u_strToLower with locale) — root case stays in unicode-protocol
   #:locale-downcase
   #:locale-upcase
   #:locale-titlecase))

(in-package #:l10n-protocol)

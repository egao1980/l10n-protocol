(in-package #:l10n-protocol)

;;; Locale-/language-sensitive case mapping (ICU u_strToLower etc. with Locale).
;;; Root/default casefold stays in unicode-protocol.

(defgeneric backend-locale-downcase (backend string &key locale))
(defgeneric backend-locale-upcase (backend string &key locale))
(defgeneric backend-locale-titlecase (backend string &key locale))

(defun locale-downcase (string &key locale (backend *l10n-backend*))
  (backend-locale-downcase
   (require-capability :locale-case (ensure-l10n-backend backend))
   (string string) :locale locale))

(defun locale-upcase (string &key locale (backend *l10n-backend*))
  (backend-locale-upcase
   (require-capability :locale-case (ensure-l10n-backend backend))
   (string string) :locale locale))

(defun locale-titlecase (string &key locale (backend *l10n-backend*))
  (backend-locale-titlecase
   (require-capability :locale-case (ensure-l10n-backend backend))
   (string string) :locale locale))

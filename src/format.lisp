(in-package #:l10n-protocol)

;;; ICU NumberFormatter / DateFormat / ListFormatter — keyword options, not skeleton soup in the protocol.
;;; Backends may accept :skeleton for ICU skeleton passthrough.

(defgeneric backend-format-number (backend value &key locale style skeleton options))
(defgeneric backend-format-percent (backend value &key locale skeleton options))
(defgeneric backend-format-currency (backend value currency &key locale skeleton options))
(defgeneric backend-format-date (backend value &key locale style skeleton options))
(defgeneric backend-format-time (backend value &key locale style skeleton options))
(defgeneric backend-format-datetime (backend value &key locale date-style time-style skeleton options))
(defgeneric backend-format-relative-time (backend value unit &key locale numeric options))
(defgeneric backend-format-list (backend items &key locale type width options))
(defgeneric backend-parse-number (backend string &key locale style options))
(defgeneric backend-parse-date (backend string &key locale style skeleton options))

(defun format-number (value &key locale style skeleton options (backend *l10n-backend*))
  (backend-format-number
   (require-capability :number (ensure-l10n-backend backend))
   value :locale locale :style style :skeleton skeleton :options options))

(defun format-percent (value &key locale skeleton options (backend *l10n-backend*))
  (backend-format-percent
   (require-capability :number (ensure-l10n-backend backend))
   value :locale locale :skeleton skeleton :options options))

(defun format-currency (value currency &key locale skeleton options (backend *l10n-backend*))
  (backend-format-currency
   (require-capability :currency (ensure-l10n-backend backend))
   value currency :locale locale :skeleton skeleton :options options))

(defun format-date (value &key locale style skeleton options (backend *l10n-backend*))
  (backend-format-date
   (require-capability :date (ensure-l10n-backend backend))
   value :locale locale :style style :skeleton skeleton :options options))

(defun format-time (value &key locale style skeleton options (backend *l10n-backend*))
  (backend-format-time
   (require-capability :date (ensure-l10n-backend backend))
   value :locale locale :style style :skeleton skeleton :options options))

(defun format-datetime (value &key locale date-style time-style skeleton options
                          (backend *l10n-backend*))
  (backend-format-datetime
   (require-capability :date (ensure-l10n-backend backend))
   value :locale locale :date-style date-style :time-style time-style
   :skeleton skeleton :options options))

(defun format-relative-time (value unit &key locale (numeric :auto) options
                               (backend *l10n-backend*))
  "UNIT ∈ (:second :minute :hour :day :week :month :quarter :year)."
  (backend-format-relative-time
   (require-capability :date (ensure-l10n-backend backend))
   value unit :locale locale :numeric numeric :options options))

(defun format-list (items &key locale (type :and) (width :wide) options
                       (backend *l10n-backend*))
  "TYPE ∈ (:and :or :unit). WIDTH ∈ (:wide :short :narrow)."
  (backend-format-list
   (require-capability :list (ensure-l10n-backend backend))
   items :locale locale :type type :width width :options options))

(defun parse-number (string &key locale style options (backend *l10n-backend*))
  (backend-parse-number
   (require-capability :number (ensure-l10n-backend backend))
   (string string) :locale locale :style style :options options))

(defun parse-date (string &key locale style skeleton options (backend *l10n-backend*))
  (backend-parse-date
   (require-capability :date (ensure-l10n-backend backend))
   (string string) :locale locale :style style :skeleton skeleton :options options))

(in-package #:l10n-protocol)

;;; ICU Collator / UCA

(defclass collator ()
  ((locale :initarg :locale :reader collator-locale :initform nil)
   (strength :initarg :strength :reader collator-strength :initform :tertiary)
   (raw :initarg :raw :accessor collator-raw :initform nil))
  (:documentation "Locale collation engine (ICU Collator)."))

(defgeneric backend-make-collator (backend &key locale strength options)
  (:documentation "STRENGTH ∈ (:primary :secondary :tertiary :quaternary :identical)."))

(defgeneric backend-collate (backend collator string-a string-b)
  (:documentation "→ negative / 0 / positive (strcmp-style)."))

(defgeneric backend-sort-key (backend collator string)
  (:documentation "→ opaque collation key octets or string for binary compare."))

(defun make-collator (&key locale (strength :tertiary) options (backend *l10n-backend*))
  (backend-make-collator
   (require-capability :collate (ensure-l10n-backend backend))
   :locale locale :strength strength :options options))

(defun collate (string-a string-b &key locale collator (backend *l10n-backend*))
  "Compare STRING-A and STRING-B under locale collation."
  (let* ((b (require-capability :collate (ensure-l10n-backend backend)))
         (c (or collator (make-collator :locale locale :backend b))))
    (backend-collate b c (string string-a) (string string-b))))

(defun collation-key (string &key locale collator (backend *l10n-backend*))
  (sort-key string :locale locale :collator collator :backend backend))

(defun sort-key (string &key locale collator (backend *l10n-backend*))
  (let* ((b (require-capability :collate (ensure-l10n-backend backend)))
         (c (or collator (make-collator :locale locale :backend b))))
    (backend-sort-key b c (string string))))

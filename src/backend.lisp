(in-package #:l10n-protocol)

(defclass l10n-backend () ()
  (:documentation "Base class for l10n-protocol backends (ICU4C, …)."))

(defvar *l10n-backend* nil)

(defgeneric backend-capabilities (backend)
  (:documentation "Keywords: :collate :number :date :currency :list :locale-case")
  (:method ((backend l10n-backend)) '()))

(defun use-l10n-backend (backend)
  (check-type backend l10n-backend)
  (setf *l10n-backend* backend))

(defmacro with-l10n-backend (backend &body body)
  `(let ((*l10n-backend* ,backend))
     ,@body))

(defun ensure-l10n-backend (&optional (backend *l10n-backend*))
  (or backend
      (error 'l10n-error
             :message "*l10n-backend* is nil — load an l10n-backend-* system")))

(defun require-capability (capability &optional (backend (ensure-l10n-backend)))
  (unless (member capability (backend-capabilities backend) :test #'eq)
    (error 'l10n-unsupported
           :capability capability
           :message (format nil "backend ~a lacks ~s" backend capability)))
  backend)

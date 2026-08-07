(in-package #:l10n-protocol)

(define-condition l10n-error (error)
  ((message :initarg :message :reader l10n-error-message :initform nil)
   (capability :initarg :capability :reader l10n-error-capability :initform nil))
  (:report (lambda (c s)
             (format s "l10n error~@[: ~a~]" (l10n-error-message c)))))

(define-condition l10n-unsupported (l10n-error) ()
  (:report (lambda (c s)
             (format s "l10n capability unsupported~@[: ~a~]~@[ (~s)~]"
                     (l10n-error-message c) (l10n-error-capability c)))))

(define-condition l10n-format-error (l10n-error) ())

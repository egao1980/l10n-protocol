(in-package #:l10n-protocol/tests)

(deftest no-backend-signals
  (let ((*l10n-backend* nil))
    (ok (signals (collate "a" "b") 'l10n-error))
    (ok (signals (format-number 1234.5 :locale "en") 'l10n-error))
    (ok (signals (locale-downcase "I" :locale "tr") 'l10n-error))))

(deftest unsupported-capability
  (let* ((b (make-instance 'l10n-backend))
         (*l10n-backend* b))
    (ok (signals (require-capability :collate b) 'l10n-unsupported))))

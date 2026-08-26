(defsystem "l10n-protocol"
  :version "0.1.0"
  :description "CLOS l10n protocol for cl-stack (collation, number/date/currency/list formatting)"
  :author "egao1980"
  :license "MIT"
  :depends-on ()

  :serial t
  :pathname "src"
  :components ((:file "package")
               (:file "conditions")
               (:file "backend")
               (:file "collate")
               (:file "format")
               (:file "case-locale"))
  :in-order-to ((test-op (test-op "l10n-protocol/tests"))))

(defsystem "l10n-protocol/tests"
  :depends-on ("l10n-protocol" "rove")
  :pathname "tests"
  :serial t
  :components ((:file "package")
               (:file "protocol-test"))
  :perform (test-op (o c)
             (unless (symbol-call :rove :run c)
               (error "tests failed for ~A" (component-name c)))))

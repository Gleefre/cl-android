(defsystem "cl-android"
  :description "CFFI bindings to different android libraries."
  :version "0.0.2"
  :author "Grolter <varedif.a.s@gmail.com>"
  :license "Apache 2.0"
  :depends-on ("cffi")
  :components ((:file "packages")
               (:file "library")
               (:file "pid-uid")
               (:file "api-levels")
               (:file "permissions")))

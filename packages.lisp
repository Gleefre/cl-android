(defpackage #:cl-android/cffi
  (:use #:cl #:cffi)
  (:export #:libandroid
           #:get-application-target-api-level
           #:get-device-api-level
           #:check-permission-result
           #:check-permission-status
           #:pid
           #:uid
           #:check-permission))

(defpackage #:cl-android
  (:use #:cl #:cffi #:cl-android/cffi)
  (:export #:libandroid
           #:init
           #:quit
           #:get-application-target-api-level
           #:get-device-api-level))

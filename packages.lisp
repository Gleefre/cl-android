(defpackage #:cl-android/cffi
  (:use #:cl #:cffi)
  (:export #:get-application-target-api-level
           #:get-device-api-level))

(defpackage #:cl-android
  (:use #:cl #:cffi #:cl-android/cffi)
  (:export #:init
           #:quit

           #:get-application-target-api-level
           #:get-device-api-level))

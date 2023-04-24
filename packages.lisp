(defpackage #:cl-android/cffi
  (:use #:cl #:cffi)
  (:export #:libandroid
           #:pid
           #:getpid
           #:uid
           #:getuid
           #:get-application-target-api-level
           #:get-device-api-level
           #:check-permission-result
           #:check-permission-status
           #:check-permission))

(defpackage #:cl-android
  (:use #:cl #:cffi)
  (:local-nicknames (#:android #:cl-android/cffi))
  (:import-from #:cl-android/cffi
                #:get-application-target-api-level
                #:get-device-api-level)
  (:export #:init
           #:quit
           #:get-application-target-api-level
           #:get-device-api-level))

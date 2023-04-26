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
           #:get-device-api-level
           #:check-permission))

(defpackage #:cl-android/jni/cffi/define-ift
  (:use #:cl #:cffi)
  (:export #:define-interface-function-table))

(defpackage #:cl-android/jni/cffi
  (:use #:cl-android/jni/cffi/define-ift)
  (:import-from #:cl #:t #:&rest #:in-package)
  (:import-from #:cffi
                #:defctype #:defcstruct #:defcenum
                #:defcunion #:defcfun #:null-pointer)
  (:export #:boolean #:byte #:char #:short #:int #:long #:float #:double
           #:size
           #:object #:class #:string #:array
           #:object-array #:boolean-array #:byte-array #:char-array #:short-array
           #:int-array #:long-array #:float-array #:double-array
           #:throwable #:weak
           #:value
           #:field-id #:method-id
           #:reference-type #:version #:code #:mode
           #:native-method #:vm-option #:vm-initargs #:vm-attach-args
           #:get-default-vm-initargs #:create-vm #:get-created-vms))

(defpackage #:cl-android/jni
  (:use #:cl #:cffi)
  (:local-nicknames (#:jll #:cl-android/jni/cffi))  ; jll = jni low level
  (:export #:init
           #:get-created-java-vms
           #:destroy-java-vm
           #:attach-current-thread
           #:detach-current-thread
           #:get-environment))

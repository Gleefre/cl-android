(in-package #:cl-android/jni/cffi)

(define-foreign-library native-helper
  (:android "libnativehelper.so"))

;;;; From jni.h

;; Primitive types that match up with Java equivalents.
(defctype java-boolean :uint8)
(defctype java-byte :int8)
(defctype java-char :uint16)
(defctype java-short :int16)
(defctype java-int :int32)
(defctype java-long :int64)
(defctype java-float :float)
(defctype java-double :double)

;; Cardinal indices and sizes
(defctype java-size java-int)

;; Reference types, in C.
(defctype java-object :pointer)
(defctype java-class java-object)
(defctype java-string java-object)
(defctype java-array java-object)
(defctype java-object-array java-array)
(defctype java-boolean-array java-array)
(defctype java-byte-array java-array)
(defctype java-char-array java-array)
(defctype java-short-array java-array)
(defctype java-int-array java-array)
(defctype java-long-array java-array)
(defctype java-float-array java-array)
(defctype java-double-array java-array)
(defctype java-throwable java-object)
(defctype java-weak java-object)

(defctype java-field-id :pointer)
(defctype java-method-id :pointer)

(defcunion java-value
  (boolean java-boolean)
  (byte java-byte)
  (char java-char)
  (short java-short)
  (int java-int)
  (long java-long)
  (float java-float)
  (double java-double)
  (object java-object))

(defcenum java-object-reference-type
  :invalid
  :local
  :global
  :weak)

(defcstruct jni-native-method
  (name :string)
  (signature :string)
  (function-pointer :pointer))

;; Pretty much uninformative = bad structs
(defcstruct jni-native-interface
  (reserved-0 :pointer)
  (reserved-1 :pointer)
  (reserved-2 :pointer)
  (reserved-3 :pointer)

  (get-version :pointer)

  (define-class :pointer)
  (find-class :pointer)

  (from-reflected-method :pointer)
  (from-reflected-field :pointer)

  (to-reflected-method :pointer)
  (get-superclass :pointer)
  (is-assignable-from :pointer)
  (to-reflected-field :pointer)

  (throw :pointer)
  (throw-new :pointer)
  (exception-occurred :pointer)
  (exception-describe :pointer)
  (exception-clear :pointer)
  (fatal-error :pointer)

  (push-local-frame :pointer)
  (pop-local-frame :pointer)

  (new-global-reference :pointer)
  (delete-global-reference :pointer)
  (delete-local-reference :pointer)
  (is-same-object :pointer)

  (new-local-reference :pointer)
  (ensure-local-capacity :pointer)

  (alloc-object :pointer)
  (new-object :pointer)
  (new-object-v :pointer)
  (new-object-a :pointer)

  (get-object-class :pointer)
  (is-instance-of :pointer)
  (get-method-id :pointer)

  (call-object-method :pointer)
  (call-object-method-v :pointer)
  (call-object-method-a :pointer)
  (call-boolean-method :pointer)
  (call-boolean-method-v :pointer)
  (call-boolean-method-a :pointer)
  (call-byte-method :pointer)
  (call-byte-method-v :pointer)
  (call-byte-method-a :pointer)
  (call-char-method :pointer)
  (call-char-method-v :pointer)
  (call-char-method-a :pointer)
  (call-short-method :pointer)
  (call-short-method-v :pointer)
  (call-short-method-a :pointer)
  (call-int-method :pointer)
  (call-int-method-v :pointer)
  (call-int-method-a :pointer)
  (call-long-method :pointer)
  (call-long-method-v :pointer)
  (call-long-method-a :pointer)
  (call-float-method :pointer)
  (call-float-method-v :pointer)
  (call-float-method-a :pointer)
  (call-double-method :pointer)
  (call-double-method-v :pointer)
  (call-double-method-a :pointer)
  (call-void-method :pointer)
  (call-void-method-v :pointer)
  (call-void-method-a :pointer)

  (call-nonvirtual-object-method :pointer)
  (call-nonvirtual-object-method-v :pointer)
  (call-nonvirtual-object-method-a :pointer)
  (call-nonvirtual-boolean-method :pointer)
  (call-nonvirtual-boolean-method-v :pointer)
  (call-nonvirtual-boolean-method-a :pointer)
  (call-nonvirtual-byte-method :pointer)
  (call-nonvirtual-byte-method-v :pointer)
  (call-nonvirtual-byte-method-a :pointer)
  (call-nonvirtual-char-method :pointer)
  (call-nonvirtual-char-method-v :pointer)
  (call-nonvirtual-char-method-a :pointer)
  (call-nonvirtual-short-method :pointer)
  (call-nonvirtual-short-method-v :pointer)
  (call-nonvirtual-short-method-a :pointer)
  (call-nonvirtual-int-method :pointer)
  (call-nonvirtual-int-method-v :pointer)
  (call-nonvirtual-int-method-a :pointer)
  (call-nonvirtual-long-method :pointer)
  (call-nonvirtual-long-method-v :pointer)
  (call-nonvirtual-long-method-a :pointer)
  (call-nonvirtual-float-method :pointer)
  (call-nonvirtual-float-method-v :pointer)
  (call-nonvirtual-float-method-a :pointer)
  (call-nonvirtual-double-method :pointer)
  (call-nonvirtual-double-method-v :pointer)
  (call-nonvirtual-double-method-a :pointer)
  (call-nonvirtual-void-method :pointer)
  (call-nonvirtual-void-method-v :pointer)
  (call-nonvirtual-void-method-a :pointer)

  (get-field-id :pointer)

  (get-object-field :pointer)
  (get-boolean-field :pointer)
  (get-byte-field :pointer)
  (get-char-field :pointer)
  (get-short-field :pointer)
  (get-int-field :pointer)
  (get-long-field :pointer)
  (get-float-field :pointer)
  (get-double-field :pointer)

  (set-object-field :pointer)
  (set-boolean-field :pointer)
  (set-byte-field :pointer)
  (set-char-field :pointer)
  (set-short-field :pointer)
  (set-int-field :pointer)
  (set-long-field :pointer)
  (set-float-field :pointer)
  (set-double-field :pointer)

  (get-static-method-id :pointer)

  (call-static-object-method :pointer)
  (call-static-object-method-v :pointer)
  (call-static-object-method-a :pointer)
  (call-static-boolean-method :pointer)
  (call-static-boolean-method-v :pointer)
  (call-static-boolean-method-a :pointer)
  (call-static-byte-method :pointer)
  (call-static-byte-method-v :pointer)
  (call-static-byte-method-a :pointer)
  (call-static-char-method :pointer)
  (call-static-char-method-v :pointer)
  (call-static-char-method-a :pointer)
  (call-static-short-method :pointer)
  (call-static-short-method-v :pointer)
  (call-static-short-method-a :pointer)
  (call-static-int-method :pointer)
  (call-static-int-method-v :pointer)
  (call-static-int-method-a :pointer)
  (call-static-long-method :pointer)
  (call-static-long-method-v :pointer)
  (call-static-long-method-a :pointer)
  (call-static-float-method :pointer)
  (call-static-float-method-v :pointer)
  (call-static-float-method-a :pointer)
  (call-static-double-method :pointer)
  (call-static-double-method-v :pointer)
  (call-static-double-method-a :pointer)
  (call-static-void-method :pointer)
  (call-static-void-method-v :pointer)
  (call-static-void-method-a :pointer)

  (get-static-field-id :pointer)

  (get-static-object-field :pointer)
  (get-static-boolean-field :pointer)
  (get-static-byte-field :pointer)
  (get-static-char-field :pointer)
  (get-static-short-field :pointer)
  (get-static-int-field :pointer)
  (get-static-long-field :pointer)
  (get-static-float-field :pointer)
  (get-static-double-field :pointer)

  (set-static-object-field :pointer)
  (set-static-boolean-field :pointer)
  (set-static-byte-field :pointer)
  (set-static-char-field :pointer)
  (set-static-short-field :pointer)
  (set-static-int-field :pointer)
  (set-static-long-field :pointer)
  (set-static-float-field :pointer)
  (set-static-double-field :pointer)

  (new-string :pointer)
  (get-string-length :pointer)
  (get-string-chars :pointer)
  (release-string-chars :pointer)
  (new-string-utf :pointer)
  (get-string-utf-length :pointer)

  (get-string-utf-chars :pointer)
  (release-string-utf-chars :pointer)
  (get-array-length :pointer)
  (new-object-array :pointer)
  (get-object-array-element :pointer)
  (set-object-array-element :pointer)

  (new-boolean-array :pointer)
  (new-byte-array :pointer)
  (new-char-array :pointer)
  (new-short-array :pointer)
  (new-int-array :pointer)
  (new-long-array :pointer)
  (new-float-array :pointer)
  (new-double-array :pointer)

  (get-boolean-array-elements :pointer)
  (get-byte-array-elements :pointer)
  (get-char-array-elements :pointer)
  (get-short-array-elements :pointer)
  (get-int-array-elements :pointer)
  (get-long-array-elements :pointer)
  (get-float-array-elements :pointer)
  (get-double-array-elements :pointer)

  (release-boolean-array-elements :pointer)
  (release-byte-array-elements :pointer)
  (release-char-array-elements :pointer)
  (release-short-array-elements :pointer)
  (release-int-array-elements :pointer)
  (release-long-array-elements :pointer)
  (release-float-array-elements :pointer)
  (release-double-array-elements :pointer)

  (get-boolean-array-region :pointer)
  (get-byte-array-region :pointer)
  (get-char-array-region :pointer)
  (get-short-array-region :pointer)
  (get-int-array-region :pointer)
  (get-long-array-region :pointer)
  (get-float-array-region :pointer)
  (get-double-array-region :pointer)

  (set-boolean-array-region :pointer)
  (set-byte-array-region :pointer)
  (set-char-array-region :pointer)
  (set-short-array-region :pointer)
  (set-int-array-region :pointer)
  (set-long-array-region :pointer)
  (set-float-array-region :pointer)
  (set-double-array-region :pointer)

  (register-natives :pointer)
  (unregister-natives :pointer)
  (monitor-enter :pointer)
  (monitor-exit :pointer)
  (get-java-vm :pointer)

  (get-string-region :pointer)
  (get-string-utf-region :pointer)

  (get-primitive-array-critical :pointer)
  (release-primitive-array-critical :pointer)

  (get-string-critical :pointer)
  (release-string-critical :pointer)

  (new-weak-global-reference :pointer)
  (delete-weak-global-reference :pointer)

  (exception-check :pointer)

  (new-direct-byte-buffer :pointer)
  (get-direct-buffer-address :pointer)
  (get-direct-buffer-capacity :pointer)

  (get-object-reference-type :pointer))

(defcstruct jni-invoke-interface
  (reserved-0 :pointer)
  (reserved-1 :pointer)
  (reserved-2 :pointer)
  (destroy-java-vm :pointer)
  (attach-current-thread :pointer)
  (detach-current-thread :pointer)
  (get-environment :pointer)
  (attach-current-thread-as-daemon :pointer))

(defctype c-jni-environment (:pointer (:struct jni-native-interface)))
(defctype jni-environment (:pointer (:struct jni-native-interface)))
(defctype java-vm (:pointer (:struct jni-invoke-interface)))

(defcenum jni-version
  (:version-1-1 #x00010001)
  (:version-1-2 #x00010002)
  (:version-1-4 #x00010004)
  (:version-1-6 #x00010006))

(defcstruct java-vm-attach-args
  (version jni-version)
  (name :string)
  (group java-object))

(defcstruct java-vm-option
  (option-string :string)
  (extra-information :pointer))

(defcstruct java-vm-initargs
  (version jni-version)
  (options-number java-int)
  (options (:pointer (:struct java-vm-option)))
  (ignore-unrecognized java-boolean))

;; Exported functions

(defcenum (return-code :int :allow-undeclared-values cl:t)
  (:ok 0)
  (:error -1)
  (:edetached -2)
  (:eversion -3)
  (:enomem -4)
  (:eexist -5)
  (:einval -6)
  (:commit 1)
  (:abort 2))

(defcfun (get-default-java-vm-initargs "JNI_GetDefaultJavaVMInitArgs") return-code
  (default-java-vm-initargs (:pointer (:struct java-vm-initargs))))

(defcfun (create-java-vm "JNI_CreateJavaVM") return-code
  (return-java-vm :pointer)
  (return-java-environment :pointer)
  (initargs (:pointer (:struct java-vm-initargs))))

(defcfun (get-created-java-vms "JNI_GetCreatedJavaVMs") return-code
  (return-java-vms (:pointer java-vm))
  (buffer-length java-size)
  (return-number (:pointer java-size)))

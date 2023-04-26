(in-package #:cl-android/jni)

(defun get-default-vm-initargs (&optional (vm-version :v1.6))
  (with-foreign-object (ret-vm-initargs '(:struct jll:vm-initargs))
    (setf (foreign-slot-value ret-vm-initargs
                              '(:struct jll:vm-initargs)
                              'jll:version)
          vm-version)
    (let ((status (jll:get-default-vm-initargs ret-vm-initargs)))
      (values (when (eq status :ok)
                (mem-aref ret-vm-initargs '(:struct jll:vm-initargs)))
              status))))

(defun get-created-vms (&optional (buffer-length 1))
  (with-foreign-objects ((return-vms '(:pointer jll:vm) buffer-length)
                         (return-number '(:pointer jll:size)))
    (let ((status (jll:get-created-vms return-vms buffer-length return-number)))
      (values (when (eq status :ok)
                (loop for i below (min (mem-aref return-number 'jll:size)
                                       buffer-length)
                      collect (mem-aref return-vms 'jll:vm i)))
              status))))

#|
(defun destroy-vm (vm)
  (foreign-funcall-pointer (foreign-slot-value (mem-aref jvm 'jni:java-vm)
                                               '(:struct jni:jni-invoke-interface)
                                               'jni:destroy-java-vm)
                           ()
                           jni:java-vm jvm
                           jni:return-code))

(defun attach-current-thread (jvm &key (as-daemon nil)
                                       (version :version-1-6 version-p)
                                       (thread-name (null-pointer) thread-name-p)
                                       (thread-group (null-pointer) thread-group-p))
  ;; To bring wrap-if in!
  (with-foreign-objects ((ret-environment 'jni:jni-environment))
    (let ((status (foreign-funcall-pointer (foreign-slot-value (mem-aref jvm 'jni:java-vm)
                                                               '(:struct jni:jni-invoke-interface)
                                                               (if as-daemon
                                                                   'jni:attach-current-thread
                                                                   'jni:attach-current-thread-as-daemon))
                                           ()
                                           jni:java-vm jvm
                                           jni:jni-environment ret-environment
                                           (:pointer (:struct jni:java-vm-attach-args)) (null-pointer)
                                           jni:return-code)))
      (values (when (eq status :ok)
                (mem-aref ret-environment 'jni:jni-environment))
              status))))

(defun detach-current-thread (jvm)
  (foreign-funcall-pointer (foreign-slot-value (mem-aref jvm 'jni:java-vm)
                                               '(:struct jni:jni-invoke-interface)
                                               'jni:detach-current-thread)
                           ()
                           jni:java-vm jvm
                           jni:return-code))

(defun get-environment (jvm &optional (version :version-1-6))
  (with-foreign-objects ((ret-environment 'jni:jni-environment))
    (let ((status (foreign-funcall-pointer (foreign-slot-value (mem-aref jvm 'jni:java-vm)
                                                               '(:struct jni:jni-invoke-interface)
                                                               'jni:get-environment)
                                           ()
                                           jni:java-vm jvm
                                           jni:jni-environment ret-environment
                                           jni:jni-version version
                                           jni:return-code)))
      (values (when (eq status :ok)
                (mem-aref ret-environment 'jni:jni-environment))
              status))))

(defun new-string-utf (java-environment string)
  (foreign-funcall-pointer (foreign-slot-value (mem-aref java-environment 'jni:jni-environment)
                                               '(:struct jni:jni-native-interface)
                                               'jni:new-string-utf)
                           ()
                           jni:jni-environment java-environment
                           :string string
                           jni:java-string))

(defun decode-string-utf (java-environment java-string)
  (foreign-funcall-pointer (foreign-slot-value (mem-aref java-environment 'jni:jni-environment)
                                               '(:struct jni:jni-native-interface)
                                               'jni:get-string-utf-chars)
                           ()
                           jni:jni-environment java-environment
                           jni:java-string java-string
                           :pointer (null-pointer)
                           :string))

(defun java-find-class (java-environment class-name)
  (foreign-funcall-pointer (foreign-slot-value (mem-aref java-environment 'jni:jni-environment)
                                               '(:struct jni:jni-native-interface)
                                               'jni:find-class)
                           ()
                           jni:jni-environment java-environment
                           :string class-name
                           jni:java-class))

(defun get-static-field-id (environment class name signature)
  (foreign-funcall-pointer (foreign-slot-value (mem-aref environment 'jni:jni-environment)
                                               '(:struct jni:jni-native-interface)
                                               'jni:get-static-field-id)
                           ()
                           jni:jni-environment environment
                           jni:java-class class
                           :string name
                           :string signature
                           jni:java-field-id))

(defun get-static-object-field (environment class field)
  (foreign-funcall-pointer (foreign-slot-value (mem-aref environment 'jni:jni-environment)
                                               '(:struct jni:jni-native-interface)
                                               'jni:get-static-object-field)
                           ()
                           jni:jni-environment environment
                           jni:java-class class
                           jni:java-field-id field
                           jni:java-object))

(defun get-method-id (environment class name signature)
  (foreign-funcall-pointer (foreign-slot-value (mem-aref environment 'jni:jni-environment)
                                               '(:struct jni:jni-native-interface)
                                               'jni:get-method-id)
                           ()
                           jni:jni-environment environment
                           jni:java-class class
                           :string name
                           :string signature
                           jni:java-method-id))
|#

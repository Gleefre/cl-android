(in-package #:cl-android/jni)

#+nil
(defun get-default-java-vm-initargs (&optional (vm-version :version-1-6))
  (with-foreign-object (ret-vm-initargs '(:struct java-vm-initargs))
    (setf (foreign-slot-value ret-vm-initargs '(:struct java-vm-initargs) 'version)
          vm-version)
    (values (%get-default-java-vm-initargs ret-vm-initargs)
            (mem-aref ret-vm-initargs '(:struct java-vm-initargs)))))

(defun init ()
  (load-foreign-library 'jni:native-helper))

(defun get-created-java-vms (&optional (buffer-length 1))
  (with-foreign-objects ((return-vms '(:pointer jni:java-vm) buffer-length)
                         (return-number '(:pointer jni:java-size)))
    (let ((status (jni:get-created-java-vms return-vms buffer-length return-number)))
      (values (when (eq status :ok)
                (loop for i below (min buffer-length (mem-aref return-number 'jni:java-size))
                      collect (mem-aref return-vms :pointer i)))
              status))))

(defun destroy-java-vm (jvm)
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

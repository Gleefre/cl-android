(in-package #:cl-android/cffi)

(defcenum check-permission-result
  (:granted 0)
  (:denied -1))

(defcenum check-permission-status
  (:ok 0)
  (:unknown-error -1)
  (:service-unavailable -2))

(defcfun (check-permission "APermissionManager_checkPermission") check-permission-status
  "Checks whether the package with the given pid/uid has been granted a permission.
Java API of Context::checkPermission() is usually faster and is preferred."
  (permission-name :string)
  (pid pid)
  (uid uid)
  (result (:pointer check-permission-result)))

(in-package #:cl-android)

(defparameter *known-permissions* (make-hash-table :test 'eql))

(defun lispy (value)
  (intern (substitute #\- #\_ (subseq value (1+ (position #\. value :from-end t))))
          '#:keyword))

(defun register-permission (value &optional (name (lispy value)))
  (setf (gethash name *known-permissions*) value))

(defun register-permissions (file)
  (mapcar #'register-permission
          (uiop:read-file-lines file)))

(register-permissions (asdf:system-relative-pathname :cl-android "permissions.txt"))

(defun check-permission (permission &key (pid (android:getpid))
                                         (uid (android:getuid)))
  (with-foreign-object (result 'android:check-permission-result)
    (let* ((permission (gethash permission *known-permissions* (princ-to-string permission)))
           (status (android:check-permission permission pid uid result))
           (result (mem-aref result 'android:check-permission-result)))
      (if (eq status :ok)
          (values (eq result :granted) result)
          (values nil status)))))

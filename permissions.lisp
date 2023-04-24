(in-package #:cl-android/cffi)

(defcenum permission-status
  (:granted 0)
  (:denied -1))

(defcenum permission-manager-status
  (:ok 0)
  (:unknown-error -1)
  (:service-unavailable -2))

(defctype pid :int)
(defctype uid :uint)

(defcfun (check-permission "APermissionManager_checkPermission") permission-manager-status
  "Checks whether the package with the given pid/uid has been granted a permission.
Java API of Context::checkPermission() is usually faster and is preferred."
  (permission-name :string)
  (pid pid)
  (uid uid)
  (result (:pointer permission-status)))

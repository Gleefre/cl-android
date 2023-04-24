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

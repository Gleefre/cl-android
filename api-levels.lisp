(in-package #:cl-android/cffi)

(defcfun (get-application-target-api-level "android_get_application_target_sdk_version") :int
  "Returns the target API level of the caller
Returns __ANDROID_API_FUTURE__ if there is no known target API level.")

(defcfun (get-device-api-level "android_get_device_api_level") :int
  "Returns the API level of the device.
Returns -1 on failure.")

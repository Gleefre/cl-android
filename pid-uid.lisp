(in-package #:cl-android/cffi)

(defctype pid :int)
(defcfun (getpid "getpid") pid)

(defctype uid :uint)
(defcfun (getuid "getuid") uid)

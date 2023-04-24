(in-package #:cl-android/cffi)

(define-foreign-library libandroid
  (:android "libandroid.so"))

(in-package #:cl-android)

(defun init ()
  (load-foreign-library 'libandroid))

(defun quit ()
  (close-foreign-library 'libandroid))

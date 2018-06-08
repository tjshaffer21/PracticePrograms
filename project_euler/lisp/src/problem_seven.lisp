;;;; problem_seven.lisp
;;;; Project Euler
;;;; Problem 7 - 10001st prime	
;;;;
;;;; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
;;;; that the 6th prime is 13.
;;;;
;;;; What is the 10001st prime number?
;;;;
(in-package #:project-euler)

(defun problem-seven (n)
  (iterate:iter
    (iterate:with current = (* 2 n))
    (iterate:with max = most-positive-fixnum)
    (iterate:while (< current max))
    (let ((sieve (sieve-of-erathosthenes current)))
      (if (>= (length sieve) n)
          (return-from problem-seven (nth (1- n) sieve))
          (setf current (+ current n))))))

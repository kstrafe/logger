#lang info
(define collection "logger")
(define deps '("base"))
(define build-deps '("sandbox-lib" "scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/logger.scrbl" ())))
(define pkg-desc "Simple effective logging in Racket")
(define version "0.1.0")
(define pkg-authors '("Kevin Robert Stravers"))

#lang br
(define-macro (lister ARG ...)
  #'(list ARG ...))

(lister "foo" "bar" "baz")

(define-macro (wrap ARG ...)
  #'(list '(ARG 42) ...))

(wrap "foo" "bar" "baz")

(define-macro (wrap2 ARG ...)
  #'(list '(ARG 42 ARG) ...))

(wrap2 "foo" "bar" "baz")

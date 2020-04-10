#lang racket

(define (my-length lst)
  (define (iter lst len)
    (cond
      [(empty? lst) len]
      [else (iter (rest lst) (+ len 1))]))
  (iter lst 0))

(displayln (my-length empty))
(displayln (my-length (list 1 2 3)))

(define (my-map fn lst)
  (cond
    [(empty? lst) empty]
    [else (cons (fn (first lst))
                (my-map fn (rest lst)))]))

(displayln (my-map sqrt (list 1 4 9 16)))
(displayln (my-map
             (λ (s) (string-append (string-upcase s) "!"))
             (list "foo" "bar" "qux")))

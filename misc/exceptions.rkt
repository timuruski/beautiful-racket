#lang racket

(struct exn:no-vowels exn:fail ())
(define (raise-no-vowels-error word)
  (raise (exn:no-vowels
           (format "word ~v has no vowels" word)
           (current-continuation-marks))))

(define (f word)
  (unless (regexp-match #rx"[aeiou]" word)
    (raise-no-vowels-error word))
  (displayln word))

(with-handlers ([exn:no-vowels? (λ (exn) 'no-vowels-special)])
  (f "strtd"))

(with-handlers ([exn:no-vowels? (λ (exn) 'no-vowels-generic)])
  (f "strtd"))

(struct exn:all-zero exn ())
(define (signal-all-zero)
  (raise (exn:all-zero "all zero"
                       (current-continuation-marks))))

(define (a) (b (random 10)))

(define (b a-val) (c a-val (random 10)))

(define (c a-val b-val)
  (when (andmap zero? (list a-val b-val (random 10)))
    (signal-all-zero)))

(with-handlers ([integer? (λ (trial) trial)])
  (for ([trial (in-naturals)])
    (with-handlers ([exn:all-zero? (λ (exn) (raise trial))])
      (a))))

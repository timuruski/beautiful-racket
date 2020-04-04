#lang racket
(for/fold ([sum 0]
           [rev-roots null])
          ([i '(1 2 3 4)])
  (values (+ sum i) (cons (sqrt i) rev-roots)))

(for/fold ([acc '()]
           [seen (hash)]
           #:result (reverse acc))
          ([x (in-list `(0 1 1 2 3 4 4 4))])
  (cond
    [(hash-ref seen x #f)
     (values acc seen)]
    [else (values (cons x acc)
                  (hash-set seen x #t))]))

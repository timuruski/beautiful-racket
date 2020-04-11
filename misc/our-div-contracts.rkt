#lang racket

(module our-submod br
  (require racket/contract)
  (define (our-div num denom)
    (/ num denom))
  (provide (contract-out
            [our-div (-> number? (not/c zero?) number?)])))

(require (submod "." our-submod))
(with-handlers
  ([exn:fail:contract? (λ (exn) 'undefined)])
  (our-div 42 0))
(our-div 42 7)

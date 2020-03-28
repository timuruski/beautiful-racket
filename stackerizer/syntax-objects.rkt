#lang racket
(define stx #'foo)
(define stx+prop (syntax-property stx 'hello "world"))
(syntax? stx+prop)
(syntax-property stx+prop 'hello)

(format "Syntax line: ~a" (syntax-line stx))
(format "Syntax column: ~a" (syntax-column stx))
(format "Syntax span: ~a" (syntax-span stx))
#| (synax-srcloc stx) |#

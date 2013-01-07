#lang planet neil/sicp
 
;;;Excercise 1.1 - Evaluate the following expressions

;;10
;10

;;(+ 5 3 4)
;12

;;(- 9 1)
;8

;;(/ 6 2)
;3

;;(+ (* 2 4) (- 4 6))
;6

;;(define a 3)
;no response, a = 3

;;(define b (+ a 1))
;no response, b = 4

;;(+ a b (* a b))
;(+ 3 4 12)
;19

;;(= a b)
;false

;;(if (and (> b a) (< b (* a b)))
;;    b
;;    a)
;4 bc b is greater than a and less than a * b

;;(cond ((= a 4) 6)
;;      ((= b 4) (+ 6 7 a))
;;      (else 25))
;16 

;;(+ 2 (if (> b a) b a))
;6

;;(* (cond ((> a b) a)
;;         ((< a b) b)
;;         (else -1))
;;   (+ a 1))
; (* b (+ a 1))
; (* 4 4)
; 16

;;;Excercise 1.2 - convert to prefix notation

;; (5 + 4 + (2 - (3 - (6 + 4/5)))) / (3(6-2)(2-7)
(/ 
 (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
 (* 3 (- 6 2) (- 2 7)))

;;;Excercise 1.3 - Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger

;had trouble with the syntax of this, it did not work until I wrapped the and predicates in an extra set of parens
(define (square-largest-two a b c)
  (cond
    ((and (< a b) (< a c)) (+ (* b b) (* c c)))
    ((and (< b a) (< b c)) (+ (* a a) (* c c)))
    ((and (< c a) (< c b)) (+ (* a a) (* b b)))))

;;;Excercise 1.4 - Observe that our model of evaluation allows for combinations whose operators are compound expressions. 
;;;Use this observation to describe the behavior of the following procedure:
;;;
;;; (define (a-plus-abs-b a b)
;;;   ((if (> b 0) + -) a b))

; Tests to see if B is a positive number, if it is not then it applies subtraction which would negate negative sign of B

;;;Exercise 1.5.  
;;;Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:
;;;
;;;(define (p) (p))
;;;
;;;(define (test x y)
;;;  (if (= x 0)
;;;      0
;;;      y))
;;;
;;;Then he evaluates the expression
;;;
;;;(test 0 (p))
;;;
;;;What behavior will Ben observe with an interpreter that uses applicative-order evaluation? 
;;;What behavior will he observe with an interpreter that uses normal-order evaluation? 
;;;Explain your answer. (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)

; Notes for my own sanity... explanation from http://danboykis.com/2009/05/applicative-order-vs-normal-order-evaluation/
; Applicative order - arguments to functions get evaluated (reduced as much as possible) before being passed to a function
; Normal order - a full expansion of all function application happens first and then the arguments are evaluated.

;Applicative order will result in an infinite loop because will recursively call itself and has no terminating clause.
;Normal order will return 0 because p will not even be evaluated. If anything other than 0 was used then we would still enter an infinite loop when the else expression was evaluated.


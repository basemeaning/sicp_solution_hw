#lang racket 


;习题1.30
(define (cube x) (* x x x))
;迭代的sum
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))


(define (intergral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(intergral cube 0 1 0.01)

;利用辛普森规则

(define (intergralsim f a b n)
  (define h (/ (- b a) n))
  (define (inc x) (+ x 1))
  (define (coeff k) (cond ((= k 0) 1.0)
                          ((= k n) 1.0)
                          ((even? k) 2.0)
                          (else 4.0)))
  (define (makeyk k) (* (coeff k) 
                        (f (+ a (* k h)))))
  (* (/ h 3) (sum makeyk 0 inc  n)))

  (intergralsim cube 0 1 100)
  (intergralsim cube 0 1 1000)

;递归sum的结果
;0.24998750000000042
;0.24999999999999992
;0.2500000000000002

;迭代sum的结果，为啥不一样呢？
;0.24998750000000042
;0.25
;0.25000000000000006

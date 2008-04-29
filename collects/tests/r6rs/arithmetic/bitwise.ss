#!r6rs

(library (tests r6rs arithmetic bitwise)
  (export run-arithmetic-bitwise-tests)
  (import (rnrs)
          (tests r6rs test))

  ;; Helpers originally from Ikarus test suite:
  (define (ref ei)
    (do ((result 0 (+ result 1)) 
         (bits (if (negative? ei) 
                   (bitwise-not ei) 
                   ei) 
               (bitwise-arithmetic-shift bits -1))) 
        ((zero? bits)
         result)))
  (define-syntax len-test
    (syntax-rules ()
      [(_ n) (test (bitwise-length n)
                   (ref n))]))
  (define (pos-count-bits n)
    (if (zero? n) 
        0
        (let ([c (count-bits (bitwise-arithmetic-shift-right n 1))])
          (if (even? n) c (+ c 1)))))
  (define (count-bits n)
    (if (>= n 0)
        (pos-count-bits n)
        (bitwise-not (pos-count-bits (bitwise-not n)))))
  (define-syntax count-test
    (syntax-rules ()
      [(_ n)
       (test (bitwise-bit-count n) (count-bits n))]))
      
  (define (run-arithmetic-bitwise-tests)

    (test (bitwise-first-bit-set 0)         -1)
    (test (bitwise-first-bit-set 1)         0)
    (test (bitwise-first-bit-set -4)        2)
    
    (test (bitwise-arithmetic-shift -6 -1) -3)
    (test (bitwise-arithmetic-shift -5 -1) -3)
    (test (bitwise-arithmetic-shift -4 -1) -2)
    (test (bitwise-arithmetic-shift -3 -1) -2)
    (test (bitwise-arithmetic-shift -2 -1) -1)
    (test (bitwise-arithmetic-shift -1 -1) -1)
    
    (test (bitwise-reverse-bit-field #b1010010 1 4)    88) ; #b1011000

    ;; Originally from Ikarus test suite:
    (len-test #xF)
    (len-test #xFF)
    (len-test #xFFF)
    (len-test #xFFFF)
    (len-test #xFFFFF)
    (len-test #xFFFFFF)
    (len-test #xFFFFFFF)
    (len-test #xFFFFFFFF)
    (len-test #xFFFFFFFFF)
    (len-test #xFFFFFFFFFF)
    (len-test #xFFFFFFFFFFF)
    (len-test #xFFFFFFFFFFFF)
    (len-test #xFFFFFFFFFFFFF)
    (len-test #xFFFFFFFFFFFFFF)
    (len-test #xFFFFFFFFFFFFFFF)
    (len-test #xFFFFFFFFFFFFFFFF)
    (len-test #x-F)
    (len-test #x-FF)
    (len-test #x-FFF)
    (len-test #x-FFFF)
    (len-test #x-FFFFF)
    (len-test #x-FFFFFF)
    (len-test #x-FFFFFFF)
    (len-test #x-FFFFFFFF)
    (len-test #x-FFFFFFFFF)
    (len-test #x-FFFFFFFFFF)
    (len-test #x-FFFFFFFFFFF)
    (len-test #x-FFFFFFFFFFFF)
    (len-test #x-FFFFFFFFFFFFF)
    (len-test #x-FFFFFFFFFFFFFF)
    (len-test #x-FFFFFFFFFFFFFFF)
    (len-test #x-FFFFFFFFFFFFFFFF)

    (len-test #xE)
    (len-test #xFE)
    (len-test #xFFE)
    (len-test #xFFFE)
    (len-test #xFFFFE)
    (len-test #xFFFFFE)
    (len-test #xFFFFFFE)
    (len-test #xFFFFFFFE)
    (len-test #xFFFFFFFFE)
    (len-test #xFFFFFFFFFE)
    (len-test #xFFFFFFFFFFE)
    (len-test #xFFFFFFFFFFFE)
    (len-test #xFFFFFFFFFFFFE)
    (len-test #xFFFFFFFFFFFFFE)
    (len-test #xFFFFFFFFFFFFFFE)
    (len-test #xFFFFFFFFFFFFFFFE)
    (len-test #x-E)
    (len-test #x-FE)
    (len-test #x-FFE)
    (len-test #x-FFFE)
    (len-test #x-FFFFE)
    (len-test #x-FFFFFE)
    (len-test #x-FFFFFFE)
    (len-test #x-FFFFFFFE)
    (len-test #x-FFFFFFFFE)
    (len-test #x-FFFFFFFFFE)
    (len-test #x-FFFFFFFFFFE)
    (len-test #x-FFFFFFFFFFFE)
    (len-test #x-FFFFFFFFFFFFE)
    (len-test #x-FFFFFFFFFFFFFE)
    (len-test #x-FFFFFFFFFFFFFFE)
    (len-test #x-FFFFFFFFFFFFFFFE)

    (len-test #x1)
    (len-test #x1F)
    (len-test #x1FF)
    (len-test #x1FFF)
    (len-test #x1FFFF)
    (len-test #x1FFFFF)
    (len-test #x1FFFFFF)
    (len-test #x1FFFFFFF)
    (len-test #x1FFFFFFFF)
    (len-test #x1FFFFFFFFF)
    (len-test #x1FFFFFFFFFF)
    (len-test #x1FFFFFFFFFFF)
    (len-test #x1FFFFFFFFFFFF)
    (len-test #x1FFFFFFFFFFFFF)
    (len-test #x1FFFFFFFFFFFFFF)
    (len-test #x1FFFFFFFFFFFFFFF)
    (len-test #x-1)
    (len-test #x-1F)
    (len-test #x-1FF)
    (len-test #x-1FFF)
    (len-test #x-1FFFF)
    (len-test #x-1FFFFF)
    (len-test #x-1FFFFFF)
    (len-test #x-1FFFFFFF)
    (len-test #x-1FFFFFFFF)
    (len-test #x-1FFFFFFFFF)
    (len-test #x-1FFFFFFFFFF)
    (len-test #x-1FFFFFFFFFFF)
    (len-test #x-1FFFFFFFFFFFF)
    (len-test #x-1FFFFFFFFFFFFF)
    (len-test #x-1FFFFFFFFFFFFFF)
    (len-test #x-1FFFFFFFFFFFFFFF)

    (len-test #x1)
    (len-test #x10)
    (len-test #x100)
    (len-test #x1000)
    (len-test #x10000)
    (len-test #x100000)
    (len-test #x1000000)
    (len-test #x10000000)
    (len-test #x100000000)
    (len-test #x1000000000)
    (len-test #x10000000000)
    (len-test #x100000000000)
    (len-test #x1000000000000)
    (len-test #x10000000000000)
    (len-test #x100000000000000)
    (len-test #x1000000000000000)
    (len-test #x-1)
    (len-test #x-10)
    (len-test #x-100)
    (len-test #x-1000)
    (len-test #x-10000)
    (len-test #x-100000)
    (len-test #x-1000000)
    (len-test #x-10000000)
    (len-test #x-100000000)
    (len-test #x-1000000000)
    (len-test #x-10000000000)
    (len-test #x-100000000000)
    (len-test #x-1000000000000)
    (len-test #x-10000000000000)
    (len-test #x-100000000000000)
    (len-test #x-1000000000000000)

    (len-test #x1)
    (len-test #x11)
    (len-test #x101)
    (len-test #x1001)
    (len-test #x10001)
    (len-test #x100001)
    (len-test #x1000001)
    (len-test #x10000001)
    (len-test #x100000001)
    (len-test #x1000000001)
    (len-test #x10000000001)
    (len-test #x100000000001)
    (len-test #x1000000000001)
    (len-test #x10000000000001)
    (len-test #x100000000000001)
    (len-test #x1000000000000001)
    (len-test #x-1)
    (len-test #x-11)
    (len-test #x-101)
    (len-test #x-1001)
    (len-test #x-10001)
    (len-test #x-100001)
    (len-test #x-1000001)
    (len-test #x-10000001)
    (len-test #x-100000001)
    (len-test #x-1000000001)
    (len-test #x-10000000001)
    (len-test #x-100000000001)
    (len-test #x-1000000000001)
    (len-test #x-10000000000001)
    (len-test #x-100000000000001)
    (len-test #x-1000000000000001)

    (len-test (greatest-fixnum))
    (len-test (least-fixnum))

    (count-test 1)
    (count-test 28472347823493290482390849023840928390482309480923840923840983)
    (count-test -847234234903290482390849023840928390482309480923840923840983)
    (count-test (greatest-fixnum))
    (count-test (least-fixnum))
    
    (test (bitwise-not 12) -13)
    (test (bitwise-not -12) 11)
    (test (bitwise-not -1) 0)
    (test (bitwise-not 0) -1)
    (test (least-fixnum) (bitwise-not (greatest-fixnum)))
    (test (greatest-fixnum) (bitwise-not (least-fixnum)))

    (test (bitwise-not 38947389478348937489374)
          -38947389478348937489375)
    (test (bitwise-not #xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
          -22300745198530623141535718272648361505980416)
    (test (bitwise-not -38947389478348937489375)
          38947389478348937489374)
    (test (bitwise-not #x-FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
          22300745198530623141535718272648361505980414)
    (test (bitwise-not #xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
          -340282366920938463463374607431768211456)
    (test (bitwise-not #x-FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
          340282366920938463463374607431768211454)
    (test (bitwise-not #x1000000000000000000000000)
          -79228162514264337593543950337)
    (test (bitwise-not #x-1000000000000000000000000)
          79228162514264337593543950335)

    ;;
    ))

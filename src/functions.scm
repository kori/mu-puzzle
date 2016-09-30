; MU-puzzle functions

; returns last member of list l
(define last-member
  (lambda (l)
    (if (null? (cdr l))
      l
      (last-member (cdr l)))))

; returns first nth elements of list l
(define take
  (lambda (n l)
    (if (null? l)
      l
      (if (zero? n)
        '()
        (cons (car l) (take (- n 1) (cdr l)))))))

; appends U to the end of list l if it ends with I
(define xI->xIU
  (lambda (l)
    (if (equal? (car (last-member l)) 'I)
      (append l '(U))
      l)))

; returns list l with a duplicated string x
; after the ith instance of the M character
(define Mx->Mxx
  (lambda (l i)
    (if (null? (cdr l))
      l
      (if (equal? (car l) 'M)
        (if (equal? i 0)
          (append l (cdr l))
          (cons (car l) (Mx->Mxx (cdr l) (- i 1))))
        (cons (car l) (Mx->Mxx (cdr l) i))))))

; returns list l with the ith instance of III replaced with U
(define III->U
  (lambda (l i)
    (if (null? l)
      l
      (if (equal? '(I I I) (take 3 l))
        (if (equal? i 0)
          (cons 'U (III->U (cdddr l) (- i 1)))
          (cons (car l) (III->U (cdr l) (- i 1))))
        (cons (car l) (III->U (cdr l) i))))))

; returns list l without the ith instance of UU
(define dropUU
  (lambda (l i)
    (if (null? l)
      l
      (if (equal? '(U U) (take 2 l))
        (if (equal? i 0)
          (dropUU (cddr l) (- i 1))
          (cons (car l) (dropUU (cdr l) (- i 1))))
        (cons (car l) (dropUU (cdr l) i))))))

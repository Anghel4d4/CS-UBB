; multiply(l, k) = 
;    []                           ,daca l = []
;    map(lambda (x).(x * k), [l1,...,ln]) , altfel
; multiply(l:list, k:number)

(defun multiply (l k)
    (cond
        ((null l) nil)
        (t (mapcar #'(lambda (x) (* x k)) l))
    )
)

; Test cases
(print (multiply '(1 2 3) 2))     ; Should print: (2 4 6)
(print (multiply '(2 4 6 8) 3))   ; Should print: (6 12 18 24)
(print (multiply '() 5))          ; Should print: NIL
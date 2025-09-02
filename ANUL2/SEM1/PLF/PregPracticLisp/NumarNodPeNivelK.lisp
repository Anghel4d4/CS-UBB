;contor(l, k, niv) = { 1 , l e atom si niv = k
; { 0 , l e atom si niv != k
; { contor(l1,k,niv+1) + ... + contor(ln,k,niv+1) , altfel

; contor(l:list, k:intreg, niv:intreg)

(defun contor (l k niv)
    (cond
        ((AND (atom l) (equal niv k)) 1)
        ((AND (atom l) (not(equal niv k))) 0)
        (T (apply #'+ 
                 (mapcar #'(lambda (x)
                            (contor x k (+ niv 1)))
                        l)))
    )
)


(print (contor '(a (b c) (d (e))) 1 -1))  

(print (contor '(a (b c) (d (e))) 2 -1))  

(print (contor '(a (b c) (d (e))) 0 -1))  


(print (contor '(a (b c) (d (e))) 3 -1))  

(let ((pat (make-array 402 :initial-element 0)))
  (setf (aref pat 0) 1)
  (dolist (coin '(1 2 5 10 20 50 100 200))
    (dotimes (i 201)
      (incf (aref pat (+ i coin)) (aref pat i))))
  (print (aref pat 200)))
; 73682

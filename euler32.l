(setq used (make-array 9 :initial-element t)
	  answer ()
	  permutation (make-array 9))

(defun number (l r)
  (do ((i l (1+ i)) (ret 0)) ((= i r) ret)
	(setq ret (+ (* ret 10) (aref permutation i)))))

(defun doIt ()
  (do ((r 2 (1+ r))) ((= r 9))
	(do ((l 1 (1+ l))) ((= l r))
	  (if (= (number r 9) (* (number 0 l) (number l r)))
		  (setq answer (cons (number r 9) answer))))))

(defun make-permutation (k)
  (if (= k 9)
	  (doIt)
	(dotimes (x 9)
	  (cond ((aref used x)
			 (setf (aref used x) nil)
			 (setf (aref permutation k) (1+ x))
			 (make-permutation (1+ k))
			 (setf (aref used x) t))))))

(make-permutation 0)

(setq answer (reduce #'+ (remove-duplicates answer)))

(print answer)
; => 45228

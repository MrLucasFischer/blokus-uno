(defun tabuleiro-vazio ()
  "Funcao que retorna um tabuleiro vazio"
  (list 
   '(1 1 0 0 0 0 0 0 0 0 0 0 0 0)
   '(1 1 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 1 0 0 0 0 0 0 0)
   '(0 0 0 0 0 1 1 1 0 0 0 0 0 0)
   '(0 0 0 0 0 0 1 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 1 1 0 0 0 0 0)
   '(0 0 0 0 0 0 0 1 1 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 1 0 0 0 0)
   '(0 0 0 0 0 0 0 0 1 1 1 0 0 0)
   '(0 0 0 0 0 0 0 0 0 1 0 1 1 0)
   '(0 0 0 0 0 0 0 0 0 0 0 1 1 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 1)
  )
)

;;peca-contagem
(defun peca-contagem (tabuleiro tipo-peca &optional (linha 13) (coluna 13))
  "Funcao que permite contar o numero de pecas do jogador existentes no tabuleiro conforme o seu tipo"
  (cond
   ((and (zerop linha) (zerop coluna)) 
    (cond
     ((and 
       (equal tipo-peca 'pequena)
       (eq (nth 0 (nth 0 tabuleiro)) 1)
       (not (eq (nth 1 (nth 0 tabuleiro)) 1))
       (not (eq (nth 0 (nth 1 tabuleiro)) 1))
      ) 1)
     (T 0)
    )
   )
   ((= coluna -1) (peca-contagem tabuleiro tipo-peca (1- linha) 13 ))
   ((= (nth coluna (nth linha tabuleiro)) 1) (+ (tipo-pecap linha coluna tabuleiro tipo-peca) (peca-contagem tabuleiro tipo-peca linha (1- coluna))))
   (T (peca-contagem tabuleiro tipo-peca linha (1- coluna)))
  )
)

;;tipo-pecap
(defun tipo-pecap (linha coluna tabuleiro tipo-peca)
  "Funcao que ao passarmos uma posicao de um tabuleiro verifica se essa peca e do tipo de peca enviado por argumento"
  (cond

   ((equal tipo-peca 'pequena)
    (cond
     ((or
       (eq (nth (1+ coluna) (nth linha tabuleiro)) 1)
       (eq (nth (1- coluna) (nth linha tabuleiro)) 1)
       (eq (nth coluna (nth (1+ linha) tabuleiro)) 1)
       (eq (nth coluna (nth (1- linha) tabuleiro)) 1)
       ) 0)
     (T 1)
     )
   )

   ((equal tipo-peca 'media)
    (cond
     ((and
       (not (= coluna 0 ))
       (not (= linha 0 ))
       (eq (nth (1- coluna) (nth linha tabuleiro)) 1)
       (eq (nth coluna (nth (1- linha) tabuleiro)) 1)
       (eq (nth (1- coluna) (nth (1- linha) tabuleiro)) 1)
       ) 1)
     (T 0)
    )
   )

   ((equal tipo-peca 'cruz)
    (cond
     ((and
       (not (= coluna 13))
       (not (= coluna 0))
       (not (< linha 2))
       (eq (nth coluna (nth (1- linha) tabuleiro)) 1)
       (eq (nth (1- coluna) (nth (1- linha) tabuleiro)) 1)
       (eq (nth (1+ coluna) (nth (1- linha) tabuleiro)) 1)
       (eq (nth coluna (nth (- linha 2) tabuleiro)) 1)
      ) 1)
     (T 0)
    )
   )

   (T nil)

  )
)
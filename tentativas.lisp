 (defun tabuleiro-vazio ()
  "Funcao que retorna um tabuleiro vazio"
  (list 
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 1 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
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

(defun jogadas-possiveis (tabuleiro tipo-peca)
  "Funcao que ve todas as jogadas possiveis para um determinado no"
  (cond
   ((and 
     (not (equal (nth 0 (nth 0 tabuleiro)) 1)) ;Caso ainda nao exista pe�as nossas em nenhum dos cantos do tabuleiro entao as jogadas possiveis sao os cantos do tabuleiro
     (not (equal (nth 13 (nth 0 tabuleiro)) 1))
     (not (equal (nth 0 (nth 13 tabuleiro)) 1))
     (not (equal (nth 13 (nth 13 tabuleiro)) 1))
     )
    (cond
     ((equal tipo-peca 'pequena) (list '(0 0) '(0 13)'(13 0) '(13 13)))
     ((equal tipo-peca 'media) (list '(0 0) '(0 12)'(12 0) '(12 12)))
     (T nil)
     )
    )

   (T (cond
        ((equal tipo-peca 'pequena) (jogadas-possiveis-para-peca tabuleiro tipo-peca))
        ((equal tipo-peca 'media) (percorre-matriz-peca-media tabuleiro))
        ((equal tipo-peca 'cruz) (percorre-matriz-peca-cruz tabuleiro))
        (T nil)
      )
   )
  )
)




;; Para a peca media

(defun percorre-matriz-peca-media (tabuleiro &optional (linha 13) (coluna 13))
  "Por enquanto pode ser a mesma que a da pequena"
  (cond
  
    ((and (zerop linha) (zerop coluna)) ;;Ja percorreu a matriz inteira e esta na posicao (0,0)
      (cond
        ((eq (nth coluna (nth linha tabuleiro)) 1) nil) ;;nao vai ser nil, meti so por enquanto
        (T nil)
      )
    )

    ((= coluna -1) (percorre-matriz-peca-media tabuleiro (1- linha) 13) ) ;;Quando chegou a coluna -1 significa que ja percorreu a linha toda

    ((= (nth coluna (nth linha tabuleiro)) 1) (append (cantos-disponiveis-peca-media (- linha 2) (- coluna 2) tabuleiro linha coluna) (percorre-matriz-peca-media tabuleiro linha (1- coluna))))

    (T (percorre-matriz-peca-media tabuleiro linha (1- coluna)))

  )
)





(defun cantos-disponiveis-peca-media (linha coluna tabulerio &optional linha-original coluna-original)

  (cond

   ((and (= linha (1+ linha-original)) (= coluna (1+ coluna-original))) (append (pode-colocarp-media linha coluna tabulerio)))

   ((>= coluna (+ coluna-original 2)) (cantos-disponiveis-peca-media (+ linha 3) (- coluna-original 2) tabulerio linha-original coluna-original))

   ((verifica-casas-vazias tabulerio (list 
                                      (list linha coluna) (list linha (1+ coluna))
                                      (list (1+ linha) coluna) (list (1+ linha) (1+ coluna))
                                      )) (append (pode-colocarp-media linha coluna tabulerio)
                                                 (cantos-disponiveis-peca-media linha (+ coluna 3) tabulerio linha-original coluna-original)))

   (T (cantos-disponiveis-peca-media linha (+ coluna 3) tabulerio linha-original coluna-original))

  )
  
)

(defun pode-colocarp-media (linha coluna tabuleiro)
  "Funcao que verifica se as posicoes laterais a onde ficara a peca a colocar nao coincidem com uma peca ja jogada pelo jogador"
  (cond
   ((and 
     (not (casa-com-ump (1- linha) coluna tabuleiro))
     (not (casa-com-ump (1- linha) (1+ coluna) tabuleiro))
     (not (casa-com-ump linha (1- coluna) tabuleiro))
     (not (casa-com-ump linha (+ coluna 2) tabuleiro))
     (not (casa-com-ump (1+ linha) (1- coluna) tabuleiro))
     (not (casa-com-ump (1+ linha) (+ coluna 2) tabuleiro))
     (not (casa-com-ump (+ linha 2) coluna tabuleiro))
     (not (casa-com-ump (+ linha 2) (1+ coluna) tabuleiro))
     ) (list (list linha coluna)))
  )
  
)






;;Funcao auxiliar para ver se uma determinada posicao esta vazia ou nao
(defun verifica-casas-vazias (tabuleiro casas)
  (eval (cons 'and (mapcar #'(lambda (casa) 
              (cond
                ((or (< (first casa) 0) (< (second casa) 0)) nil)
                ((eq (nth (second casa) (nth (first casa) tabuleiro)) 0) T)
                (T nil)
              )
            ) casas)))
)








;;Para a peca pequena

(defun jogadas-possiveis-para-peca (tabuleiro tipo-peca &optional (linha 13) (coluna 13))
  "Funcao que percorre a matriz a partir do seu fim e caso encontre alguma peca jogada pelo jogador ira verificar se e possivel colocar uma nova peca num dos seus cantos"
  (cond
   ((and (zerop linha) (zerop coluna)) 
    (cond
     ((eq (nth coluna (nth linha tabuleiro)) 1) (pode-colocarp 1 1 tabuleiro tipo-peca))
     (T nil)
    ))

   ((= coluna -1) (jogadas-possiveis-para-peca tabuleiro tipo-peca (1- linha) 13))

   ((= (nth coluna (nth linha tabuleiro)) 1) (append (cantos-disponiveis (1- linha) (1- coluna) tabuleiro tipo-peca linha coluna) (jogadas-possiveis-para-peca tabuleiro tipo-peca linha (1- coluna))))

   (t (jogadas-possiveis-para-peca tabuleiro tipo-peca linha (1- coluna)))
  )
)

;;isto por enquanto parece estar a dar !!
(defun cantos-disponiveis (linha coluna tabuleiro tipo-peca &optional linha-original coluna-original)
  "Funcao que verifica se e possivel adicionar uma nova peca aos cantos de uma peca ja jogada pelo jogador, verificando se esta nova peca nao ficaria lateralmente com alguma ja existente"
  (cond
   ((= linha -1) (cantos-disponiveis (+ linha 2) coluna tabuleiro tipo-peca linha-original coluna-original)) ;;Se os cantos superiores ja estiverem fora do tabuleiro nao vale a pena ve-los
   
   ((= coluna -1) (cantos-disponiveis linha (+ coluna 2) tabuleiro tipo-peca linha-original coluna-original)) ;; Se os cantos laterais esquerdos estiverem fora do tabuleiro nao vale a pena ve-los

   ((and (= linha (1+ linha-original)) (= coluna (1+ coluna-original))) (append (pode-colocarp linha coluna tabuleiro tipo-peca)))

   ((>= coluna (+ coluna-original 2)) (cantos-disponiveis (+ linha 2) (- coluna-original 1) tabuleiro tipo-peca linha-original coluna-original))

   ((equal (nth coluna (nth linha tabuleiro)) 0) (append (pode-colocarp linha coluna tabuleiro tipo-peca) (cantos-disponiveis linha (+ coluna 2) tabuleiro tipo-peca linha-original coluna-original )))

   (T (cantos-disponiveis linha (+ coluna 2) tabuleiro tipo-peca linha-original coluna-original))
  )

)

(defun casa-com-ump (linha coluna tabuleiro)
  "Funcao que determina se uma posicao tem la uma peca do jogador ou nao"
  (cond
   ((or (= linha -1) (= coluna -1)) NIL)
   ((eq (nth coluna (nth linha tabuleiro)) 1) T)
   (T nil)
  )
)


(defun pode-colocarp (linha coluna tabuleiro tipo-peca)
  "Funcao que verifica se , ao colocarmos uma peca num dos cantos de uma peca ja existe, nao fica posicionada lateralmente com uma peca ja jogada pelo jogador "
  (cond
   ((and
     (not (casa-com-ump linha (1+ coluna) tabuleiro))
     (not (casa-com-ump linha (1- coluna) tabuleiro))
     (not (casa-com-ump (1+ linha) coluna tabuleiro))
     (not (casa-com-ump (1- linha) coluna tabuleiro))
     (eq (nth coluna (nth linha tabuleiro)) 0)
     ) (list (list linha coluna)))
   (T nil)
   )
    
)

;;Quando tivermos as jogadas possiveis todas certas podemos cagar nas verificações todas que tive a fazer ate agora no puzzle.lisp e simplesmente ver se
;; a posição que o user inserio consta na lista de posições possiveis para aquele tipo de peça

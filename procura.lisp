;;;;Disciplina de IA - 2017/2018
;;;;Projeto 1 - Blokus Uno
;;;;Autor: Andreia Pereira (n 150221021) e Lucas Fischer (n 140221004)
;;;Implementacao dos algoritmos de procura

;;;;;;;; Sucessores ;;;;;;;;

;; sucessores 

(defun sucessores (no operadores algoritmo &optional (profundidade nil))
  "Funcao que devolve a lista de todos os sucessores de um determinado no passado como argumento"

  (cond

   ((equal algoritmo 'dfs)
    (cond
     ((> (get-profundidade-no no) profundidade) nil)
     (T (apply #'append (mapcar #'(lambda(operador)
                                    (aplicar-operador-no no operador)
                                  ) operadores)))
     )
   )

   (T (apply #'append (mapcar #'(lambda(operador)
                                  (aplicar-operador-no no operador)
                                ) operadores)))
  )
)





;;aplicar-operador-no

(defun aplicar-operador-no (no operador)
  "Funcao que aplica apenas um operador a um determinado no. Consoante o operador passado por argumento esta funcao ira determinar as jogadas possiveis para esse operador e ira criar um no (um sucessor) para cada uma dessas jogadas possives"
  (let
    (
     (jogadas-possiveis (cond
                         ((equal operador 'inserir-peca-pequena)
                          (jogadas-possiveis (get-estado-no no) 'pequena))

                         ((equal operador 'inserir-peca-media)
                          (jogadas-possiveis (get-estado-no no) 'media))

                         ((equal operador 'inserir-peca-cruz)
                          (jogadas-possiveis (get-estado-no no) 'cruz))
                         )
                        )

     (numero-peca-pequena (cond
                           ((equal operador 'inserir-peca-pequena)
                            (1- (first (get-pecas-no no)))
                           )
                           (T (first (get-pecas-no no)))
                           )
                          )

     (numero-peca-media (cond
                           ((equal operador 'inserir-peca-media)
                            (1- (second (get-pecas-no no)))
                           )
                           (T (second (get-pecas-no no)))
                          )
                        )

     (numero-peca-cruz (cond
                           ((equal operador 'inserir-peca-cruz)
                            (1- (third (get-pecas-no no)))
                           )
                           (T (third (get-pecas-no no)))
                          )
                       )

    )
    
    (cond
     ((and (equal operador 'inserir-peca-pequena) (< numero-peca-pequena 0)) nil)
     ((and (equal operador 'inserir-peca-media) (< numero-peca-media 0)) nil)
     ((and (equal operador 'inserir-peca-cruz) (< numero-peca-cruz 0)) nil)
;     ((or (< numero-peca-pequena 0) (< numero-peca-media 0) (< numero-peca-cruz 0)) nil)
     
     (T 
      (mapcar #'(lambda (jogada)
                  (let* (
                        (estado (funcall operador (first jogada) (second jogada) (get-estado-no no)))
                        (heuristica-novo-no (heuristica estado))
                        (profundidade-novo-no (1+ (get-profundidade-no no)))
                        (custo-novo-no (+ profundidade-novo-no heuristica-novo-no))
                       )
                    (cria-no 
                     estado
                     (list numero-peca-pequena numero-peca-media numero-peca-cruz)
                     profundidade-novo-no 
                     heuristica-novo-no
                     custo-novo-no
                     no
                    )
                  )
                 ) jogadas-possiveis)
      )
    )
  )
)


;;; Algoritmos

;; bfs
(defun bfs (no-inicial funcao-solucao funcao-sucessores operadores &optional (abertos (list no-inicial)) (fechados nil))
  "Funcao que implementa o algoritmo de procura em largura"
(progn
  (print (length abertos))
  
  (cond

   ((null abertos) nil)

   (T 
    (let* (

           (no-atual (first abertos))

           (abertos-sem-no-inicial (rest abertos))

           (fechados-com-no-inicial (cons no-atual fechados))

           (sucessores (remover-nos-repetidos (funcall funcao-sucessores no-atual operadores 'bfs) abertos-sem-no-inicial fechados-com-no-inicial))

           (abertos-com-sucessores (abertos-bfs abertos-sem-no-inicial sucessores))
          )


      (cond

       ((existe-solucaop sucessores funcao-solucao) (procura-no-objetivo sucessores funcao-solucao))

       (T (bfs (first abertos-com-sucessores) funcao-solucao funcao-sucessores operadores abertos-com-sucessores fechados-com-no-inicial))

      )


     )  
    )
  )
)
)




;; dfs

(defun dfs (no-inicial funcao-solucao funcao-sucessores operadores profundidade &optional (abertos (list no-inicial)) (fechados nil))
  "Funcao que implementa o algoritmo de procura em profundidade"
  (progn
    (print (length abertos))
   (cond

   ((null abertos) nil)

   (T 
    (let* (

           (no-atual (first abertos))

           (abertos-sem-no-inicial (rest abertos))

           (fechados-com-no-inicial (cons no-atual fechados))

          )

      (cond

       ((> (get-profundidade-no no-atual) profundidade) (dfs (first abertos-sem-no-inicial) funcao-solucao funcao-sucessores operadores profundidade abertos-sem-no-inicial fechados-com-no-inicial))

       (T 
        (let* (

               (sucessores (remover-nos-repetidos (funcall funcao-sucessores no-atual operadores 'dfs profundidade) abertos-sem-no-inicial fechados-com-no-inicial))

               (abertos-com-sucessores 
                (abertos-dfs abertos-sem-no-inicial sucessores)
               )

              )
              
          (cond

           ((existe-solucaop sucessores funcao-solucao) (procura-no-objetivo sucessores funcao-solucao))
           
           (T (dfs (first abertos-com-sucessores) funcao-solucao funcao-sucessores operadores profundidade abertos-com-sucessores fechados-com-no-inicial))
          )

         )
        )
         
      )
     )
    )
  )
)
)



;; a*
(defun a* (no-inicial funcao-solucao funcao-sucessores operadores &optional (abertos (list no-inicial)) (fechados nil))
  "Funcao que implementa o algoritmo de procura A*"
  (cond
   ((null abertos) nil)

   (T
    (let* (
           (no-atual (first abertos))

           (abertos-sem-no-inicial (rest abertos))

           (fechados-com-no-inicial (cons no-atual fechados))
          )

      (cond
       ((funcall funcao-solucao no-atual) no-atual)
       (T
        (let* (
               (sucessores (funcall funcao-sucessores no-atual operadores 'bfs))

               (fechados-atualizados (remover-nos-com-menor-f-fechados sucessores fechados-com-no-inicial))

               (abertos-com-sucessores (abertos-a* abertos-sem-no-inicial sucessores fechados-atualizados))
              )

          (a* (first abertos-com-sucessores) funcao-solucao funcao-sucessores operadores abertos-com-sucessores fechados-atualizados)

        )
       )
      )
      
    )
   )
  )
)



;; ida*

(defun ida* (no-inicial funcao-solucao funcao-sucessores operadores &optional (abertos (list no-inicial)) (fechados nil) (limiar (get-f-no no-inicial)))
  "Funcao que imlementa o algoritmo IDA*"
  (progn
    (print limiar)
  (cond
   ((null abertos) nil)
   
   (T
    (let* (
           (no-atual (first abertos))

           (abertos-sem-no-inicial (rest abertos))

           (fechados-com-no-inicial (cons no-atual fechados))
          )

      (cond

       ((> (get-f-no no-atual) limiar)

        (cond
         ;Se existir um em abertos cujo seu f seja menor que o limiar, passa a ser esse o no atual
         ((existe-no-menor-limiar-p abertos-sem-no-inicial limiar) 
          (let* (
                 (novo-no-atual (procura-no-menor-limiar abertos-sem-no-inicial limiar))

                 (sucessores (funcall funcao-sucessores novo-no-atual operadores 'bfs))

                 (fechados-atualizados (remover-nos-com-menor-f-fechados sucessores fechados-com-no-inicial))

                 (abertos-com-sucessores (abertos-a* abertos-sem-no-inicial sucessores fechados-atualizados))
               )
            (ida* (first abertos-com-sucessores) funcao-solucao funcao-sucessores operadores abertos-com-sucessores fechados-atualizados limiar)
          )
         )

         ;Se nao existir nenhum no em abertos cujo f seja menor que o limiar, entao muda-se o limiar para o minimo dos f's em abertos e comeca-se tudo outra vez
         (T (ida* no-inicial funcao-solucao funcao-sucessores operadores abertos fechados (novo-limiar abertos)))
        )

       )

       ((funcall funcao-solucao no-atual) no-atual) ;se o f do no-atual for menor que o limiar e no-atual for um no objetivo entao devolve-se o no atual

       (T 
        (let* (
               (sucessores (funcall funcao-sucessores no-atual operadores 'bfs))

               (fechados-atualizados (remover-nos-com-menor-f-fechados sucessores fechados-com-no-inicial))

               (abertos-com-sucessores (abertos-a* abertos-sem-no-inicial sucessores fechados-atualizados))
               )
          (ida* (first abertos-com-sucessores) funcao-solucao funcao-sucessores operadores abertos-com-sucessores fechados-atualizados limiar)
          )
       )
       
      )

    )
   )
  )
)
)



;;; Funcoes auxiliares para os algoritmos
;; abertos-bfs

(defun abertos-bfs (abertos sucessores)
  "Funcao que constroi a lista de ABERTOS segundo o algoritmo bfs"
  (append abertos sucessores)
)




;; abertos-dfs

(defun abertos-dfs (abertos sucessores)
  "Funcao que constroi a lista de ABERTOS segundo o algoritmo dfs"
  (append sucessores abertos)
)





;; abertos-a*

(defun abertos-a* (abertos sucessores fechados)
  "Funcao que constroi a lista de ABERTOS segundo o algoritmo A*. Esta funcao ira percorrer toda a lista de sucessores a procura de sucessores que nao existam na lista de ABERTOS ou que ja existam mas que tenham um f menor"
  (cond
   ((null sucessores) (sort abertos #'< :key #'get-f-no))

   ((and
     (not (no-existep (first sucessores) abertos))
     (not (no-existep (first sucessores) fechados))
    )(abertos-a* (append abertos (list (first sucessores))) (rest sucessores) fechados))

   (T (abertos-a* (substituir-no-abertos-a* (first sucessores) abertos) (rest sucessores) fechados))
   
  )
)





;; substituir-no-abertos-a*

(defun substituir-no-abertos-a* (no abertos)
  "Funcao que recebe como argumento um no proveniente da lista de sucessores. Com esse no esta funcao vai percorrer a lista de ABERTOS a procura de um no igual ao passado por argumento, se encontrar e se o no passado por argumento possuir um f menor entao substitui-se o que esta na lista de ABERTOS pelo no passado por argumento"
  (cond
   ((null abertos) nil)
   
   ((and
     (equal (get-estado-no no) (get-estado-no (first abertos)))
     (equal (get-pecas-no no) (get-pecas-no (first abertos)))
    )(cond
      ((< (get-f-no no) (get-f-no (first abertos))) (cons no (rest abertos)))
      (T abertos)
     ))

   (T (cons (first abertos) (substituir-no-abertos-a* no (rest abertos))))
  )
)





;; remover-nos-com-menor-f-fechados

(defun remover-nos-com-menor-f-fechados (sucessores fechados)
  "Funcao que percorre a lista de sucessores enquato verifica se existe algum no identico na lista de FECHADOS, caso existe e caso o f do no-sucessor seja menor do que o no em FECHADOS entao retira-se o no de FECHADOS"
  (cond
   ((null sucessores) fechados)
   
   ((not (no-existep (first sucessores) fechados)) (remover-nos-com-menor-f-fechados (rest sucessores) fechados))

   (T (remover-nos-com-menor-f-fechados (rest sucessores) (atualizar-fechados-a* (first sucessores) fechados)))
  )
)




;; atualizar-fechados-a*

(defun atualizar-fechados-a* (no fechados)
  "Funcao que percorre a lista de FECHADOS verificando para cada no se o seu f e superiror ao f do no passado por argumento, caso seja retira-se o no da lista de FECHADOS"
  (apply #'append (mapcar #'(lambda (no-fechado)
              (cond
               ((and
                 (equal (get-estado-no no) (get-estado-no no-fechado))
                 (equal (get-pecas-no no) (get-pecas-no no-fechado))
                )(cond
                  ((< (get-f-no no) (get-f-no no-fechado)) nil)
                  (T (list no-fechado))
                 ))
               (T (list no-fechado))
              )
            ) fechados))
)





;; existe-no-menor-limiar-p

(defun existe-no-menor-limiar-p (abertos limiar)
  "Funcao que verifica se existe algum no na lista de abertos cujo o seu f seja menor que o atual limiar utilizado pelo algoritmo ida*"
  (eval (cons 'or (mapcar #'(lambda (no)
              (cond
               ((<= (get-f-no no) limiar) T)
               (T nil)
              )
            ) abertos)))
)




;; procura-no-menor-limiar

(defun procura-no-menor-limiar (abertos limiar)
  "Funcao que obtem o primeiro no cujo seu f seja menor que o atual limiar utilizado pelo algoritmo ida*"
  (cond
   ((null abertos) nil)
   ((<= (get-f-no (first abertos)) limiar) (first abertos))
   (T (procura-no-menor-limiar (rest abertos) limiar))
  )
)





;; novo-limiar

(defun novo-limiar (abertos)
  "Funcao que ira obter o novo limiar a ser utilizado para o algoritmo ida* sendo este o menor dos valores de f dos nos presentes em abertos"
  (apply #'min (mapcar #'get-f-no abertos))
)





;; remover-no

(defun remover-no (no lista)
  "Funcao que remove um no de uma determinada lista"
  (cond
   ((null lista) nil)
   ((equal no (first lista)) (remover-no no (rest lista)) )
   (T (cons (first lista) (remover-no no (rest lista))))
  )
)




;; remover-nos-repetidos

(defun remover-nos-repetidos (sucessores abertos fechados)
  "Funcao que retira sucessores que ja existam em abertos ou fechados"
  (apply #'append (mapcar #'(lambda (no)
                              (cond
                               ((or (no-existep no abertos) (no-existep no fechados)) nil)
                               (T (list no))
                               )
                              ) sucessores))
)





;; no-existep

(defun no-existep (no lista)
  "Funcao que verifica se um determinado no ja existe numa lista ou nao"
  (cond

   ((null lista) nil)

   ((and 
     (equal (get-estado-no no) (get-estado-no (first lista))) 
     (equal (get-pecas-no no) (get-pecas-no (first lista)))) T)

   (T (no-existep no (rest lista)))

   )
)





;; existe-solucaop

(defun existe-solucaop (sucessores funcao-solucao)
  (eval (cons 'or (mapcar funcao-solucao sucessores)))
)





;; procura-no-objetivo

(defun procura-no-objetivo (sucessores funcao-solucao)
  (cond
   ((null sucessores) nil)
   ((funcall funcao-solucao (first sucessores)) (first sucessores))
   (T (procura-no-objetivo (rest sucessores) funcao-solucao))
  )
)
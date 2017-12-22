;;;;Disciplina de IA - 2017/2018
;;;;Projeto 1 - Blokus Uno
;;;;Autor: Andreia Pereira (n 150221021) e Lucas Fischer (n 140221004)
;;;Implementacao dos algoritmos de procura, sucessores e funcoes auxiliares para o calculo de eficiencia dos algoritmos

;;;;;;;; Sucessores ;;;;;;;;

;; sucessores 

(defun sucessores (no operadores algoritmo heuristica &optional (profundidade nil))
  "Funcao que devolve a lista de todos os sucessores de um determinado no passado como argumento"

  (cond

   ((equal algoritmo 'dfs)
    (cond
     ((>= (get-profundidade-no no) profundidade) nil)  ;So se aplica os sucessores caso a profundidade do no seja inferior a profundidade maxima

     (T (apply #'append (mapcar #'(lambda(operador)
                                    (aplicar-operador-no no operador heuristica)
                                  ) operadores)))
     )
   )

   (T (apply #'append (mapcar #'(lambda(operador)
                                  (aplicar-operador-no no operador heuristica)
                                ) operadores)))
  )
)





;;aplicar-operador-no

(defun aplicar-operador-no (no operador heuristica-escolhida)
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
     ((and (equal operador 'inserir-peca-pequena) (< numero-peca-pequena 0)) nil) ;Se nao existir pecas para o operador que queremos usar, devolve nil
     ((and (equal operador 'inserir-peca-media) (< numero-peca-media 0)) nil)
     ((and (equal operador 'inserir-peca-cruz) (< numero-peca-cruz 0)) nil)
     
     (T 
      (mapcar #'(lambda (jogada)
                  (let* (
                        (estado (funcall operador (first jogada) (second jogada) (get-estado-no no)))
                        (pecas-novas (list numero-peca-pequena numero-peca-media numero-peca-cruz))
                        (heuristica-novo-no (funcall heuristica-escolhida estado pecas-novas))
                        (profundidade-novo-no (1+ (get-profundidade-no no)))
                        (custo-novo-no (+ profundidade-novo-no heuristica-novo-no))
                       )
                    (cria-no estado pecas-novas profundidade-novo-no heuristica-novo-no custo-novo-no no)
                 )
                ) jogadas-possiveis)
      )
    )
  )
)


;;; Algoritmos

;; bfs
(defun bfs (no-inicial funcao-solucao funcao-sucessores operadores heuristica &optional (abertos (list no-inicial)) (fechados nil) (tempo-inicial (get-universal-time)) (nos-expandidos 0)(nos-gerados 0))
  "Funcao que implementa o algoritmo de procura em largura"
  (cond

   ((null abertos) nil) ;Se a lista de abertos estiver vazia, falha

   (T 
    (let* (

           (no-atual (first abertos))

           (abertos-sem-no-inicial (rest abertos))

           (fechados-com-no-inicial (cons no-atual fechados))

           (sucessores (remover-nos-repetidos (funcall funcao-sucessores no-atual operadores 'bfs heuristica) abertos-sem-no-inicial fechados-com-no-inicial))

           (abertos-com-sucessores (abertos-bfs abertos-sem-no-inicial sucessores))
          )


      (cond

       ;Se existir uma solucao nos sucessores, vamos a procura dessa solucao
       ((existe-solucaop sucessores funcao-solucao) 
        (list (procura-no-objetivo sucessores funcao-solucao) tempo-inicial (1+ nos-expandidos) (+ nos-gerados (length sucessores)) ))

       (T (bfs (first abertos-com-sucessores) funcao-solucao funcao-sucessores operadores heuristica abertos-com-sucessores fechados-com-no-inicial tempo-inicial (1+ nos-expandidos) (+ nos-gerados (length sucessores)) ))

      )


     )  
    )
  )
)




;; dfs

(defun dfs (no-inicial funcao-solucao funcao-sucessores operadores profundidade heuristica &optional (abertos (list no-inicial)) (fechados nil) (tempo-inicial (get-universal-time)) (nos-expandidos 0) (nos-gerados 0))
  "Funcao que implementa o algoritmo de procura em profundidade"
   (cond

   ((null abertos) nil) ;Se abertos vazia falha

   (T 
    (let* (

           (no-atual (first abertos))

           (abertos-sem-no-inicial (rest abertos))

           (fechados-com-no-inicial (cons no-atual fechados))

          )

      (cond

       ;Se a profundidade do no atual ultrapassar a profundidade maxima passa-se para o no seguinte
       ((> (get-profundidade-no no-atual) profundidade) (dfs (first abertos-sem-no-inicial) funcao-solucao funcao-sucessores operadores profundidade heuristica abertos-sem-no-inicial fechados-com-no-inicial tempo-inicial nos-expandidos nos-gerados))

       (T 
        (let* (

               (sucessores (remover-nos-repetidos (funcall funcao-sucessores no-atual operadores 'dfs heuristica profundidade) abertos-sem-no-inicial fechados-com-no-inicial))

               (abertos-com-sucessores 
                (abertos-dfs abertos-sem-no-inicial sucessores)
               )

              )
              
          (cond

           ((existe-solucaop sucessores funcao-solucao) 
            (list (procura-no-objetivo sucessores funcao-solucao) tempo-inicial (1+ nos-expandidos) (+ nos-gerados (length sucessores)) ))
           
           (T (dfs (first abertos-com-sucessores) funcao-solucao funcao-sucessores operadores profundidade heuristica abertos-com-sucessores fechados-com-no-inicial tempo-inicial (1+ nos-expandidos) (+ nos-gerados (length sucessores)) ))
          )

         )
        )
         
      )
     )
    )
  )
)



;; a*
(defun a* (no-inicial funcao-solucao funcao-sucessores operadores heuristica &optional (abertos (list no-inicial)) (fechados nil) (tempo-inicial (get-universal-time)) (nos-expandidos 0) (nos-gerados 0))
  "Funcao que implementa o algoritmo de procura A*"
  (cond
   ((null abertos) nil) ;Se abertos vazia falha

   (T
    (let* (
           (no-atual (first abertos)) 

           (abertos-sem-no-inicial (rest abertos))  ;Retira o primeiro no de abertos, o que possui o menor f

           (fechados-com-no-inicial (cons no-atual fechados)) ;Insere o primeiro no de abertos em fechados
          )

      (cond

       ;Verifica se o no atual e um no objetivo, se for devolve a solucao
       ((funcall funcao-solucao no-atual) (list no-atual tempo-inicial nos-expandidos nos-gerados))

       (T
        (let* (
               (sucessores (funcall funcao-sucessores no-atual operadores 'a* heuristica))  ;Expande o no

               (fechados-atualizados (remover-nos-com-menor-f-fechados sucessores fechados-com-no-inicial)) ;Primeiro remove todos os nos de fechados que possuam um f maior do que um mesmo no existente em sucessores

               (abertos-com-sucessores (abertos-a* abertos-sem-no-inicial sucessores fechados-atualizados)) ;Insere todos os sucessores nao existentes em abertos nem fechados na lista de abertos, atualiza os nos de abertos que tenham f's maiores do que os nos dos sucessores
              )

          (a* (first abertos-com-sucessores) funcao-solucao funcao-sucessores operadores heuristica abertos-com-sucessores fechados-atualizados tempo-inicial (1+ nos-expandidos) (+ nos-gerados (length sucessores)))

        )
       )
      )
      
    )
   )
  )
)



;; ida*

(defun ida* (no-inicial funcao-solucao funcao-sucessores operadores heuristica &optional (abertos (list no-inicial)) (fechados nil) (limiar (get-f-no no-inicial)) (tempo-inicial (get-universal-time)) (nos-expandidos 0) (nos-gerados 0) (no-inicial-original no-inicial))
  "Funcao que imlementa o algoritmo IDA*"
  (cond
   ((null abertos) nil) ;Se abertos vazio falha
   
   (T
    (let* (
           (no-atual (first abertos))

           (abertos-sem-no-inicial (rest abertos))

           (fechados-com-no-inicial (cons no-atual fechados))
          )

      (cond

       ((> (get-f-no no-atual) limiar)  ;Caso o no atual possua um f maior do que o limiar

        (cond
         ;Se existir um em abertos cujo seu f seja menor que o limiar, passa a ser esse o no atual
         ((existe-no-menor-limiar-p abertos-sem-no-inicial limiar) 
          (let* (
                 (novo-no-atual (procura-no-menor-limiar abertos-sem-no-inicial limiar))

                 (sucessores (funcall funcao-sucessores novo-no-atual operadores 'ida* heuristica))

                 (fechados-atualizados (remover-nos-com-menor-f-fechados sucessores fechados-com-no-inicial))

                 (abertos-com-sucessores (abertos-a* abertos-sem-no-inicial sucessores fechados-atualizados))
               )
            (ida* (first abertos-com-sucessores) funcao-solucao funcao-sucessores operadores heuristica abertos-com-sucessores fechados-atualizados limiar tempo-inicial (1+ nos-expandidos) (+ nos-gerados (length sucessores)) no-inicial-original )
          )
         )

         ;Se nao existir nenhum no em abertos cujo f seja menor que o limiar, entao muda-se o limiar para o minimo dos f's em abertos e comeca-se tudo outra vez
         (T (ida* no-inicial-original funcao-solucao funcao-sucessores operadores heuristica (list no-inicial-original) nil (novo-limiar abertos) tempo-inicial nos-expandidos nos-gerados no-inicial-original))
        )

       )

       ((funcall funcao-solucao no-atual) (list no-atual tempo-inicial nos-expandidos nos-gerados)) ;se o f do no-atual for menor ou igual que o limiar e no-atual for um no objetivo entao devolve-se o no atual

       (T 
        (let* (
               (sucessores (funcall funcao-sucessores no-atual operadores 'ida* heuristica))

               (fechados-atualizados (remover-nos-com-menor-f-fechados sucessores fechados-com-no-inicial))

               (abertos-com-sucessores (abertos-a* abertos-sem-no-inicial sucessores fechados-atualizados))
               )
          (ida* (first abertos-com-sucessores) funcao-solucao funcao-sucessores operadores heuristica abertos-com-sucessores fechados-atualizados limiar tempo-inicial (1+ nos-expandidos)(+ nos-gerados (length sucessores)) no-inicial-original)
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
   ((null sucessores) (sort abertos #'< :key #'get-f-no)) ;Ordena a lista de abertos por ordem crescente de f's

   ((and
     (not (no-existep (first sucessores) abertos))
     (not (no-existep (first sucessores) fechados))
    )(abertos-a* (append abertos (list (first sucessores))) (rest sucessores) fechados))  ;se o no nao existem em abertos nem fechados, insere-o

   (T (abertos-a* (substituir-no-abertos-a* (first sucessores) abertos) (rest sucessores) fechados))  ;Caso contrario, ja existe esse no e pode ou nao ser atualizado
   
  )
)





;; substituir-no-abertos-a*

(defun substituir-no-abertos-a* (no abertos)
  "Funcao que recebe como argumento um no proveniente da lista de sucessores. Com esse no esta funcao vai percorrer a lista de ABERTOS a procura de um no igual ao passado por argumento, se encontrar e se o no passado por argumento possuir um f menor entao substitui-se o que esta na lista de ABERTOS pelo no passado por argumento"
  (cond
   ((null abertos) nil)
   
   ((and
     (equal (get-estado-no no) (get-estado-no (first abertos))) ;Se o no-atual for igual ao no passado
     (equal (get-pecas-no no) (get-pecas-no (first abertos))) ;Se o no-atual for igual ao no passado
    )(cond
      ((< (get-f-no no) (get-f-no (first abertos))) (cons no (rest abertos))) ;Se o no passado tiver um no inferior ao que ja existe em abertos, substituir o que ja existe em abertos pelo no passado
      (T abertos) ;Caso contrario manter o no ja existente
     ))

   (T (cons (first abertos) (substituir-no-abertos-a* no (rest abertos))))
  )
)





;; remover-nos-com-menor-f-fechados

(defun remover-nos-com-menor-f-fechados (sucessores fechados)
  "Funcao que percorre a lista de sucessores enquato verifica se existe algum no identico na lista de FECHADOS, caso existe e caso o f do no-sucessor seja menor do que o no em FECHADOS entao retira-se o no de FECHADOS"
  (cond
   ((null sucessores) fechados)
   
   ((not (no-existep (first sucessores) fechados)) (remover-nos-com-menor-f-fechados (rest sucessores) fechados)) ;Se o no nao existe na lista de fechados entao passar ao proximo no

   (T (remover-nos-com-menor-f-fechados (rest sucessores) (atualizar-fechados-a* (first sucessores) fechados))) ;Se o no existe na lista de fechados entao pode ser removido caso o no dos sucessores tenha um f menor
  )
)




;; atualizar-fechados-a*

(defun atualizar-fechados-a* (no fechados)
  "Funcao que percorre a lista de FECHADOS verificando para cada no se o seu f e superiror ao f do no passado por argumento, caso seja retira-se o no da lista de FECHADOS"
  (apply #'append (mapcar #'(lambda (no-fechado)
              (cond
               ((and
                 (equal (get-estado-no no) (get-estado-no no-fechado))  ;Se o no-atual for igual ao no passado
                 (equal (get-pecas-no no) (get-pecas-no no-fechado))  ;Se o no-atual for igual ao no passado
                )(cond
                  ((< (get-f-no no) (get-f-no no-fechado)) nil) ;Se f do no existente em sucessores for menor do que o existente em fechados, entao retira-se o no existente em fechados (para por o no existente nos sucessores em abertos)
                  (T (list no-fechado)) ;Caso contrario mantem-se o no que ja tinhamos em fechados
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
  "Funcao que obtem o primeiro no, uma vez que a lista de abertos esta ordenada por ordem crescente de f's, cujo seu f seja menor que o atual limiar utilizado pelo algoritmo ida*"
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
     (equal (get-estado-no no) (get-estado-no (first lista))) ;Se o estado do no passado por argumento for igual ao estado do no que estamos a iterar neste momento
     (equal (get-pecas-no no) (get-pecas-no (first lista)))) T) ;Se as pecas do no passado por argumento forem iguais as pecas do no que estamos a iterar neste momento

   (T (no-existep no (rest lista)))

   )
)





;; existe-solucaop

(defun existe-solucaop (sucessores funcao-solucao)
  "Funcao que verifica se existe algum no objetivo numa determinada lista de sucessores"
  (eval (cons 'or (mapcar funcao-solucao sucessores)))
)





;; procura-no-objetivo

(defun procura-no-objetivo (sucessores funcao-solucao)
  "Funcao que procura o primeiro no objetivo de uma lista de sucessores"
  (cond
   ((null sucessores) nil)
   ((funcall funcao-solucao (first sucessores)) (first sucessores))
   (T (procura-no-objetivo (rest sucessores) funcao-solucao))
  )
)



;;;;;;;; Funcoes de Avaliacao da eficiencia ;;;;;;;;

;; fator-ramificacao

(defun fator-ramificacao(L nos-gerados &optional (limite-inferior 1) (limite-superior most-positive-fixnum) (margem-erro 0.00001) (limite-medio (/ (+ limite-inferior limite-superior) 2)))
  "Funcao que permite calcular o fator de ramificacao para um no. Aplica o metodo da bissecao para o calculo desta funcao com uma margem de erro de 0.00001"
  (cond
   ((< (- limite-superior limite-inferior) margem-erro) (float limite-medio)) ;Se a diferenca entre os limites for inferior a margem de erro entao podemos assumir com precisao que o fator de ramificacao encontra-se entre estes dois limites

   ((> (- (funcao-polinomial L limite-medio) nos-gerados) margem-erro) (fator-ramificacao L nos-gerados limite-inferior limite-medio margem-erro))  ;Caso o valor esteja mais perto do limite-inferior, diminui-se o limite superior

   (T (float (fator-ramificacao L nos-gerados limite-medio limite-superior margem-erro))) ;Caso o valor esteja mais perto do limite-superior, aumenta-se o limite inferior

  )
)



;; funcao-polinomial

(defun funcao-polinomial (grau polinomio)
  "Funcao que implementa o calculo de uma funcao polinomial"
    (cond
     ((= grau 1) polinomio)
     (T (+ (expt polinomio grau) (funcao-polinomial (1- grau) polinomio)))
    )
)



;; penetrancia

(defun penetrancia (L nos-gerados)
  "Funcao que permite calcular a penetrancia de um algoritmo, passando como argumentos a profundidade da solucao encontrada e o numero total de nos gerados"
  (cond
   ((not (zerop L)) (float (/ L nos-gerados)))
   (T 0)
  )
)
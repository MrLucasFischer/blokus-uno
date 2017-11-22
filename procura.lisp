;;;;Disciplina de IA - 2017/2018
;;;;Projeto 1 - Blokus Uno
;;;;Autor: Andreia Pereira (nº 150221021) e Lucas Fischer (nº 140221004)


;;;Implementacao dos algoritmos de procura

;;; Algoritmos

;; bfs
(defun bfs (no-inicial funcao-sucessores operadores &optional (abertos (list no-inicial)) (fechados nil))
  "Funcao que implementa o algoritmo de procura em largura"
  
  (cond

   ((null abertos) nil)

   (T 
    (let* (

           (no-atual (first abertos))

           (abertos-sem-no-inicial (rest abertos))

           (fechados-com-no-inicial (cons no-atual fechados))

           (sucessores (remover-nos-repetidos (funcall funcao-sucessores no-atual operadores 'bfs) abertos-sem-no-inicial fechados-com-no-inicial))

           (abertos-com-sucessores 
            (abertos-bfs abertos-sem-no-inicial sucessores)
           )

          )


      (cond

       ((existe-solucaop sucessores) (procura-no-objetivo sucessores))

       (T (bfs (first abertos-com-sucessores) funcao-sucessores operadores abertos-com-sucessores fechados-com-no-inicial))

      )


     )  
    )
  )
)


;; dfs

(defun dfs (no-inicial funcao-sucessores operadores profundidade &optional (abertos (list no-inicial)) (fechados nil))
  "Funcao que implementa o algoritmo de procura em profundidade"
   (cond

   ((null abertos) nil)

   (T 
    (let* (

           (no-atual (first abertos))

           (abertos-sem-no-inicial (rest abertos))

           (fechados-com-no-inicial (cons no-atual fechados))

          )

      (cond

       ((> (get-profundidade-no no-atual) profundidade) (dfs (first abertos-sem-no-inicial) funcao-sucessores operadores profundidade abertos-sem-no-inicial fechados-com-no-inicial))

       (T 
        (let* (

               (sucessores (remover-nos-repetidos (funcall funcao-sucessores no-atual operadores 'dfs profundidade) abertos-sem-no-inicial fechados-com-no-inicial))

               (abertos-com-sucessores 
                (abertos-dfs abertos-sem-no-inicial sucessores)
               )

              )
              
          (cond

           ((existe-solucaop sucessores) (procura-no-objetivo sucessores))
           
           (T (dfs (first abertos-com-sucessores) funcao-sucessores operadores profundidade abertos-com-sucessores fechados-com-no-inicial))
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
  "Funcao que constroi a lista de abertos segundo o algoritmo bfs"
  (append abertos sucessores)
)


;; abertos-dfs

(defun abertos-dfs (abertos sucessores)
  "Funcao que constroi a lista de abertos segundo o algoritmo dfs"
  (append sucessores abertos)
)


(defun remover-no (no lista)
  "Funcao que remove um no de uma determinada lista"
  (cond
   ((null lista) nil)
   ((equal no (first lista)) (remover-no no (rest lista)) )
   (T (cons (first lista) (remover-no no (rest lista))))
  )
)

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

(defun existe-solucaop (sucessores)
  "Funcao que determina se numa lista de sucessores esta presente algum no objetivo ou nao"
  (eval (cons 'or (mapcar #'no-objetivo-p sucessores)))
)

;; procura-no-objetivo

(defun procura-no-objetivo (sucessores)
  "Funcao que retorna um no objetivo caso este esteja presente na lista de sucessores passada por argumento"
  (cond
   ((null sucessores) nil)
   ((no-objetivo-p (first sucessores)) (first sucessores))
   (T (procura-no-objetivo (rest sucessores)))
  )
)
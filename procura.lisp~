;;;;Disciplina de IA - 2017/2018
;;;;Projeto 1 - Blokus Uno
;;;;Autor: Andreia Pereira (nº 150221021) e Lucas Fischer (nº 140221004)


;;;Implementacao dos algoritmos de procura

;;; Algoritmos

;; bfs
(defun bfs (no-inicial funcao-solucao funcao-sucessores operadores &optional (abertos (list no-inicial)) (fechados nil))
  "Funcao que implementa o algoritmo de procura em largura"
  (cond

   ((null abertos) nil)

   (T 
    (let* (

           (no-atual (first abertos))

           (abertos-sem-no-inicial (remover-no no-atual abertos))

           (fechados-com-no-inicial (cons no-atual fechados))

           (sucessores (remover-nos-repetidos (funcall funcao-sucessores no-atual operadores 'bfs) abertos-sem-no-inicial fechados-com-no-inicial 'bfs))

           (abertos-com-sucessores 
            (abertos-bfs abertos-sem-no-inicial sucessores)
           )

          )

      (cond

       ((existe-solucaop sucessores) (procura-no-objetivo sucessores))

       (T (bfs (first abertos-com-sucessores) funcao-solucao funcao-sucessores operadores abertos-com-sucessores fechados-com-no-inicial))

      )

     )  
    )
  )
)


;; dfs

(defun dfs (no-inicial funcao-solucao funcao-sucessores operadores profundidade &optional (abertos (list no-inicial)) (fechados nil))
  "Funcao que implementa o algoritmo de procura em profundidade"
   (cond

   ((null abertos) nil)

   (T 
    (let* (

           (no-atual (first abertos))

           (abertos-sem-no-inicial (remover-no no-atual abertos))

           (fechados-com-no-inicial (cons no-atual fechados))

          )

      (cond

       ((> (no-profundidade no-atual) profundidade) (dfs (first abertos-sem-no-inicial) funcao-solucao funcao-sucessores operadores profundidade abertos-sem-no-inicial fechados-com-no-inicial))

       (T 
        (let* (

               (sucessores (remover-nos-repetidos (funcall funcao-sucessores no-atual operadores 'dfs profundidade) abertos-sem-no-inicial fechados-com-no-inicial 'dfs))

               (abertos-com-sucessores 
                (abertos-dfs abertos-sem-no-inicial sucessores)
               )

              )
              
          (cond

           ((existe-solucaop sucessores) (procura-no-objetivo sucessores))
           
           (T (dfs (first abertos-com-sucessores) funcao-solucao funcao-sucessores operadores profundidade abertos-com-sucessores fechados-com-no-inicial))
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

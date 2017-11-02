;;;; puzzle.lisp
;;;; Disciplina de IA - 2017/2018
;;;; Projeto 1 - Blokus Uno
;;;; Autor: Andreia Pereira (nº 150221021) e Lucas Fischer (nº 140221004)
;;;; Funções do domínio do problema

;;;Tabuleiros

;;tabuleiro-vazio
(defun tabuleiro-vazio ()
  "Função que retorna um tabuleiro vazio"
  (list 
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0 0 0 0 0 0 0)
  )
)


;;; Construtor

;;Cria-no
(defun cria-no (estado &optional (profundidade 0) (heuristica nil) (no-pai nil))
  "Cria uma lista que representa um nó que tem um estado. Este nó pode também ter uma profunidade, heuristica e um nó que o gerou"
  (list estado profundidade heuristica no-pai)
)


;;; Getters

;;get-estado-no
(defun get-estado-no (no)
  "Funcao que retorna o estado de um nó"
  (first no)
)

;;get-profundidade-no 
(defun get-profundidade-no (no)
  "Função que retorna a profundidade de um nó"
  (second no)
)

;;get-heuristica-no
(defun get-heuristica-no (no)
  "Função que retorna a heuristica de um nó"
  (third no)
)

;;get-pai-no
(defun get-pai-no (no)
  "Função que retorna o nó gerador de um determinado nó"
  (fourth no)
)

;;; Função f(n) = g(n) + h(n)

;;custo
(defun custo (no)
  "Implementa a função do custo de um nó, f(n)"
  (+ (get-profundidade-no no) (get-heuristica-no no))
)

;;;Funções auxiliares
;;;Verificar se pode-se colocar a peça por exemplo
(defun inserir-peca-pequena-na-coluna (coluna lista)
  "Permite inserir a peça mais pequena numa determinada coluna da lista passada como argumento"
  (cond 
   ((null lista) nil)

   ((= coluna 1) (cons 1 (rest lista)))

   (T (cons (first lista) (inserir-peca-pequena-na-coluna (1- coluna) (rest lista))))

  )


)




;;; Operadores

;;inserir a peça mais pequenina
(defun inserir-peca-pequena (linha coluna tabuleiro)
  "Função que permite inserir a peça mais pequena numa determinada linha e coluna. A linha e coluna são argumentos numéricos"
  (cond
   ((null tabuleiro) nil)

   ((= linha 1) (cons (inserir-peca-pequena-na-coluna coluna (first tabuleiro)) (rest tabuleiro)))

   (t (cons (first tabuleiro) (inserir-peca-pequena (1- linha) coluna (rest tabuleiro))))

  )
)



;;inserir a peça media
;;inserir a peça que parece um mais 
;;será que há mais operadores ?

;;; Heuristicas

;;; Solução
;;;; puzzle.lisp
;;;; Disciplina de IA - 2017/2018
;;;; Projeto 1 - Blokus Uno
;;;; Autor: Andreia Pereira (n� 150221021) e Lucas Fischer (n� 140221004)
;;;; Fun��es do dom�nio do problema

;;;Tabuleiros

;;tabuleiro-vazio
(defun tabuleiro-vazio ()
  "Fun��o que retorna um tabuleiro vazio"
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
  "Cria uma lista que representa um n� que tem um estado. Este n� pode tamb�m ter uma profunidade, heuristica e um n� que o gerou"
  (list estado profundidade heuristica no-pai)
)


;;; Getters

;;get-estado-no
(defun get-estado-no (no)
  "Funcao que retorna o estado de um n�"
  (first no)
)

;;get-profundidade-no 
(defun get-profundidade-no (no)
  "Fun��o que retorna a profundidade de um n�"
  (second no)
)

;;get-heuristica-no
(defun get-heuristica-no (no)
  "Fun��o que retorna a heuristica de um n�"
  (third no)
)

;;get-pai-no
(defun get-pai-no (no)
  "Fun��o que retorna o n� gerador de um determinado n�"
  (fourth no)
)

;;; Fun��o f(n) = g(n) + h(n)

;;custo
(defun custo (no)
  "Implementa a fun��o do custo de um n�, f(n)"
  (+ (get-profundidade-no no) (get-heuristica-no no))
)

;;;Fun��es auxiliares
;;;Verificar se pode-se colocar a pe�a por exemplo
(defun inserir-peca-pequena-na-coluna (coluna lista)
  "Permite inserir a pe�a mais pequena numa determinada coluna da lista passada como argumento"
  (cond 
   ((null lista) nil)

   ((= coluna 1) (cons 1 (rest lista)))

   (T (cons (first lista) (inserir-peca-pequena-na-coluna (1- coluna) (rest lista))))

  )


)




;;; Operadores

;;inserir a pe�a mais pequenina
(defun inserir-peca-pequena (linha coluna tabuleiro)
  "Fun��o que permite inserir a pe�a mais pequena numa determinada linha e coluna. A linha e coluna s�o argumentos num�ricos"
  (cond
   ((null tabuleiro) nil)

   ((= linha 1) (cons (inserir-peca-pequena-na-coluna coluna (first tabuleiro)) (rest tabuleiro)))

   (t (cons (first tabuleiro) (inserir-peca-pequena (1- linha) coluna (rest tabuleiro))))

  )
)



;;inserir a pe�a media
;;inserir a pe�a que parece um mais 
;;ser� que h� mais operadores ?

;;; Heuristicas

;;; Solu��o
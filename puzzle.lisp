;;;; puzzle.lisp
;;;; Disciplina de IA - 2017/2018
;;;; Projeto 1 - Blokus Uno
;;;; Autor: Andreia Pereira (n 150221021) e Lucas Fischer (n 140221004)
;;;; Funcoes do dominio do problema

;;;Tabuleiros

;;tabuleiro-vazio
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
  "Cria uma lista que representa um no que tem um estado. Este no pode tambem ter uma profunidade, heuristica e um no que o gerou"
  (list estado profundidade heuristica no-pai)
)


;;; Getters

;;get-estado-no
(defun get-estado-no (no)
  "Funcao que retorna o estado de um no"
  (first no)
)



;;get-profundidade-no 
(defun get-profundidade-no (no)
  "Funcao que retorna a profundidade de um no"
  (second no)
)



;;get-heuristica-no
(defun get-heuristica-no (no)
  "Funcao que retorna a heuristica de um no"
  (third no)
)



;;get-pai-no
(defun get-pai-no (no)
  "Funcao que retorna o no gerador de um determinado no"
  (fourth no)
)



;;; Funcao f(n) = g(n) + h(n)

;;custo
(defun custo (no)
  "Implementa a funcao de custo de um no, f(n)"
  (+ (get-profundidade-no no) (get-heuristica-no no))
)



;;;Funcoes auxiliares
;;inserir-peca-pequena-na-coluna
(defun inserir-peca-pequena-na-coluna (coluna lista)
  "Permite inserir a peca mais pequena numa determinada coluna da lista passada como argumento"
  (cond 
   ((null lista) nil)

   ((= coluna 1) (cons 1 (rest lista)))

   (t 
    (cons 
      (first lista) 
      (inserir-peca-pequena-na-coluna (1- coluna) (rest lista))
    )
   )

  )
)



;;construir-listas
(defun construir-listas (elems listas)
  "Funcao auxiliar que permite juntar os elementos removidos da cabeca das listas novamente com as mesmas de forma a manter a integridade das listas"
  (mapcar #'cons elems listas)
)



;;inserir-peca-media-na-coluna
(defun inserir-peca-media-na-coluna (coluna linhas)
  "Funcao que permite inserir uma peca media numa determinada coluna colocando o primeiro quadrado no canto superior esquerdo da peca"
  (let ((linha-cima (first linhas)) (linha-baixo (second linhas)))
    (cond
     ((null linha-cima) nil)

     ((= coluna 1) 
      (list
       (append '(1 1) (rest (rest linha-cima))) ;;cddr ou será que aqui uso o inserir-peca-pequena-na-coluna para depois quando tivermos a cena da validação ser mais facil (?)
       (append '(1 1) (rest (rest linha-baixo))) ;;cddr
       )
      )

     (t
      (construir-listas
       (list
        (first linha-cima)
        (first linha-baixo)
       )
        (inserir-peca-media-na-coluna 
          (1- coluna)
          (list
            (rest linha-cima)
            (rest linha-baixo)
          )
        )
      )
     )

    )
  )
)




;;inserir-peca-cruz-na-coluna
(defun inserir-peca-cruz-na-coluna (coluna linhas)
  "Funcao auxiliar da funcao inserir-peca-cruz que permite inserir uma peca em cruz numa determinada colocando o primeiro quadrado na ponta esquerda da peca"
  (let ((linha-cima (first linhas)) 
        (linha-meio (second linhas))
        (linha-baixo (third linhas)))

    (cond
     ((null linha-meio) nil)
     
     ((= coluna 1)
      (list
       (cons (first linha-cima) (cons 1 (rest (rest linha-cima))))
       (append '(1 1 1) (rest (rest (rest linha-meio))))
       (cons (first linha-baixo) (cons 1 (rest (rest linha-baixo))))
      )
     )

     (t
      (construir-listas
       (list
        (first linha-cima)
        (first linha-meio)
        (first linha-baixo)
       )
       (inserir-peca-cruz-na-coluna 
        (1- coluna)
        (list
         (rest linha-cima)
         (rest linha-meio)
         (rest linha-baixo)
        )
       )
      )
     )

    )
  )
)



;;; Operadores

;;inserir-peca-pequena
;;;;;;;Falta fazer a verificacao se pode ou nao inserir nesta casa
(defun inserir-peca-pequena (linha coluna tabuleiro)
  "Funcao que permite inserir a peca mais pequena numa determinada linha e coluna. A linha e coluna sao argumentos numericos"
  (cond
   ((null tabuleiro) nil)

   ((= linha 1) (cons (inserir-peca-pequena-na-coluna coluna (first tabuleiro)) (rest tabuleiro)))

   (t 
    (cons 
     (first tabuleiro) 
     (inserir-peca-pequena (1- linha) coluna (rest tabuleiro)))
    )

  )
)



;;inserir-peca-media   
;;;;;;;Falta fazer a verificacao se pode ou nao inserir nesta casa
(defun inserir-peca-media (linha coluna tabuleiro)
  "Funcao que permite inserir a peca media numa determinada linha e coluna do tabuleiro passado por argumento. A linha e coluna sao argumentos numericos"
  (cond 
   ((null tabuleiro) nil)

   ((or (= linha 14) (= coluna 14)) nil) ;;Nao pode inserir na ultima linha ou coluna,so na penultima

   ((= linha 1) 
    (append 
     (inserir-peca-media-na-coluna coluna (list (first tabuleiro) (second tabuleiro))) 
     (rest (rest tabuleiro)) ;;cddr
    )
   )

   (t
    (cons 
     (first tabuleiro) 
     (inserir-peca-media (1- linha) coluna (rest tabuleiro))
    )
   )

  )
)



;;inserir-peca-cruz
(defun inserir-peca-cruz (linha coluna tabuleiro)
  "Funcao que permite inserir uma peca em cruz no tabuleiro passado como argumento numa determinada linha e coluna. A linha e coluna sao argumentos numericos"
  (cond
   ((or (null tabuleiro) (= linha 14) (> coluna 12) (= linha 1)) nil)
   
   ((= linha 2) ;;tem que ser uma linha antes para por a peca de cima
    (append
     (inserir-peca-cruz-na-coluna 
      coluna 
      (list 
       (first tabuleiro) 
       (second tabuleiro) 
       (third tabuleiro)
      )
     )
     (rest (rest (rest tabuleiro))) ;;cdddr
    )
   )

   (t
    (cons
     (first tabuleiro)
     (inserir-peca-cruz (1- linha) coluna (rest tabuleiro))
    )
   )

  )
)



;;; Heuristicas

;;; Solucao
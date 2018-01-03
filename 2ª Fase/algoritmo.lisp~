;;;;Disciplina de IA - 2017/2018
;;;;Projeto 1 - Blokus Uno
;;;;Autor: Andreia Pereira (n 150221021) e Lucas Fischer (n 140221004)
;;;Implementacao do Algoritmo AlfaBeta e da funcao sucessores
;;;;;;;; Sucessores ;;;;;;;;

;; sucessores 

(defun sucessores (no operadores)
  "Funcao que devolve a lista de todos os sucessores de um determinado no passado como argumento"

  (apply #'append (mapcar #'(lambda(operador)
                              (aplicar-operador-no no operador)
                            ) operadores))
)






;;aplicar-operador-no

(defun aplicar-operador-no (no operador)
  "Funcao que aplica apenas um operador a um determinado no. Consoante o operador passado por argumento esta funcao ira determinar as jogadas possiveis para esse operador e ira criar um no (um sucessor) para cada uma dessas jogadas possives"
  (let
    (
     (jogadas-possiveis 
      (cond
       ((equal operador 'inserir-peca-pequena)
        (jogadas-possiveis (get-estado-no no) 'pequena (get-valor-jogador-no no)))

       ((equal operador 'inserir-peca-media)
        (jogadas-possiveis (get-estado-no no) 'media (get-valor-jogador-no no)))

       ((equal operador 'inserir-peca-cruz)
        (jogadas-possiveis (get-estado-no no) 'cruz (get-valor-jogador-no no)))
      )
     )

;;Jogador 1

     (numero-peca-pequena-jogador1 
      (cond
       ((not (= (get-valor-jogador-no no) 1)) (first (get-pecas-jogador1-no no)))
       (T (cond
           ((equal operador 'inserir-peca-pequena)
            (1- (first (get-pecas-jogador1-no no)))
           )
           (T (first (get-pecas-jogador1-no no)))
          )
       )
      )
     )

     (numero-peca-media-jogador1 
      (cond
       ((not (= (get-valor-jogador-no no) 1)) (second (get-pecas-jogador1-no no)))
       (T (cond
           ((equal operador 'inserir-peca-media)
            (1- (second (get-pecas-jogador1-no no)))
            )
           (T (second (get-pecas-jogador1-no no)))
          )
       )
      )
     )



     (numero-peca-cruz-jogador1 
      (cond
       ((not (= (get-valor-jogador-no no) 1)) (third (get-pecas-jogador1-no no)))
       (T (cond
           ((equal operador 'inserir-peca-cruz)
            (1- (third (get-pecas-jogador1-no no)))
            )
           (T (third (get-pecas-jogador1-no no)))
          )
       )
      )
     )

;; Jogador 2


     (numero-peca-pequena-jogador2 
      (cond
       ((not (= (get-valor-jogador-no no) 2)) (first (get-pecas-jogador2-no no)))
       (T (cond
           ((equal operador 'inserir-peca-pequena)
            (1- (first (get-pecas-jogador2-no no)))
            )
           (T (first (get-pecas-jogador2-no no)))
          )
       )
      )
     )


     (numero-peca-media-jogador2 
      (cond
       ((not (= (get-valor-jogador-no no) 2)) (second (get-pecas-jogador2-no no)))
       (T (cond
           ((equal operador 'inserir-peca-media)
            (1- (second (get-pecas-jogador2-no no)))
            )
           (T (second (get-pecas-jogador2-no no)))
          )
       )
      )
     )


     (numero-peca-cruz-jogador2 
      (cond
       ((not (= (get-valor-jogador-no no) 2)) (third (get-pecas-jogador2-no no)))
       (T (cond
           ((equal operador 'inserir-peca-cruz)
            (1- (third (get-pecas-jogador2-no no)))
            )
           (T (third (get-pecas-jogador2-no no)))
          )
       )
      )
     )
     
    )
    
    (cond
     ((and (= (get-valor-jogador-no no) 1) (equal operador 'inserir-peca-pequena) (< numero-peca-pequena-jogador1 0)) nil) ;Se nao existir pecas para o operador que queremos usar, devolve nil
     ((and (= (get-valor-jogador-no no) 1) (equal operador 'inserir-peca-media) (< numero-peca-media-jogador1 0)) nil)
     ((and (= (get-valor-jogador-no no) 1) (equal operador 'inserir-peca-cruz) (< numero-peca-cruz-jogador1 0)) nil)
     ((and (= (get-valor-jogador-no no) 2) (equal operador 'inserir-peca-pequena) (< numero-peca-pequena-jogador2 0)) nil)
     ((and (= (get-valor-jogador-no no) 2) (equal operador 'inserir-peca-media) (< numero-peca-media-jogador2 0)) nil)
     ((and (= (get-valor-jogador-no no) 2) (equal operador 'inserir-peca-cruz) (< numero-peca-cruz-jogador2 0)) nil)
     
     (T 
      (mapcar #'(lambda (jogada)
                  (let* (
                        (estado (funcall operador (first jogada) (second jogada) (get-estado-no no) (get-valor-jogador-no no)))
                        (pecas-jogador1 (list numero-peca-pequena-jogador1 numero-peca-media-jogador1 numero-peca-cruz-jogador1))
                        (pecas-jogador2 (list numero-peca-pequena-jogador2 numero-peca-media-jogador2 numero-peca-cruz-jogador2))
                        (profundidade-novo-no (1+ (get-profundidade-no no)))
                       )
                    (cria-no estado pecas-jogador1 pecas-jogador2 profundidade-novo-no no (trocar-jogador no) (trocar-tipo-no no))
                 )
                ) jogadas-possiveis)
      )
    )
  )
)


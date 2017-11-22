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

(defun tabuleiro-teste ()
  "Funcao que retorna um tabuleiro de teste para a contagem de pecas"
  (list 
   '(0 0 0 0 2 2 0 0 2 0 2 0 2 0)
   '(0 0 0 0 2 2 0 2 2 2 0 2 2 2)
   '(0 0 0 2 0 0 2 0 2 0 2 0 2 0)
   '(0 2 2 0 0 2 2 2 0 2 2 2 0 2)
   '(0 2 2 0 2 0 2 0 2 0 2 0 2 0)
   '(0 0 0 2 2 2 0 2 2 2 0 2 2 2)
   '(0 2 2 0 2 0 2 0 2 0 2 0 2 0)
   '(0 2 2 0 0 2 2 2 0 2 2 2 0 2)
   '(0 0 0 0 2 0 2 0 2 0 2 0 2 0)
   '(0 0 0 2 2 2 0 2 2 2 0 2 2 2)
   '(0 0 2 1 2 1 2 0 2 0 2 0 2 0)
   '(1 2 2 2 1 2 2 2 0 2 2 2 0 0)
   '(0 1 2 1 2 0 2 0 2 0 2 0 2 2)
   '(1 0 1 2 1 2 0 2 0 2 0 0 2 2)
  )
)


(defun tabuleiro-c ()
  "Funcao que retorna um tabuleiro de teste para a contagem de pecas"
  (list 
   '(0 0 0 0 2 2 0 0 2 0 2 0 2 0)
   '(0 0 0 0 2 2 0 2 2 2 0 2 2 2)
   '(0 0 0 2 0 0 2 0 2 0 2 0 2 0)
   '(0 2 2 0 0 2 2 2 0 2 2 2 0 2)
   '(0 2 2 0 0 0 2 0 2 0 2 0 2 0)
   '(0 0 0 0 0 0 0 2 2 2 0 2 2 2)
   '(0 0 0 0 0 0 2 0 2 0 2 0 2 0)
   '(0 0 0 0 0 2 2 2 0 2 2 2 0 2)
   '(0 0 0 0 2 0 2 0 2 0 2 0 2 0)
   '(0 0 0 2 2 2 0 2 2 2 0 2 2 2)
   '(0 0 2 1 2 1 2 0 2 0 2 0 2 0)
   '(1 2 2 2 1 2 2 2 0 2 2 2 0 0)
   '(0 1 2 1 2 0 2 0 2 0 2 0 2 2)
   '(1 0 1 2 1 2 0 2 0 2 0 0 2 2)
  )
)

(defun tabuleiro-f ()
  "Funcao que retorna um tabuleiro vazio"
  (list 
   '(0 0 0 0 0 0 0 0 0 0 0 0 2 2)
   '(0 0 0 0 0 0 0 0 0 0 0 0 2 2)
   '(0 0 0 0 0 0 0 0 0 0 2 2 0 0)
   '(0 0 0 0 0 0 0 0 0 0 2 2 0 0)
   '(0 0 0 0 2 2 0 0 2 2 0 0 0 0)
   '(0 0 0 0 2 2 0 0 2 2 0 0 0 0)
   '(0 0 0 0 0 0 2 2 0 0 0 0 0 0)
   '(0 0 0 0 0 0 2 2 0 0 0 0 0 0)
   '(0 0 0 0 2 2 0 0 2 2 0 0 0 0)
   '(0 0 0 0 2 2 0 0 2 2 0 0 0 0)
   '(0 0 2 2 0 0 0 0 0 0 0 0 0 0)
   '(0 0 2 2 0 0 0 0 0 0 0 0 0 0)
   '(2 2 0 0 0 0 0 0 0 0 0 0 0 0)
   '(2 2 0 0 0 0 0 0 0 0 0 0 0 0)
  )
)


(defun no-teste ()
  "Funcao que cria um no teste"
  (cria-no (tabuleiro-c)
           (list 
            (- 10 (peca-contagem (tabuleiro-teste) 'pequena))
            (- 10 (peca-contagem (tabuleiro-teste) 'media))
            (- 15 (peca-contagem (tabuleiro-teste) 'cruz))
           )
           0 nil nil)
)

;;; Construtor

;;Cria-no
(defun cria-no (estado pecas &optional (profundidade 0) (heuristica nil) (no-pai nil))
  "Cria uma lista que representa um no que tem um estado. Este no pode tambem ter uma profunidade, heuristica e um no que o gerou"
  (list estado pecas profundidade heuristica no-pai)
)


;;; Getters

;;get-estado-no
(defun get-estado-no (no)
  "Funcao que retorna o estado de um no"
  (first no)
)


;;get-pecas-no
(defun get-pecas-no (no)
  "Funcao que retorna uma lista com 3 elementos que identificam o numero de pecas pequenas, o numero de pecas medias e o numero de pecas em cruz respetivamente"
  (second no)
)


;;get-profundidade-no 
(defun get-profundidade-no (no)
  "Funcao que retorna a profundidade de um no"
  (third no)
)


;;get-heuristica-no
(defun get-heuristica-no (no)
  "Funcao que retorna a heuristica de um no"
  (fourth no)
)


;;get-pai-no
(defun get-pai-no (no)
  "Funcao que retorna o no gerador de um determinado no"
  (fifth no)
)


;;; Funcao f(n) = g(n) + h(n)

;;custo
(defun custo (no)
  "Implementa a funcao de custo de um no, f(n)"
  (+ (get-profundidade-no no) (get-heuristica-no no))
)



;;;Funcoes auxiliares

;;peca-contagem
(defun peca-contagem (tabuleiro tipo-peca &optional (linha 13) (coluna 13))
  "Funcao que permite contar o numero de pecas do jogador existentes no tabuleiro conforme o seu tipo"
  (cond
   ((and (zerop linha) (zerop coluna)) 
    (cond
     ((eq (nth 0 (nth 0 tabuleiro)) 1) (tipo-pecap linha coluna tabuleiro tipo-peca))
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
       (casa-com-ump linha (1+ coluna) tabuleiro)
       (casa-com-ump linha (1- coluna) tabuleiro)
       (casa-com-ump (1+ linha) coluna tabuleiro)
       (casa-com-ump (1- linha) coluna tabuleiro)
       ) 0)
     (T 1)
     )
   )

   ((equal tipo-peca 'media)
    (cond
     ((and
       (casa-com-ump linha (1- coluna) tabuleiro)
       (casa-com-ump (1- linha) coluna tabuleiro)
       (casa-com-ump (1- linha) (1- coluna) tabuleiro)
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
       (casa-com-ump (1- linha) coluna tabuleiro)
       (casa-com-ump (1- linha) (1- coluna) tabuleiro)
       (casa-com-ump (1- linha) (1+ coluna) tabuleiro)
       (casa-com-ump (- linha 2) coluna tabuleiro)
      ) 1)
     (T 0)
    )
   )

   (T nil)

  )
)

;; jogada-in-jogadas-possiveis-p 
(defun jogada-in-jogadas-possiveis-p (jogada tabuleiro tipo-peca)
  (let (
        (jogadas-possiveis (funcall #'jogadas-possiveis tabuleiro tipo-peca))
       )
    (eval (cons 'or (mapcar #'(lambda (jogada-possivel) 
                                (cond
                                 ((equal jogada-possivel jogada) T)
                                 (T nil)
                                 )
                                ) jogadas-possiveis))) 
  )
)

;;quadrados-por-preencher-numa-linha
(defun quadrados-por-preencher-numa-linha (linha)
  "Conta o numero de quadrados por preencher numa determinada linha (posicoes que estao a 0 nessa linha)"
  (cond
   ((null linha) 0)
   ((zerop (first linha)) (+ 1 (quadrados-por-preencher-numa-linha (rest linha))))
   (T (quadrados-por-preencher-numa-linha (rest linha)))
  )
)


;;quadrados-por-preencher
(defun quadrados-por-preencher (tabuleiro)
  "Conta o numero de posicoes que estao a 0 num tabuleiro, que corresponde ao numero de quadrados por preencher num tabuleiro"
  (cond
   ((null tabuleiro) 0)
   (T (+ (quadrados-por-preencher-numa-linha (first tabuleiro)) (quadrados-por-preencher (rest tabuleiro))))
  )
)


;;quadrados-ja-preenchidos
(defun quadrados-ja-preenchidos (tabuleiro)
  "Funcao que conta o numero de quadrados ja preenchidos atraves da subtracao do total pelo numero de quadrados por preencher"
  (- 196 (quadrados-por-preencher tabuleiro))
)



;;construir-listas
(defun construir-listas (elems listas)
  "Funcao auxiliar que permite juntar os elementos removidos da cabeca das listas novamente com as mesmas de forma a manter a integridade das listas"
  (mapcar #'cons elems listas)
)



;;inserir-peca-pequena-na-coluna
(defun inserir-peca-pequena-na-coluna (coluna lista)
  "Permite inserir a peca mais pequena numa determinada coluna da lista passada como argumento"
  (cond 
   ((null lista) nil)

   ((= coluna 0) (cons 1 (rest lista)))

   (T 
    (cons 
      (first lista) 
      (inserir-peca-pequena-na-coluna (1- coluna) (rest lista))
    )
   )

  )
)



;;inserir-peca-media-na-coluna
(defun inserir-peca-media-na-coluna (coluna linhas)
  "Funcao que permite inserir uma peca media numa determinada coluna colocando o primeiro quadrado no canto superior esquerdo da peca"
  (let ((linha-cima (first linhas)) (linha-baixo (second linhas)))
    (cond
     ((null linha-cima) nil)

     ((= coluna 0) 
      (list
       (append '(1 1) (rest (rest linha-cima))) ;;cddr ou ser� que aqui uso o inserir-peca-pequena-na-coluna para depois quando tivermos a cena da valida��o ser mais facil (?)
       (append '(1 1) (rest (rest linha-baixo))) ;;cddr
       )
      )

     (T
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
     
     ((= coluna 0)
      (list
       (cons (first linha-cima) (cons 1 (rest (rest linha-cima))))
       (append '(1 1 1) (rest (rest (rest linha-meio))))
       (cons (first linha-baixo) (cons 1 (rest (rest linha-baixo))))
      )
     )

     (T
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
(defun inserir-peca-pequena (linha coluna tabuleiro &optional (linha-original linha) (coluna-original coluna) (tabuleiro-original tabuleiro))
  "Funcao que permite inserir a peca mais pequena numa determinada linha e coluna. A linha e coluna sao argumentos numericos"
  (cond
   ((null tabuleiro) nil)

   ((not (jogada-in-jogadas-possiveis-p (list linha-original coluna-original) tabuleiro-original 'pequena)) nil)

   ((= linha 0) (cons (inserir-peca-pequena-na-coluna coluna (first tabuleiro)) (rest tabuleiro)))

   (T 
    (cons 
     (first tabuleiro) 
     (inserir-peca-pequena (1- linha) coluna (rest tabuleiro) linha-original coluna-original tabuleiro-original))
    )

  )
)



;;inserir-peca-media   
;;;;;;;Falta fazer a verificacao se pode ou nao inserir nesta casa
(defun inserir-peca-media (linha coluna tabuleiro &optional (linha-original linha) (coluna-original coluna) (tabuleiro-original tabuleiro))
  "Funcao que permite inserir a peca media numa determinada linha e coluna do tabuleiro passado por argumento. A linha e coluna sao argumentos numericos"
  (cond 
   ((null tabuleiro) nil)

   ((not (jogada-in-jogadas-possiveis-p (list linha-original coluna-original) tabuleiro-original 'media)) nil)

   ((= linha 0) 
    (append 
     (inserir-peca-media-na-coluna coluna (list (first tabuleiro) (second tabuleiro))) 
     (rest (rest tabuleiro)) ;;cddr
    )
   )

   (T
    (cons 
     (first tabuleiro) 
     (inserir-peca-media (1- linha) coluna (rest tabuleiro) linha-original coluna-original tabuleiro-original)
    )
   )

  )
)



;;inserir-peca-cruz
(defun inserir-peca-cruz (linha coluna tabuleiro &optional (linha-original linha) (coluna-original coluna) (tabuleiro-original tabuleiro) )
  "Funcao que permite inserir uma peca em cruz no tabuleiro passado como argumento numa determinada linha e coluna. A linha e coluna sao argumentos numericos"
  (cond
   ((null tabuleiro) nil)

   ((not (jogada-in-jogadas-possiveis-p (list linha-original coluna-original) tabuleiro-original 'cruz)) nil)
   
   ((= linha 1) ;;tem que ser uma linha antes para por a peca de cima
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

   (T
    (cons
     (first tabuleiro)
     (inserir-peca-cruz (1- linha) coluna (rest tabuleiro) linha-original coluna-original tabuleiro-original)
    )
   )

  )
)

;;operadores
(defun operadores ()
  "Funcao que lista todos os operadores existentes no dominio do problema"
  (list 'inserir-peca-pequena 'inserir-peca-media 'inserir-peca-cruz)
)

;;;Sucessores 

;;Sucessores 
;;;Esta funcao ha de ir para o ficheiro procura.lisp por enquanto esta aqui para teste

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
;;;Esta funcao ha de ir para o ficheiro procura.lisp por enquanto esta aqui para teste
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
                  (cria-no 
                   (funcall operador (first jogada) (second jogada) (get-estado-no no))
                   (list numero-peca-pequena numero-peca-media numero-peca-cruz)
                   (1+ (get-profundidade-no no)) 
                   (get-heuristica-no no) 
                   no
                  ) ;; a heuristica ha de mudar i guess, ha de ter que ser calculada
                 ) jogadas-possiveis)
      )
    )
  )
)

;;; Jogadas possiveis

;; jogadas-possives

(defun jogadas-possiveis (tabuleiro tipo-peca)
  "Funcao que determina todas as jogadas possiveis para um tipo de peca num determinado tabuleiro, devolvendo-as numa lista"
  (cond
   ((and

     (zerop (nth 0 (nth 0 tabuleiro)))
     (zerop (nth 13 (nth 0 tabuleiro)))
     (zerop (nth 0 (nth 13 tabuleiro)))
     (zerop (nth 13 (nth 13 tabuleiro))) ;caso ainda nao haja pecas nossas nos cantos ainda
     )
    (cond
     ((equal tipo-peca 'pequena) (list '(0 0) '(0 13)'(13 0) '(13 13)))
     ((equal tipo-peca 'media) (list '(0 0) '(0 12)'(12 0) '(12 12)))
     (T nil)
     )
    )

    (T (percorre-matriz-peca tabuleiro tipo-peca))
   )
)



;; percorre-matriz-peca

(defun percorre-matriz-peca (tabuleiro tipo-peca &optional (linha 13) (coluna 13))
  "Funcao que percorre a matriz a partir do seu fim e caso encontre alguma peca jogada pelo jogador ira verificar se e possivel colocar uma nova peca num dos seus cantos"
  (cond
   ((and (zerop linha) (zerop coluna)) ;;Ja percorreu a matriz inteira e esta na posicao (0,0) 
      (cond

        ((equal tipo-peca 'pequena)
          (cond
            ((casa-com-ump linha coluna tabuleiro) (pode-colocarp 1 1 tabuleiro 'pequena))
            (T nil)
          )
        )

        ((equal tipo-peca 'media)
          (cond
            ((casa-com-ump linha coluna tabuleiro) (pode-colocarp 1 1 tabuleiro 'media))
            (T nil)
          )
        )

        ((equal tipo-peca 'cruz)
          (cond
            ((casa-com-ump linha coluna tabuleiro) (append (pode-colocarp 2 0 tabuleiro 'cruz) (pode-colocarp 1 1 tabuleiro 'cruz) )) 
            (T nil)
          )
        )

      )
    )

   ((= coluna -1) (percorre-matriz-peca tabuleiro tipo-peca (1- linha) 13))

   ((casa-com-ump linha coluna tabuleiro)
    (cond

      ((equal tipo-peca 'pequena)
        (append (cantos-disponiveis-peca-pequena (1- linha) (1- coluna) tabuleiro linha coluna) (percorre-matriz-peca tabuleiro tipo-peca linha (1- coluna)))  
      )

      ((equal tipo-peca 'media)
        (append (cantos-disponiveis-peca-media (- linha 2) (- coluna 2) tabuleiro linha coluna) (percorre-matriz-peca tabuleiro tipo-peca linha (1- coluna)))
      )

      ((equal tipo-peca 'cruz)
        (append (append (cantos-disponiveis-peca-cruz-horizontal (1- linha) (- coluna 3) tabuleiro linha coluna) (cantos-disponiveis-peca-cruz-vertical (- linha 2) (- coluna 2) tabuleiro linha coluna)) (percorre-matriz-peca tabuleiro tipo-peca linha (1- coluna)))
      )

      (T nil)
    )
   )

   (t (percorre-matriz-peca tabuleiro tipo-peca linha (1- coluna)))
  )
)

;;;; Cantos possiveis peca cruz ;;;;;;;;;;;

;; cantos-disponiveis-peca-horizontal

(defun cantos-disponiveis-peca-cruz-horizontal (linha coluna tabuleiro linha-original coluna-original)
  "Funcao que ira percorrer todos os cantos de uma determinada peca situada na linha e coluna passada como argumentos para averiguar se e possivel colocar uma peca em cruz de modo a que as pecas laterias da peca em cruz fiquem diagonalmente colocadas com a peca em questao"
  (cond

   ((and (= linha (1+ linha-original)) (= coluna (1+ coluna-original))) (append (pode-colocarp linha coluna tabuleiro 'cruz)))

   ((>= coluna (+ coluna-original 2)) (cantos-disponiveis-peca-cruz-horizontal (1+ linha-original) (- coluna-original 3) tabuleiro linha-original coluna-original ))

   ((< coluna 0) (cantos-disponiveis-peca-cruz-horizontal linha (+ coluna 4) tabuleiro linha-original coluna-original))

   ((< linha 1) (cantos-disponiveis-peca-cruz-horizontal (1+ linha-original) coluna tabuleiro linha-original coluna-original))


   ((verifica-casas-vazias tabuleiro (list
                                      (list (1- linha) (1+ coluna))
                                      (list linha coluna) (list linha (1+ coluna)) (list linha (+ coluna 2))
                                      (list (1+ linha) (1+ coluna))
                                      )) (append (pode-colocarp linha coluna tabuleiro 'cruz) (cantos-disponiveis-peca-cruz-horizontal linha (+ coluna 4) tabuleiro linha-original coluna-original)))


   (T (cantos-disponiveis-peca-cruz-horizontal linha (+ coluna 4) tabuleiro linha-original coluna-original))

  )
)


;; cantos-disponiveis-peca-cruz-vertical

(defun cantos-disponiveis-peca-cruz-vertical (linha coluna tabuleiro linha-original coluna-original)
  "Funcao que ira percorrer todos os cantos de uma determinada peca situada na linha e coluna passada como argumentos para averiguar se e possivel colocar uma peca em cruz de modo a que as pecas verticais da peca em cruz fiquem diagonalmente colocadas com a peca em questao"
  (cond

   ((and (= linha (+ linha-original 2)) (= coluna coluna-original)) (append (pode-colocarp linha coluna tabuleiro 'cruz)))

   ((>= coluna (1+ coluna-original)) (cantos-disponiveis-peca-cruz-vertical (+ linha-original 2) (- coluna-original 2) tabuleiro linha-original coluna-original ))


   ((< coluna 0) (cantos-disponiveis-peca-cruz-vertical linha (+ coluna 2) tabuleiro linha-original coluna-original))


   ((< linha 1) (cantos-disponiveis-peca-cruz-vertical (+ linha-original 2) coluna tabuleiro linha-original coluna-original))
   

   ((verifica-casas-vazias tabuleiro (list
                                      (list (1- linha) (1+ coluna))
                                      (list linha coluna) (list linha (1+ coluna)) (list linha (+ coluna 2))
                                      (list (1+ linha) (1+ coluna))
                                      )) (append (pode-colocarp linha coluna tabuleiro 'cruz) (cantos-disponiveis-peca-cruz-vertical linha (+ coluna 2) tabuleiro linha-original coluna-original)))

  (T (cantos-disponiveis-peca-cruz-vertical linha (+ coluna 2) tabuleiro linha-original coluna-original))

  )

)


;;;;;; Cantos possiveis peca media ;;;;;;;;;;;;

;; cantos-disponiveis-peca-media

(defun cantos-disponiveis-peca-media (linha coluna tabulerio &optional linha-original coluna-original)
  "Funcao que ira percorrer todos os cantos possiveis de uma determinada peca situada na linha e coluna passada como argumentos e averiguar se e possivel colocar uma peca media nesses cantos"
  (cond

   ((<= linha -1) (cantos-disponiveis-peca-media (+ linha 3) coluna tabulerio linha-original coluna-original))

   ((<= coluna -1) (cantos-disponiveis-peca-media linha (+ coluna 3) tabulerio linha-original coluna-original))
   

   ((and (= linha (1+ linha-original)) (= coluna (1+ coluna-original))) (append (pode-colocarp linha coluna tabulerio 'media)))

   ((>= coluna (+ coluna-original 2)) (cantos-disponiveis-peca-media (+ linha 3) (- coluna-original 2) tabulerio linha-original coluna-original))

   ((verifica-casas-vazias tabulerio (list 
                                      (list linha coluna) (list linha (1+ coluna))
                                      (list (1+ linha) coluna) (list (1+ linha) (1+ coluna))
                                      )) (append (pode-colocarp linha coluna tabulerio 'media)
                                                 (cantos-disponiveis-peca-media linha (+ coluna 3) tabulerio linha-original coluna-original)))

   (T (cantos-disponiveis-peca-media linha (+ coluna 3) tabulerio linha-original coluna-original))

  )
)

;;;;;;;;Cantos possiveis peca pequena;;;;;;;;;;;;;;;;

;; cantos-disponiveis-peca-pequena

(defun cantos-disponiveis-peca-pequena (linha coluna tabuleiro &optional linha-original coluna-original)
  "Funcao que ira percorrer todos os cantos possiveis de uma determinada peca situada na linha e coluna passada como argumentos e averiguar se e possivel colocar uma peca pequna nesses cantos"
  (cond
   ((= linha -1) (cantos-disponiveis-peca-pequena (+ linha 2) coluna tabuleiro linha-original coluna-original)) ;;Se os cantos superiores ja estiverem fora do tabuleiro nao vale a pena ve-los
   
   ((= coluna -1) (cantos-disponiveis-peca-pequena linha (+ coluna 2) tabuleiro linha-original coluna-original)) ;; Se os cantos laterais esquerdos estiverem fora do tabuleiro nao vale a pena ve-los

   ((and (= linha (1+ linha-original)) (= coluna (1+ coluna-original))) (append (pode-colocarp linha coluna tabuleiro 'pequena)))

   ((>= coluna (+ coluna-original 2)) (cantos-disponiveis-peca-pequena (+ linha 2) (- coluna-original 1) tabuleiro linha-original coluna-original))

   ((equal (nth coluna (nth linha tabuleiro)) 0) (append (pode-colocarp linha coluna tabuleiro 'pequena) (cantos-disponiveis-peca-pequena linha (+ coluna 2) tabuleiro linha-original coluna-original )))

   (T (cantos-disponiveis-peca-pequena linha (+ coluna 2) tabuleiro linha-original coluna-original))
  )

)



;; verifica-casas-vazias

(defun verifica-casas-vazias (tabuleiro casas)
  "Funcao auxiliar para determinar se uma peca ira sobrepor alguma peca ja existente ou nao"
  (eval (cons 'and (mapcar #'(lambda (casa) 
              (cond

                ((eq (nth (second casa) (nth (first casa) tabuleiro)) 0) T)
                (T nil)
              )
            ) casas)))
)


;; casa-com-ump

(defun casa-com-ump (linha coluna tabuleiro)
  "Funcao que determina se uma posicao tem la uma peca do jogador ou nao"
  (cond
   ((or (= linha -1) (= coluna -1)) NIL)
   ((eq (nth coluna (nth linha tabuleiro)) 1) T)
   (T nil)
  )
)


;; pode-colocarp

(defun pode-colocarp (linha coluna tabuleiro tipo-peca)
  "Funcao que verifica se , ao colocarmos uma peca num dos cantos de uma peca ja existe, nao fica posicionada lateralmente com uma peca ja jogada pelo jogador "
  (cond

   ((equal tipo-peca 'cruz)
    (cond
     ((and 
       (not (casa-com-ump linha (1- coluna) tabuleiro))
       (not (casa-com-ump (1- linha) coluna tabuleiro))
       (not (casa-com-ump (1+ linha) coluna tabuleiro))
       (not (casa-com-ump (- linha 2) (1+ coluna) tabuleiro))
       (not (casa-com-ump (+ linha 2) (1+ coluna) tabuleiro))
       (not (casa-com-ump (1- linha) (+ coluna 2) tabuleiro))
       (not (casa-com-ump (1+ linha) (+ coluna 2) tabuleiro))
       (not (casa-com-ump linha (+ coluna 3) tabuleiro))
       (eq (nth (1+ coluna) (nth (1- linha) tabuleiro)) 0)
       (eq (nth coluna (nth linha tabuleiro)) 0)
       (eq (nth (1+ coluna) (nth linha tabuleiro)) 0)
       (eq (nth (+ coluna 2) (nth linha tabuleiro)) 0)
       (eq (nth (1+ coluna) (nth (1+ linha) tabuleiro)) 0)
       ) (list (list linha coluna)))
     (T NIL)
     )
   )

   ((equal tipo-peca 'media)
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
       (eq (nth coluna (nth linha tabuleiro)) 0)
       (eq (nth (1+ coluna) (nth linha tabuleiro)) 0)
       (eq (nth coluna (nth (1+ linha) tabuleiro)) 0)
       (eq (nth (1+ coluna) (nth (1+ linha) tabuleiro)) 0)
       ) (list (list linha coluna)))
     (T NIL)
     )
   )


   ((equal tipo-peca 'pequena)
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

  )   
)

;;; Heuristicas

;;heuristica
;sera que passamos so um no ou sera que passamos logo diretamente os valores de quadrados por preencher e preenchidos

(defun heuristica (no)
  "Funcao heuristica do problema, implementa uma funcao que subtrai os quadrados por preencher de um tabuleiro pelos quadrados ja preenchidos, priviligiando os tabuleiros com maior numedo de quadrados preenchidos"
  (- (quadrados-por-preencher (get-estado-no no)) (quadrados-ja-preenchidos (get-estado-no no)))
)



;;; Solucao

;;no-objetivo-p

(defun no-objetivo-p (no)
  "Funcao que determina se um no e no objetivo ou nao, ou seja, se um no ja nao tem mais pecas para jogar ou se um no ja nao tem jogadas possiveis"
  (let
      (
       (tabuleiro (get-estado-no no))
       (pecas-no (get-pecas-no no))
      )

    (cond

     ((or
       (and (not (null (jogadas-possiveis tabuleiro 'pequena))) (> (first pecas-no) 0))
       (and (not (null (jogadas-possiveis tabuleiro 'media))) (> (second pecas-no) 0))
       (and (not (null (jogadas-possiveis tabuleiro 'cruz))) (> (third pecas-no) 0))
      ) nil)

     (T T)

    )
  )
)
























;;;;;;;;;;;;;;;;;;;;;;;;;;; TESTE DOS ALGORITMOS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; bfs
(defun bfs (no-inicial funcao-sucessores operadores &optional (abertos (list no-inicial)) (fechados nil))
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
)


;; dfs

(defun dfs (no-inicial funcao-solucao funcao-sucessores operadores profundidade &optional (abertos (list no-inicial)) (fechados nil))
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

       ((> (get-profundidade-no no-atual) profundidade) (dfs (first abertos-sem-no-inicial) funcao-solucao funcao-sucessores operadores profundidade abertos-sem-no-inicial fechados-com-no-inicial))

       (T 
        (let* (

               (sucessores (remover-nos-repetidos (funcall funcao-sucessores no-atual operadores 'dfs profundidade) abertos-sem-no-inicial fechados-com-no-inicial))

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
  (eval (cons 'or (mapcar #'no-objetivo-p sucessores)))
)

;; procura-no-objetivo

(defun procura-no-objetivo (sucessores)
  (cond
   ((null sucessores) nil)
   ((no-objetivo-p (first sucessores)) (first sucessores))
   (T (procura-no-objetivo (rest sucessores)))
  )
)


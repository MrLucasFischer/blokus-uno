;;;;Disciplina de IA - 2017/2018
;;;;Projeto 1 - Blokus Uno
;;;;Autor: Andreia Pereira (n 150221021) e Lucas Fischer (n 140221004)
;;;Implementacao do Algoritmo AlfaBeta e da funcao sucessores

;;;;;;;; Variaveis Globais ;;;;;;;;

(defvar *melhor-jogada* nil)
(defvar *nos-analisados* 0)
(defvar *cortes-alfa* 0)
(defvar *cortes-beta* 0)
(defvar *tempo-gasto* 0)
(defvar *tabela* (make-hash-table))

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
                    (cria-no estado pecas-jogador1 pecas-jogador2 (trocar-jogador no) profundidade-novo-no (trocar-tipo-no no) no)
                 )
                ) jogadas-possiveis)
      )
    )
  )
)





;;;;;;;; Memoizacao ;;;;;;;;




;; alfabeta-memo

(let ((tab (make-hash-table :test 'equal)))
  (defun alfabeta-memo (no profundidade-limite operadores funcao-utilidade &optional (tempo-limite 5) (alfa most-negative-fixnum) (beta most-positive-fixnum) (tempo-inicial (get-universal-time)))
    "Funcao que verifica se ja existe um resultado alfabeta para o no passado na hash table, caso exista devolve-o, caso nao exista calcula o seu valor, retorna-o e insere-o na hash table"
    (or (gethash (hash-node no) tab)
        (let 
            (
             (resultado-alfabeta (alfabeta no profundidade-limite operadores funcao-utilidade tempo-limite alfa beta tempo-inicial))
            )
          (setf (gethash (hash-node no) tab) resultado-alfabeta)
          resultado-alfabeta
        )
    )
  )
)





;; alfabeta

(defun alfabeta (no profundidade-limite operadores funcao-utilidade &optional (tempo-limite 5) (alfa most-negative-fixnum) (beta most-positive-fixnum) (tempo-inicial (get-universal-time)))
  "Funcao que implementa o algoritmo alfabeta"
  (let* 
      (
        (tempo-atual (get-universal-time))
        (tempo-gasto (- tempo-atual tempo-inicial))
        (nos-analisados (setf *nos-analisados* (1+ *nos-analisados*)))
      )
    
    (cond

     ((>= tempo-gasto tempo-limite) (setf *tempo-gasto* tempo-gasto) (funcall funcao-utilidade no)) ;Acabou o tempo

     ((or (zerop profundidade-limite) (no-objetivo-p no)) (setf *tempo-gasto* tempo-gasto) (funcall funcao-utilidade no)) ;Caso tenhamos atingido a profundidade maxima ou o no seja um no folha
        
     (T
      (let
          (
           (sucessores-no (ordenar-sucessores (sucessores no operadores) (get-tipo-no no))) ;Expandir o no, ordenando os sucessores conforme o tipo do no
          )
        (cond
         ((null sucessores-no) -1) ;Nao tem sucessores, passa a vez
         (T (percorrer-sucessores sucessores-no alfa beta profundidade-limite operadores funcao-utilidade tempo-inicial tempo-limite (get-tipo-no no)))
        )
      ) 
     )
   )
  )
)






;; percorrer-sucessores

(defun percorrer-sucessores (sucessores alfa beta profundidade operadores funcao-utilidade tempo-inicial tempo-limite tipo-no-pai &optional (v (cond ((equal tipo-no-pai 'max) most-negative-fixnum) (T most-positive-fixnum)))) 
  "Funcao que percorre cada um dos sucessores e atualiza o alfa ou beta"  
  (cond
   ((null sucessores) v)

   (T
    (cond

     ;Caso o pai seja max
     ((equal tipo-no-pai 'max)

      (let*
          (
           (novo-v (max v (alfabeta (first sucessores) (1- profundidade) operadores funcao-utilidade tempo-limite alfa beta tempo-inicial) ))
           (novo-alfa (verificar-melhor-jogada-alfa alfa novo-v (first sucessores)))
           ;(novo-alfa (max alfa novo-v))
          )

        (cond 
         ((<= beta novo-alfa) (setf *cortes-alfa* (1+ *cortes-alfa*)) beta) ;Condicao de corte, aplicando fail-hard

         (T (percorrer-sucessores (rest sucessores) novo-alfa beta profundidade operadores funcao-utilidade tempo-inicial tempo-limite tipo-no-pai novo-v))
        )
       )
     )
     
     ;Caso o pai seja min
     (T 
      (let*
          (
           (novo-v (min v (alfabeta (first sucessores) (1- profundidade) operadores funcao-utilidade tempo-limite alfa beta tempo-inicial)))
           (novo-beta (min beta novo-v))
           ;(novo-beta (verificar-melhor-jogada-beta beta novo-v (first sucessores)))
          )

        (cond 
         ((<= novo-beta alfa) (setf *cortes-beta* (1+ *cortes-beta*)) alfa) ;Condicao de corte, aplicando fail-hard

         (T (percorrer-sucessores (rest sucessores) alfa novo-beta profundidade operadores funcao-utilidade tempo-inicial tempo-limite tipo-no-pai novo-v))
        )
       )
     )
   )
  )      
 )
)



;; verificar-melhor-jogada-afa

(defun verificar-melhor-jogada-alfa (alfa v sucessor)
  "Funcao que ira fazer o max entre o alfa e o valor de utilidade do sucessor, caso o valor de utilidade seja superior ao alfa, atualiza-se a melhor jogada para que seja o sucessor passado por argumento"
   (cond
     ((> v alfa) (setf *melhor-jogada* sucessor) v) ;Se o valor de utilidade do sucessor for maior que o alfa atual atualiza-se a melhor jogada e o alfa passa a ser o v
     (T alfa) ;Caso contrario mantem-se a melhor jogada e o alfa
   )
)





;; verificar-melhor-jogada-beta

(defun verificar-melhor-jogada-beta (beta v sucessor)
  "Funcao que ira fazer o min entre o beta e o valor de utilidade do sucessor, caso o valor de utilidade seja inferior ao beta, atualiza-se a melhor jogada para que seja o sucessor passado por argumento"
  (cond
    ((< v beta) (setf *melhor-jogada* sucessor) v) ;Se o valor de utilidade do sucessor for maior que o alfa atual atualiza-se a melhor jogada e o alfa passa a ser o v
    (T beta) ;Caso contrario mantem-se a melhor jogada e o alfa
  )

)





;; ordenar-sucessores

(defun ordenar-sucessores (sucessores tipo-no)
  "Funcao que ordena os sucessores de um no (com base na sua funcao de utilidade) de modo a aumentar a eficiencia dos cortes. Se o no for do tipo MAX, ordenar de forma crescente, caso contrario ordenar de forma decreste"
  (cond
   ((equal tipo-no 'max) (sort sucessores #'< :key #'funcao-utilidade))
   (T (sort sucessores #'> :key #'funcao-utilidade))
  )
)
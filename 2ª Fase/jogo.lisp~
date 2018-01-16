;;;;Disciplina de IA - 2017/2018
;;;;Projeto 1 - Blokus Uno
;;;;Autor: Andreia Pereira (n 150221021) e Lucas Fischer (n 140221004)

;;;;Funcoes de interacao com o utilizador e de escrita e leitura de ficheiros

;; jogar

(defun jogar()
  "Funcao que chama a funcao carregar-ficheiros. esta funcao existe meramente para nao se comecar a aplicacao pela funcao carregar-ficheiros"
  (carregar-ficheiros)
)

;; carregar-ficheiros

(defun carregar-ficheiros ()
  "Funcao que carrega os restantes ficheiros do projeto (puzzle.lisp e algoritmo.lisp) para que possam ser executados" 
  (let (
        (caminho (ler-caminho))
       )
    ;Para Ubuntu, no meu caso:
    ;/home/lucas-fischer/Dropbox/Faculdade/IA/2018/Projeto/blokus-uno
    ;C:/Users/Andreia Pereira/Google Drive/3� Ano - 1� Semestre/IA/Projeto/blokus-uno
    (progn
      (compile-file (concatenate 'string caminho "/puzzle.lisp"))
      (compile-file (concatenate 'string caminho "/algoritmo.lisp"))
      (load (concatenate 'string caminho "/puzzle.ufasl"));ufasl para Unix
      (load (concatenate 'string caminho "/algoritmo.ufasl"))
      ;(load (concatenate 'string caminho "/puzzle.ofasl"));ofasl para windows
      ;(load (concatenate 'string caminho "/algoritmo.ofasl"))
      (menu-principal caminho)
    )
  )
)



;; ler-caminho

(defun ler-caminho (&optional (caminho nil))
  "Funcao que questiona o utilizador pelo caminho onde se encontra os ficheiros do projeto, devolvendo a sua resposta"
  (cond
   ((null caminho) (format T "Introduza o caminho ate ao diretorio do projeto~%") (ler-caminho (read-line)))
   (T caminho)
  )
)




;; menu-principal

(defun menu-principal (caminho)
  "Funcao que ira mostrar ao utilizador o menu principal da aplicacao blokus-uno dando-lhe a escolher qual a acao desejada"

  ;;Ao Correr ficara com a formatacao correta
  (progn
    (format T "~% _______________________________________________________________________________")
    (format T "~%|                                                                               |")
    (format T "~%|                                                                               |")
    (format T "~%|                                                                               |")
    (format T "~%|                               ______               _____                      |")
    (format T "~%|                 |---   |     /      \\ | /  |    | |     \\                     |")
    (format T "~%|                 |   |  |     |      | |/   |    | \\_____                      |")
    (format T "~%|                 |---   |     |      | |\\   |    |       \\                     |")
    (format T "~%|                 |   |  |     |      | | \\  |    | \\     |                     |")
    (format T "~%|                 |---   |____  \\____/  |  \\  \\__/   \\___/                      |")
    (format T "~%|                            _____             ______                           |")
    (format T "~%|                           |     \\   |     | /      \\                          |")
    (format T "~%|                           |      \\  |     | |      |                          |")
    (format T "~%|                           |      /  |     | |      |                          |")
    (format T "~%|                           |_____/    \\___/   \\____/                           |")
    (format T "~%|                                                                               |")
    (format T "~%|                                                                               |")
    (format T "~%|                                                                               |")
    (format T "~%|                                1 - Iniciar                                    |")
    (format T "~%|                                2 - Sair                                       |")
    (format T "~%|                                                                               |")
    (format T "~%|                                                                               |")
    (format T "~%|                                                                               |")
    (format T "~%|_______________________________________________________________________________|")
    (format T "~%                                                                 ~%")

    (let* (
           (resposta (read))
          )
      (cond
       ((not (numberp resposta)) (format T "~% -> Precisa de Inserir um n�mero (1 ou 2)") (menu-principal caminho))
       ((= resposta 1 ) (iniciar caminho))
       ((= resposta 2) (format T "~% -> Adeus!"))
       (T (format T "~% -> Precisa de Inserir um numero (1 ou 2)") (menu-principal caminho))
      )
    )
  )
)



;; iniciar

(defun iniciar (caminho)
  "Funcao que ira iniciar a aplicacao, pedindo ao utilizador para que escolha o tabuleiro que pretenda que seja o no inicial, o algoritmo que pretende utilizar e a profundidade maxima que pretende para o algoritmo dfs"
  (let* (

         (tipo-de-jogo (ler-tipo-de-jogo)) ;Perguntar se quer jogar Computador vs Computador ou Computador vs Humano

         (jogador-escolhido (cond
                              ((equal tipo-de-jogo 'humano) (ler-escolha-jogador))
                              (T 1)
                            ))

         (tempo-limite (ler-tempo-limite))

         ;(tabuleiro-escolhido (ler-tabuleiro caminho)) ;Perguntar se vai haver outros tabuleiros ou se e sempre o mesmo
         (tabuleiro-escolhido (tabuleiro-vazio))

         (profundidade-escolhida (ler-profundidade))

         (pecas-jogador1-no-raiz (list 
                       (- 10 (peca-contagem tabuleiro-escolhido 'pequena 1))
                       (- 10 (peca-contagem tabuleiro-escolhido 'media 1))
                       (- 15 (peca-contagem tabuleiro-escolhido 'cruz 1))
                       ))


        (pecas-jogador2-no-raiz (list 
                       (- 10 (peca-contagem tabuleiro-escolhido 'pequena 2))
                       (- 10 (peca-contagem tabuleiro-escolhido 'media 2))
                       (- 15 (peca-contagem tabuleiro-escolhido 'cruz 2))
                       ))

         (no (cria-no tabuleiro-escolhido 
                      pecas-jogador1-no-raiz
                      pecas-jogador2-no-raiz
                      jogador-escolhido
             ))
        )

    (cond
     ((equal tipo-de-jogo 'humano) (comecar-jogo-humano no tempo-limite profundidade-escolhida jogador-escolhido))
     (T (comecar-jogo-computador no tempo-limite profundidade-escolhida caminho))
    )
  )
)



;; comecar-jogo-humano

(defun comecar-jogo-humano (no tempo-limite profundidade-maxima peca-humano &optional (humano-passou-vez nil) (maquina-passou-vez nil))
  "Funcao que implementa um jogo entre um humano e um computador"
  
  (cond

   ((and humano-passou-vez maquina-passou-vez) 'acabou)

   ;Se for a primeira jogada e o humano tiver escolhido o jogador2 -> mudar a vez para o pc
   ((and (null (get-pai-no no)) (= peca-humano 2))
    (comecar-jogo-humano (cria-no (get-estado-no no)
                                  (get-pecas-jogador1-no no)
                                  (get-pecas-jogador2-no no)
                                  1
                                  (get-profundidade-no no)
                                  'MAX
                                  (get-pai-no no)
                         )
                         tempo-limite
                         profundidade-maxima
                         peca-humano
    )
   ) ;;Esta aqui algum problema qualquer

   (T
    (cond
     ;Caso seja o humano a jogar
     ((= (get-valor-jogador-no no) peca-humano)
      ;Mostrar o tabuleiro
      ;Mostrar pecas jogador1
      ;Mostrar pecas jogador2
      ;Mostrar as Jogadas possiveis para por uma peca pequena
      ;Mostrar as Jogadas possiveis para por uma peca media
      ;Mostrar as Jogadas possiveis para por um peca cruz
      ;Carregar numa opcao para passar a vez (ou sera automatico ??)
      (let* 
          (
           (pecas-jogador (cond
                           ((= peca-humano 1) (get-pecas-jogador1-no no))
                           (T (get-pecas-jogador2-no no))
                          ))

           (pecas-maquina (cond
                           ((= peca-humano 1) (get-pecas-jogador2-no no))
                           (T (get-pecas-jogador1-no no))
                          ))
 
           (tabuleiro (get-estado-no no))
           
           (jogadas-possiveis-pequena (cond
                                       ((<= (first pecas-jogador) 0) nil)
                                       (T (jogadas-possiveis tabuleiro 'pequena peca-humano))
                                      ))

           (jogadas-possiveis-media (cond
                                       ((<= (second pecas-jogador) 0) nil)
                                       (T (jogadas-possiveis tabuleiro 'media peca-humano))
                                      ))

           (jogadas-possiveis-cruz (cond
                                       ((<= (third pecas-jogador) 0) nil)
                                       (T (jogadas-possiveis tabuleiro 'cruz peca-humano))
                                      ))
          )
        (cond

         ;Caso nao haja jogadas possiveis para este tabuleiro -> passar a vez
         ((zerop (+ (length jogadas-possiveis-pequena) (length jogadas-possiveis-media) (length jogadas-possiveis-cruz))) (format T "~%   ---Nao tem jogadas possiveis para este tabuleiro--~%") (comecar-jogo-humano (cria-no (get-estado-no no) (get-pecas-jogador1-no no) (get-pecas-jogador2-no no) (trocar-jogador no) (get-profundidade-no no) 'MAX (get-pai-no no)) tempo-limite profundidade-maxima peca-humano T maquina-passou-vez))

         (T
          (let* 
              (
               (apresentar-informacao (mostrar-info tabuleiro pecas-jogador pecas-maquina jogadas-possiveis-pequena jogadas-possiveis-media jogadas-possiveis-cruz))
               
               (resposta (obter-resposta-jogada tabuleiro peca-humano)) ;Devolve (operador-desejado linha-desejada coluna-desejada)

               (novo-tabuleiro (funcall (first resposta) (second resposta) (third resposta) tabuleiro peca-humano)) ;Tabuleiro com a jogada do humano

               (novas-pecas-humano (cond
                                    ((equal (first resposta) 'inserir-peca-pequena) (list (1- (first pecas-jogador)) (second pecas-jogador) (third pecas-jogador)))

                                    ((equal (first resposta) 'inserir-peca-media) (list (first pecas-jogador) (1- (second pecas-jogador)) (third pecas-jogador)))

                                    ((equal (first resposta) 'inserir-peca-cruz) (list (first pecas-jogador) (second pecas-jogador) (1- (third pecas-jogador))))
                                   ))

               (novo-no (cond
                         ((= peca-humano 1) (cria-no novo-tabuleiro 
                                                     novas-pecas-humano
                                                     pecas-maquina
                                                     2
                                                     (1+ (get-profundidade-no no))
                                                     'MAX
                                                     no))

                         (T (cria-no novo-tabuleiro 
                                     pecas-maquina
                                     novas-pecas-humano
                                     1
                                     (1+ (get-profundidade-no no))
                                     'MAX
                                     no))
                        ))
              )

            (comecar-jogo-humano novo-no tempo-limite profundidade-maxima peca-humano nil maquina-passou-vez) ;Dizer que o jogador nao passou a vez
          )
         )
        )
      )
     )


     ;Caso seja a maquina a jogar
     (T 
      (let* 
          (
           (resultado-alfabeta (alfabeta no profundidade-maxima (operadores) 'funcao-utilidade tempo-limite))

           (novo-no (cria-no (get-estado-no *melhor-jogada*) 
                             (get-pecas-jogador1-no *melhor-jogada*)
                             (get-pecas-jogador2-no *melhor-jogada*)
                             (get-valor-jogador-no *melhor-jogada*)
                             (get-profundidade-no *melhor-jogada*)
                             'MAX ;not sure about this
                             (get-pai-no *melhor-jogada*)
                             ))
           (reset-melhor-jogada (setf *melhor-jogada* nil)) ;Fazer reset a melhor jogada encontrada
           (nos-analisados *nos-analisados*) ;Guardar o numero de nos analisados

           (reset-nos-analisados (setf *nos-analisados* 0)) ;Fazer reset aos nos analisados

           (cortes-alfa *cortes-alfa*) ;Guardar o numero de cortes alfa

           (reset-cortes-alfa (setf *cortes-alfa* 0)) ;Fazer reset aos cortes alfa

           (cortes-beta *cortes-beta*) ;Guardar o numero de cortes beta

           (reset-cortes-beta (setf *cortes-beta* 0)) ;Fazer reset aos cortes beta
          )

        (cond
         ;Caso a maquina tenha passado a vez
         ((null (first novo-no))
          (comecar-jogo-humano (cria-no (get-estado-no no)
                                        (get-pecas-jogador1-no no)
                                        (get-pecas-jogador2-no no)
                                        peca-humano ;Mudar para a peca do jogador
                                        (get-profundidade-no no)
                                        'MAX
                                        (get-pai-no no))
                               tempo-limite
                               profundidade-maxima
                               peca-humano
                               humano-passou-vez
                               T)
         )

         (T (comecar-jogo-humano novo-no tempo-limite profundidade-maxima peca-humano humano-passou-vez nil)) ;Dizer que a maquina nao passou a vez

      )

     )
    )
   )
  )
 )
)





;; comecar-jogo-computador

(defun comecar-jogo-computador (no tempo-limite profundidade-maxima caminho &optional (jogador1-passou-vez nil) (jogador2-passou-vez nil))
  "Funcao que implementa um jogo entre dois computadores"
  (let* 
      (
       (resultado-alfabeta (alfabeta-memo no profundidade-maxima (operadores) 'funcao-utilidade tempo-limite))
       (novo-no (cria-no 
                 (get-estado-no *melhor-jogada*)
                 (get-pecas-jogador1-no *melhor-jogada*)
                 (get-pecas-jogador2-no *melhor-jogada*)
                 (get-valor-jogador-no *melhor-jogada*)
                 (get-profundidade-no *melhor-jogada*)
                 'MAX ;not sure about this
                 (get-pai-no *melhor-jogada*)
                 ))
       (reset-melhor-jogada (setf *melhor-jogada* nil)) ;Fazer reset a melhor jogada encontrada

       (nos-analisados *nos-analisados*) ;Guardar o numero de nos analisados

       (reset-nos-analisados (setf *nos-analisados* 0)) ;Fazer reset aos nos analisados

       (cortes-alfa *cortes-alfa*) ;Guardar o numero de cortes alfa

       (reset-cortes-alfa (setf *cortes-alfa* 0)) ;Fazer reset aos cortes alfa

       (cortes-beta *cortes-beta*) ;Guardar o numero de cortes beta

       (reset-cortes-beta (setf *cortes-beta* 0)) ;Fazer reset aos cortes beta
     )
    (let* 
        (
         (apresentar-info (cond
                           ((not (null (first novo-no))) (escrever-resultados caminho novo-no (get-valor-jogador-no no) nos-analisados cortes-alfa cortes-beta))
                           (T nil)
                          ))
       )
       
      (cond

       ((and jogador1-passou-vez jogador2-passou-vez)
        (let 
            (
             (resultado (decidir-vencedor no))
            )
          (cond
           ((equal resultado 'jogador1) (imprimir-vencedor caminho 'jogador1))
           ((equal resultado 'jogador2) (imprimir-vencedor caminho 'jogador2))
           ((equal resultado 'empate) (imprimir-vencedor caminho 'empate))
          )
        )
       ) ;Se ambos jogadores passaram a vez entao o jogo termina

       ((null (first novo-no))
 
        (cond

         ((= (get-valor-jogador-no no) 1) (comecar-jogo-computador 
                                           (cria-no (get-estado-no no)
                                                    (get-pecas-jogador1-no no)
                                                    (get-pecas-jogador2-no no)
                                                    2 ;Mudar de jogador
                                                    (get-profundidade-no no)
                                                    'MAX
                                                    (get-pai-no no)
                                           )
                                           tempo-limite 
                                           profundidade-maxima
                                           caminho
                                           T 
                                           jogador2-passou-vez
                                         )
          ) ;Jogador 1 passou a vez
           
         (T (comecar-jogo-computador 
             (cria-no (get-estado-no no)
                      (get-pecas-jogador1-no no)
                      (get-pecas-jogador2-no no)
                      1 ;Mudar de jogador
                      (get-profundidade-no no)
                      'MAX
                      (get-pai-no no)
                      ) 
             tempo-limite 
             profundidade-maxima
             caminho 
             jogador1-passou-vez 
             T
            )
         ) ;Jogador 2 passou a vez
       )
     )

       (T 

        (cond
         ((= (get-valor-jogador-no no) 1) (comecar-jogo-computador novo-no tempo-limite profundidade-maxima caminho nil jogador2-passou-vez)) ;Dizer que o jogador 1 nao passou a vez
             
         (T (comecar-jogo-computador novo-no tempo-limite profundidade-maxima caminho jogador1-passou-vez nil)) ; Dizer que o jogador 2 nao passou a vez
        )
      )

     )
    )
  )
)



;; ler-tabuleiro

(defun ler-tabuleiro (caminho)
  "Funcao que ira questionar o utilizador sobre qual o tabuleiro que pretende utilizar como estado do no inicial, lendo esse tabuleiro do ficheiro problemas.dat"

  (progn
    (format T "~% -> Escolha um tabuleiro que pretende utilizar como estado do no inicial")
    (format T "~% -> 1 - Tabuleiro a)")
    (format T "~% -> 2 - Tabuleiro b)")
    (format T "~% -> 3 - Tabuleiro c)")
    (format T "~% -> 4 - Tabuleiro d)")
    (format T "~% -> 5 - Tabuleiro e)")
    (format T "~% -> 6 - Tabuleiro f)")
    (format T "~% -> 7 - Tabuleiro 16 x 12)")
    (format T "~% -> 8 - Tabuleiro 10 x 11)")
    (format T "~% -> 9 - Tabuleiro 20 x 10)~%")

    (let (
          (resposta (read))
         )
      (with-open-file (ficheiro (concatenate 'string caminho "/problemas.dat") :direction :input)
        (let* (
               (tabuleiro-a (ler-tabuleiro-ficheiro ficheiro))
               (tabuleiro-b (ler-tabuleiro-ficheiro ficheiro))
               (tabuleiro-c (ler-tabuleiro-ficheiro ficheiro))
               (tabuleiro-d (ler-tabuleiro-ficheiro ficheiro))
               (tabuleiro-e (ler-tabuleiro-ficheiro ficheiro))
               (tabuleiro-f (ler-tabuleiro-ficheiro ficheiro))
               (tabuleiro-g (ler-tabuleiro-ficheiro ficheiro)) ;Problema 16x12
               (tabuleiro-dez-onze (ler-tabuleiro-ficheiro ficheiro)) ;Problema 10x11
               (tabuleiro-vinte-dez (ler-tabuleiro-ficheiro ficheiro)) ;Problema 20x10
              )

        (cond
         ((not (numberp resposta)) (format T "~% -> Precisa de inserir um numero de 1 a 9~%") (ler-tabuleiro caminho))
         ((= resposta 1) tabuleiro-a)
         ((= resposta 2) tabuleiro-b)
         ((= resposta 3) tabuleiro-c)
         ((= resposta 4) tabuleiro-d)
         ((= resposta 5) tabuleiro-e)
         ((= resposta 6) tabuleiro-f)
         ((= resposta 7) tabuleiro-g)
         ((= resposta 8) tabuleiro-dez-onze)
         ((= resposta 9) tabuleiro-vinte-dez)
         (T (format T "~% -> Precisa de inserir um numero de 1 a 9~%") (ler-tabuleiro caminho))
       )
      )

     )
    )

  )
)




;; ler-tabuleiro-ficheiro

(defun ler-tabuleiro-ficheiro (ficheiro)
  "Funcao que permite ler um tabuleiro de um ficheiro"
  (let (
        (linha (read ficheiro nil :fim))
       )

    (cond
     ((equal linha 'end) (close ficheiro) nil)
     ((not (equal linha 'break)) (cons linha (ler-tabuleiro-ficheiro ficheiro)))
     ((equal linha 'break) nil)
    )
    
  )
)




;; ler-profundidade

(defun ler-profundidade (&optional (resposta nil))
  "Funcao que ira questionar o utilizador sobre qual a profundidade maxima que pretende no decorrer do algoritmo alfa beta"
  (cond

   ((null resposta) (format T "~% -> Insira a profundidade maxima que deseja para o algoritmo~%") (ler-profundidade (read)))

   ((not (numberp resposta)) (format T "~% -> Por favor insira um numero maior do que 0~%") (ler-profundidade))

   ((<= resposta 0) (format T "~% -> Por favor insira um numero maior do que 0~%") (ler-profundidade))

   (T resposta)
  )
)




;; ler-tipo-de-jogo

(defun ler-tipo-de-jogo ()
  "Funcao que ira questionar o utilizar sobre se pretende jogar contra o computador ou jogar Computador vs Computador"
  (progn
    (format T "~% -> Escolha como pretende jogar:")
    (format T "~% -> 1- Humano vs Computador")
    (format T "~% -> 2- Computador vs Computador~%")

    (let
        (
          (resposta (read))
        )
        (cond
          ((not (numberp resposta)) (format T "~% -> Por favor insira o numero 1 ou 2~%") (ler-tipo-de-jogo))
          ((= resposta 1) 'humano)
          ((= resposta 2) 'computador)
          (T (format T "~% -> Por favor insira o numero 1 ou 2~%") (ler-tipo-de-jogo))
        )
    )
  )
)





;; ler-escolha-jogador

(defun ler-escolha-jogador ()
  "Funcao que ira questionar o utilizador sobre com que qual peca deseja jogar"
  (progn
      (format T "~% -> Escolha com que peca pretende jogar:")
      (format T "~% -> 1- Jogador1 (primeiro a jogar)")
      (format T "~% -> 2- Jogador2~%")

      (let
          (
            (resposta (read))
          )
          (cond
            ((not (numberp resposta)) (format T "~% -> Por favor insira o numero 1 ou 2~%") (ler-escolha-jogador))
            ((= resposta 1) 1)
            ((= resposta 2) 2)
            (T (format T "~% -> Por favor insira o numero 1 ou 2~%") (ler-escolha-jogador))
          )
      )
    )
)





;; ler-tempo-limite

(defun ler-tempo-limite (&optional (resposta nil))
  "Funcao que ira questionar o utilizador sobre o tempo maximo que o computador tem para decidir sobre uma jogada"
  (cond

   ((null resposta) (format T "~% -> Insira o tempo maximo que o computador tem para decidir sobre uma jogada~%") (ler-tempo-limite (read)))

   ((not (numberp resposta)) (format T "~% -> Por favor insira um numero entre 1 e 10~%") (ler-tempo-limite))

   ((or (<= resposta 0) (>= resposta 11)) (format T "~% -> Por favor insira um numero entre 1 e 10~%") (ler-tempo-limite))

   (T resposta)
  )
)









;; formatar-tabuleiro

(defun formatar-tabuleiro (tabuleiro &optional (ficheiro T))
  "Funcao que recebe um tabuleiro e formata-o de forma a ser mais apresentavel ao utilizador"
  (cond
   ((null tabuleiro) nil)
   (T (format ficheiro "~%  ~A" (first tabuleiro)) (formatar-tabuleiro (rest tabuleiro) ficheiro))
  )
)





;; mostrar-info
(defun mostrar-info (tabuleiro pecas-jogador pecas-maquina jogadas-pequena jogadas-media jogadas-cruz)
  "Funcao que ira apresentar ao utilizador informacao sobre as jogadas que pode efetuar"
  (progn
    (format T "~%  -E a sua vez de jogar !")
    (formatar-tabuleiro tabuleiro)
    (format T "~%~%  -Suas pecas: ~A  | Pecas do Adversario: ~A" pecas-jogador pecas-maquina)
    (format T "~%~%  -Escolha a sua jogada:")
    (cond
     ((not (null jogadas-pequena)) (format T "~% Jogadas possiveis para a peca pequena: ~% ~A" jogadas-pequena))
     (t nil)
    )
    (cond
     ((not (null jogadas-media)) (format T "~%~% Jogadas possiveis para a peca media: ~% ~A" jogadas-media))
     (t nil)
    )
    (cond
     ((not (null jogadas-cruz)) (format T "~%~% Jogadas possiveis para a peca cruz: ~% ~A~%" jogadas-cruz))
     (t nil)
    )
  )
)








;; escrever-resultados

(defun escrever-resultados (caminho no jogador-que-jogou nos-analisados cortes-alfa cortes-beta)
  "Funcao que ira escrever no ecra os resultados de cada jogada realizada"
  (progn
    (formatar-tabuleiro (get-estado-no no))
    (format T "~%~%  -Jogador que fez a jogada: Jogador ~A" jogador-que-jogou)
    (format T "~%  -Pecas Jogador 1: ~A | Pecas Jogador 2: ~A" (get-pecas-jogador1-no no) (get-pecas-jogador2-no no))
    (format T "~%~%  -Nos analisados: ~A" nos-analisados)
    (format T "~%  -Cortes Alfa: ~A" cortes-alfa)
    (format T "~%  -Cortes Beta: ~A" cortes-beta)
    (format T "~%~%---------------------------------------------------------------------------------------------~%")
    (escrever-log-ficheiro caminho no jogador-que-jogou nos-analisados cortes-alfa cortes-beta)
  )
)








;; escrever-log-ficheiro

(defun escrever-log-ficheiro (caminho no jogador-que-jogou nos-analisados cortes-alfa cortes-beta)
  "Funcao que ira escrever os dados obtidos de uma jogada num jogo entre duas maquinas"
  (with-open-file (ficheiro-log 
                   (concatenate 'string caminho "/log.dat")
                   :direction :output
                   :if-exists :append
                   :if-does-not-exist :create
                  )
    (formatar-tabuleiro (get-estado-no no) ficheiro-log)
    (format ficheiro-log "~%~%  -Jogador que fez a jogada: Jogador ~A" jogador-que-jogou)
    (format ficheiro-log "~%  -Pecas Jogador 1: ~A | Pecas Jogador 2: ~A" (get-pecas-jogador1-no no) (get-pecas-jogador2-no no))
    (format ficheiro-log "~%~%  -Nos analisados: ~A" nos-analisados)
    (format ficheiro-log "~%  -Cortes Alfa: ~A" cortes-alfa)
    (format ficheiro-log "~%  -Cortes Beta: ~A" cortes-beta)
    (format ficheiro-log "~%~%---------------------------------------------------------------------------------------------~%")
  )
)









;; imprimir-vencedor

(defun imprimir-vencedor (caminho vencedor)
  "Funcao que ira imprimir no ecra e no ficheiro de logs qual o vencedor do jogo"
  (progn
  (cond
    ((equal vencedor 'jogador1)
      (progn
        (format T "~%~%  -Vencedor: Jogador 1!~%")
          (with-open-file (ficheiro-log 
                   (concatenate 'string caminho "/log.dat")
                   :direction :output
                   :if-exists :append
                   :if-does-not-exist :create
                  )
            (progn
              (format ficheiro-log "~%~%  -Vencedor: Jogador 1!~%")
              (format ficheiro-log "~%~%---------------------------------------FIM DO JOGO------------------------------------------~%")
            )
          )
      ) 
    )


    ((equal vencedor 'jogador2)
      (progn
        (format T "~%~%  -Vencedor: Jogador 2!~%")
          (with-open-file (ficheiro-log 
                   (concatenate 'string caminho "/log.dat")
                   :direction :output
                   :if-exists :append
                   :if-does-not-exist :create
                  )
            (progn
              (format ficheiro-log "~%~%  -Vencedor: Jogador 2!~%")
              (format ficheiro-log "~%~%---------------------------------------FIM DO JOGO------------------------------------------~%")
            )
          )
      ) 
    )

    (t
      (progn
        (format T "~%~%  -Empate!~%")
          (with-open-file (ficheiro-log 
                   (concatenate 'string caminho "/log.dat")
                   :direction :output
                   :if-exists :append
                   :if-does-not-exist :create
                  )
            (progn
              (format ficheiro-log "~%~%  -Empate!~%")
              (format ficheiro-log "~%~%---------------------------------------FIM DO JOGO------------------------------------------~%")
            )
          )
      ) 
    )


  )
  (jogar-outra-vez caminho)
 )
)










;; jogar-outra-vez 

(defun jogar-outra-vez (caminho)
  "Funcao que ira questionar o utilizador sobre se pretende jogar outra vez ou nao"
  (progn
    (format T "~%  -Pretende jogar outra vez ?")
    (format T "~%  1- Sim")
    (format T "~%  2- Nao~%")
    (let 
        (
         (resposta (read))
        )
      (cond
       ((not (numberp resposta)) (format T "~%  -Por favor insira o numero 1 ou 2") (jogar-outra-vez caminho))
       ((= resposta 1) (iniciar caminho))
       ((= resposta 2) (format T "~%  >Adeus!"))
       (T (format T "~%  -Por favor insira o numero 1 ou 2") (jogar-outra-vez caminho))
      )
    )  
  )
)








;;;;;;;;;;Funcoe Auxiliares para obter a jogada do utilizador;;;;;;;;;;





;;obter-resposta-jogada

(defun obter-resposta-jogada (tabuleiro peca-humano)
  "Funcao que ira obter qual a jogada que o jogador humano deseja fazer, validando-a"
  (let* 
      (
       (pergunta-operador (format T "~%  -Qual tipo de jogada pretende fazer ? (1 - jogar uma peca pequena, 2 - jogar uma peca media, 3 - jogar uma peca em cruz)~%"))
       
       (resposta-operador (read))

       (resposta-linha (obter-resposta-linha (1- (length tabuleiro))))
       
       (resposta-coluna (obter-resposta-coluna (1- (length (first tabuleiro)))))
      )
    (cond

     ((not (numberp resposta-operador)) (format T "~%~%  ----- ATENCAO: Essa jogada nao e valida, tente novamente -----~%~%") (obter-resposta-jogada tabuleiro peca-humano))

     ((= resposta-operador 1) (cond
                                    ((jogada-in-jogadas-possiveis-p (list resposta-linha resposta-coluna) tabuleiro 'pequena peca-humano) (list 'inserir-peca-pequena resposta-linha resposta-coluna))
                                     (T (format T "~%~%  ----- ATENCAO: Essa jogada nao e valida, tente novamente -----~%~%") (obter-resposta-jogada tabuleiro peca-humano))
                                   ))



     ((= resposta-operador 2) (cond
                                    ((jogada-in-jogadas-possiveis-p (list resposta-linha resposta-coluna) tabuleiro 'media peca-humano) (list 'inserir-peca-media resposta-linha resposta-coluna))
                                     (T (format T "~%~%  ----- ATENCAO: Essa jogada nao e valida, tente novamente -----~%~%") (obter-resposta-jogada tabuleiro peca-humano))
                                   ))



     ((= resposta-operador 3) (cond
                                    ((jogada-in-jogadas-possiveis-p (list resposta-linha resposta-coluna) tabuleiro 'cruz peca-humano) (list 'inserir-peca-cruz resposta-linha resposta-coluna))
                                     (T (format T "~%~%  ----- ATENCAO: Essa jogada nao e valida, tente novamente -----~%~%") (obter-resposta-jogada tabuleiro peca-humano))
                                   ))


     (T (format T "~%~%  ----- ATENCAO: Essa jogada nao e valida, tente novamente -----~%~%") (obter-resposta-jogada tabuleiro peca-humano))
    )
  )
)



;; obter-resposta-linha

(defun obter-resposta-linha (linha-maxima)
  "Funcao que ira questionar o utilizador pela linha em que deseja jogar"
  (let* 
      (
       (pergunta-linha (format T "~%  -Insira a linha onde pretende jogar: (0 - ~A)~%" linha-maxima))
       (resposta (read))
      )
    (cond
     ((not (numberp resposta)) (format T "~%~%  ----- ATENCAO: Por favor insira um numero entre 0 e ~A -----~%~%" linha-maxima) (obter-resposta-linha linha-maxima))
     
     ((< resposta 0) (format T "~%~%  ----- ATENCAO: Por favor insira um numero entre 0 e ~A -----~%~%" linha-maxima) (obter-resposta-linha linha-maxima))
     
     ((> resposta linha-maxima) (format T "~%  ----- ATENCAO: Por favor insira um numero entre 0 e ~A -----~%~%" linha-maxima) (obter-resposta-linha linha-maxima))
     
     (T resposta)
    )
  )
)





;; obter-resposta-coluna

(defun obter-resposta-coluna (coluna-maxima)
  "Funcao que ira questionar o utilizador pela coluna em que deseja jogar"
  (let* 
      (
       (pergunta-linha (format T "~%  -Insira a coluna onde pretende jogar: (0 - ~A)~%" coluna-maxima))
       (resposta (read))
      )
    (cond
     ((not (numberp resposta)) (format T "~%~%  ----- ATENCAO: Por favor insira um numero entre 0 e ~A -----~%~%" coluna-maxima) (obter-resposta-linha coluna-maxima))
     
     ((< resposta 0) (format T "~%~%  ----- ATENCAO: Por favor insira um numero entre 0 e ~A -----~%~%" coluna-maxima) (obter-resposta-linha coluna-maxima))
     
     ((> resposta coluna-maxima) (format T "~%~%  ----- ATENCAO: Por favor insira um numero entre 0 e ~A -----~%~%" coluna-maxima) (obter-resposta-linha coluna-maxima))
     
     (T resposta)
    )
  )
)





;; hash-node

(defun hash-node (no)
  "Funcao hash que converte o estado e as pecas dos jogadores de um no numa string para que possa ser usada como key na hash table de memoizacao"
  (concatenate 'string (format nil "~S" (get-estado-no no)) (format nil "~S" (get-pecas-jogador1-no no)) (format nil "~S" (get-pecas-jogador2-no no)))
)
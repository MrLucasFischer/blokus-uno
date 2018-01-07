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
     ((equal tipo-de-jogo 'humano) (comecar-jogo-humano no tempo-limite profundidade-escolhida))
     (T (comecar-jogo-computador no tempo-limite profundidade-escolhida))
    )

    ; (cond
    ;  ((equal algoritmo-escolhido 'dfs)
    ;   (escrever-resultados (dfs no 'no-objetivo-p 'sucessores (operadores) profundidade-escolhida heuristica-escolhida) caminho))

    ;  (T (escrever-resultados (funcall algoritmo-escolhido no 'no-objetivo-p 'sucessores (operadores) heuristica-escolhida) caminho))
    ; )
    
  )
)



;; comecar-jogo-humano

(defun comecar-jogo-humano (no tempo-limite profundidade-maxima)
  "Funcao que implementa um jogo entre um humano e um computador"
)





;; comecar-jogo-computador

(defun comecar-jogo-computador (no tempo-limite profundidade-maxima)
  "Funcao que implementa um jogo entre dois computadores"
    (let* 
      (
       (resultado-alfabeta (alfabeta no profundidade-maxima (operadores) 'funcao-utilidade tempo-limite))
       (novo-no (cria-no 
                 (get-estado-no *melhor-jogada*)
                 (get-pecas-jogador1-no *melhor-jogada*)
                 (get-pecas-jogador2-no *melhor-jogada*)
                 (get-valor-jogador-no *melhor-jogada*)
                 (get-profundidade-no *melhor-jogada*)
                 'MAX ;not sure about this
                 (get-pai-no *melhor-jogada*)
                ))
       (reset-melhor-jogada (setf *melhor-jogada* nil))
      )
    novo-no
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

(defun ler-tempo-limite(&optional (resposta nil))
  "Funcao que ira questionar o utilizador sobre o tempo maximo que o computador tem para decidir sobre uma jogada"
  (cond

   ((null resposta) (format T "~% -> Insira o tempo maximo que o computador tem para decidir sobre uma jogada~%") (ler-tempo-limite (read)))

   ((not (numberp resposta)) (format T "~% -> Por favor insira um numero entre 1 e 10~%") (ler-tempo-limite))

   ((or (<= resposta 0) (>= resposta 11)) (format T "~% -> Por favor insira um numero entre 1 e 10~%") (ler-tempo-limite))

   (T resposta)
  )
)





;; escrever-resultados

(defun escrever-resultados (resultado caminho)
  "Funcao que ira imprimir o resultado para o ecra de uma forma mais clara bem como escrever as estatisticas num ficheiro estatisticas.dat"
  (cond
   ((not (null resultado))
    (let* (
           (no-objetivo (first resultado))
           (tabuleiro (get-estado-no no-objetivo))
           (pecas (get-pecas-no no-objetivo))
           (profundidade (get-profundidade-no no-objetivo))
           (heuristica-resultado (get-heuristica-no no-objetivo))
           (custo-resultado (get-f-no no-objetivo))
           (no-pai-resultado (get-pai-no no-objetivo))
         
           (tempo-inicial (second resultado))
           
           (nos-expandidos (third resultado))
           (nos-gerados (fourth resultado))
          )
      (progn
        (formatar-tabuleiro tabuleiro) ;Formata o estado no objetivo de modo a tornar-se mais apresentavel

        (format T "~%~%  -Pecas pequenas: ~A" (first pecas))
        (format T "~%  -Pecas medias: ~A" (second pecas))
        (format T "~%  -Pecas em cruz: ~A" (third pecas))
        (format T "~%~%  -Profundidade da solucao: ~A" profundidade)
        (format T "~%  -Heuristica do no objetivo: ~A" heuristica-resultado)
        (format T "~%  -Custo do no-objetivo: ~A" custo-resultado)

        (format T "~%~%  -Nos expandidos: ~A" nos-expandidos)
        (format T "~%  -Nos gerados: ~A" nos-gerados) ; para o IDA nao pode ser isto
        (format T "~%  -Tempo de Execucao: ~A segundo(s)" (- (get-universal-time) tempo-inicial))
        (format T "~%  -Penetrancia: ~A" (penetrancia profundidade nos-gerados))
        (format T "~%  -Fator de Ramificacao: ~A" (fator-ramificacao profundidade nos-gerados))

        (format T "~%~%  -No pai: ~A" no-pai-resultado)

        (escrever-estatisticas-ficheiro caminho tabuleiro pecas profundidade heuristica-resultado custo-resultado tempo-inicial nos-expandidos nos-gerados)
      )
    ))
   (T nil)
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





;; escrever-estatisticas-ficheiro

(defun escrever-estatisticas-ficheiro (caminho tabuleiro pecas profundidade heuristica-resultado custo-resultado tempo-inicial nos-expandidos nos-gerados)
  "Funcao que permite a escrita das estatisticas para um ficheiro estatisticas.dat"

  (with-open-file (ficheiro-estatisticas 
                   (concatenate 'string caminho "/estatisticas.dat")
                   :direction :output
                   :if-exists :append
                   :if-does-not-exist :create
                  )
    (progn
      (formatar-tabuleiro tabuleiro ficheiro-estatisticas)  ;Formata o estado no objetivo de modo a tornar-se mais apresentavel

      (format ficheiro-estatisticas "~%~%  -Pecas pequenas: ~A" (first pecas))
      (format ficheiro-estatisticas "~%  -Pecas medias: ~A" (second pecas))
      (format ficheiro-estatisticas "~%  -Pecas em cruz: ~A" (third pecas))
      (format ficheiro-estatisticas "~%~%  -Profundidade da solucao: ~A" profundidade)
      (format ficheiro-estatisticas "~%  -Heuristica do no objetivo: ~A" heuristica-resultado)
      (format ficheiro-estatisticas "~%  -Custo do no-objetivo: ~A" custo-resultado)

      (format ficheiro-estatisticas "~%~%  -Nos expandidos: ~A" nos-expandidos)
      (format ficheiro-estatisticas "~%  -Nos gerados: ~A" nos-gerados)
      (format ficheiro-estatisticas "~%  -Tempo de Execucao: ~A segundo(s)" (- (get-universal-time) tempo-inicial))
      (format ficheiro-estatisticas "~%  -Penetrancia: ~A" (penetrancia profundidade nos-gerados))
      (format ficheiro-estatisticas "~%  -Fator de Ramificacao: ~A" (fator-ramificacao profundidade nos-gerados))

      (format ficheiro-estatisticas"~%----------------------------------------------------------------------------------")
      (format ficheiro-estatisticas"~%----------------------------------------------------------------------------------~%") 
    )
  )
)
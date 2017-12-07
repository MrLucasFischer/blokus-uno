;;;;Disciplina de IA - 2017/2018
;;;;Projeto 1 - Blokus Uno
;;;;Autor: Andreia Pereira (n 150221021) e Lucas Fischer (n 140221004)

;;;;Funcoes de interacao com o utilizador e de escrita e leitura de ficheiros

;; carregar-ficheiros

(defun carregar-ficheiros ()
  "Funcao que carrega os restantes ficheiros do projeto (puzzle.lisp e procura.lisp) para que possam ser executados"
  (let (
        (caminho (ler-caminho))
       )
    ;Para Ubuntu, no meu caso:
    ;/home/lucas-fischer/Dropbox/Faculdade/IA/2018/Projeto/blokus-uno
    ;C:/Users/Andreia Pereira/Google Drive/3� Ano - 1� Semestre/IA/Projeto/blokus-uno
    (progn
      (compile-file (concatenate 'string caminho "/puzzle.lisp"))
      (compile-file (concatenate 'string caminho "/procura.lisp"))
      (load (concatenate 'string caminho "/puzzle.ufasl"));ufasl para Unix
      (load (concatenate 'string caminho "/procura.ufasl"))
      ;(load (concatenate 'string caminho "/puzzle.ofasl"));ofasl para windows
      ;(load (concatenate 'string caminho "/procura.ofasl"))
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
    (format T "~%                                                      ")
    (format T "~%                    ______               _____        ")
    (format T "~%      |---   |     /      \\ | /  |    | |     \\       ")
    (format T "~%      |   |  |     |      | |/   |    | \\_____        ")
    (format T "~%      |---   |     |      | |\\   |    |       \\       ")
    (format T "~%      |   |  |     |      | | \\  |    | \\     |       ")
    (format T "~%      |---   |____  \\____/  |  \\  \\__/   \\___/        ")
    (format T "~%                                 ____                 ")
    (format T "~%                 |     | |\\   | /    \\                ")
    (format T "~%                 |     | | \\  | |    |                ")
    (format T "~%                 |     | |  \\ | |    |                ")
    (format T "~%                  \\___/  |   \\|  \\___/                ")
    (format T "~%                                                      ")
    (format T "~%                                                      ")
    (format T "~%                     1 - Iniciar                      ")
    (format T "~%                     2 - Sair                         ")
    (format T "~%                                                      ")
    (format T "~%                                                      ~%")

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
         (tabuleiro-escolhido (ler-tabuleiro caminho))
         (algoritmo-escolhido (ler-algoritmo))
         (profundidade-escolhida (cond
                                  ((equal algoritmo-escolhido 'dfs) (ler-profundidade))
                                  (T nil)
                                 ))
         ;falta por aqui a escolha da heuristica
         (no (cria-no tabuleiro-escolhido 
                      (list 
                       (- 10 (peca-contagem tabuleiro-escolhido 'pequena))
                       (- 10 (peca-contagem tabuleiro-escolhido 'media))
                       (- 15 (peca-contagem tabuleiro-escolhido 'cruz))
                      )
                      0 ;profundidade do no raiz
                      0 ;chamar aqui a funcao heuristica escolhida
                      0 ;f do no raiz, que vai ser igual a heuristica porque g=0
                      nil ;no pai
             ))
        )

    (cond
     ((equal algoritmo-escolhido 'dfs)
      (escrever-resultados (dfs no 'no-objetivo-p 'sucessores (operadores) profundidade-escolhida) caminho))

     (T (escrever-resultados (funcall algoritmo-escolhido no 'no-objetivo-p 'sucessores (operadores)) caminho))
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
    (format T "~% -> 6 - Tabuleiro f)~%")

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
               ;(tabuleiro-g (ler-tabuleiro-ficheiro ficheiro)) ;Problema G da avaliacao oral
              )

        (cond
         ((not (numberp resposta)) (format T "~% -> Precisa de inserir um numero de 1 a 6~%") (ler-tabuleiro caminho))
         ((= resposta 1) tabuleiro-a)
         ((= resposta 2) tabuleiro-b)
         ((= resposta 3) tabuleiro-c)
         ((= resposta 4) tabuleiro-d)
         ((= resposta 5) tabuleiro-e)
         ((= resposta 6) tabuleiro-f)
         (T (format T "~% -> Precisa de inserir um numero de 1 a 6~%") (ler-tabuleiro caminho))
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




;; ler-algoritmo

(defun ler-algoritmo ()
  "Funcao que questiona o utilizador sobre qual o algoritmo de procura em espaco de estados que pretende utilizar"
  (progn
    (format T "~% -> Escolha o algoritmo de procura em espaco de estados que pretende")
    (format T "~% -> 1 - Breadth-First (bfs)")
    (format T "~% -> 2 - Depth-First (dfs)")
    (format T "~% -> 3 - A*")
    (format T "~% -> 4 - IDA*~%")

    (let (
          (resposta (read))
         )

      (cond
       ((not (numberp resposta)) (format T "~% > Precisa de inserir um numero entre 1 e 4~%") (ler-algoritmo))
       ((= resposta 1) 'bfs)
       ((= resposta 2) 'dfs)
       ((= resposta 3) 'a*)
       ((= resposta 4) 'ida*)
       (T (format T "~% -> Precisa de inserir um numero entre 1 e 4~%") (ler-algoritmo))
      )

    )

  )
)




;; ler-profundidade

(defun ler-profundidade (&optional (resposta nil))
  "Funcao que ira questionar o utilizador sobre qual a profundidade maxima que pretende para o algortimo Depth-First"
  (cond

   ((null resposta) (format T "~% -> Insira a profundidade maxima que deseja para o algoritmo~%") (ler-profundidade (read)))

   ((not (numberp resposta)) (format T "~% -> Por favor insira um numero maior do que 0~%") (ler-profundidade))

   ((<= resposta 0) (format T "~% -> Por favor insira um numero maior do que 0~%") (ler-profundidade))

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
         
           (abertos (second resultado))
           (fechados (third resultado))
           (tempo-inicial (fourth resultado))

           (nos-gerados (1- (+ (length abertos) (length fechados))))
          )
      (progn
        (formatar-tabuleiro tabuleiro)

        (format T "~%~%  -Pecas pequenas: ~A" (first pecas))
        (format T "~%  -Pecas medias: ~A" (second pecas))
        (format T "~%  -Pecas em cruz: ~A" (third pecas))
        (format T "~%~%  -Profundidade da solucao: ~A" profundidade)
        (format T "~%  -Heuristica do no objetivo: ~A" heuristica-resultado)
        (format T "~%  -Custo do no-objetivo: ~A" custo-resultado)

        (format T "~%~%  -Nos gerados: ~A" nos-gerados) ; para o IDA nao pode ser isto
        (format T "~%  -Tempo de Execucao: ~A segundo(s)" (- (get-universal-time) tempo-inicial))
        (format T "~%  -Penetrancia: ~A" (penetrancia profundidade nos-gerados))

        (format T "~%~%  -No pai: ~A" no-pai-resultado)

        (escrever-estatisticas-ficheiro caminho tabuleiro pecas profundidade heuristica-resultado custo-resultado tempo-inicial nos-gerados)
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

(defun escrever-estatisticas-ficheiro (caminho tabuleiro pecas profundidade heuristica-resultado custo-resultado tempo-inicial nos-gerados)
  "Funcao que permite a escrita das estatisticas para um ficheiro estatisticas.dat"

  (with-open-file (ficheiro-estatisticas 
                   (concatenate 'string caminho "/estatisticas.dat")
                   :direction :output
                   :if-exists :append
                   :if-does-not-exist :create
                  )
    (progn
      (formatar-tabuleiro tabuleiro ficheiro-estatisticas)

      (format ficheiro-estatisticas "~%~%  -Pecas pequenas: ~A" (first pecas))
      (format ficheiro-estatisticas "~%  -Pecas medias: ~A" (second pecas))
      (format ficheiro-estatisticas "~%  -Pecas em cruz: ~A" (third pecas))
      (format ficheiro-estatisticas "~%~%  -Profundidade da solucao: ~A" profundidade)
      (format ficheiro-estatisticas "~%  -Heuristica do no objetivo: ~A" heuristica-resultado)
      (format ficheiro-estatisticas "~%  -Custo do no-objetivo: ~A" custo-resultado)

      (format ficheiro-estatisticas "~%~%  -Nos gerados: ~A" nos-gerados) ; para o IDA nao pode ser isto
      (format ficheiro-estatisticas "~%  -Tempo de Execucao: ~A segundo(s)" (- (get-universal-time) tempo-inicial))
      (format ficheiro-estatisticas "~%  -Penetrancia: ~A" (penetrancia profundidade nos-gerados))

      (format ficheiro-estatisticas"~%----------------------------------------------------------------------------------")
      (format ficheiro-estatisticas"~%----------------------------------------------------------------------------------~%") 
    )
  )
)
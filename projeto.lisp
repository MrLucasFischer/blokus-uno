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
       (T (format T "~% -> Precisa de Inserir um n�mero (1 ou 2)") (menu-principal caminho))
      )
    )
  )
)


;;Pedir ao utilizador qual o tabuleiro que quer para criar o no
;;Pedir ao utilizador qual e o algoritmo que quer usar 
;; perguntar ao utilizaro qual e a profundidade que quer, caso seja dfs leio a profundidade, caso seja outro qualquer fazemos o most-positive-fixnum

;; iniciar

(defun iniciar (caminho)
  "Funcao que ira iniciar a aplicacao, pedindo ao utilizador para que escolha o tabuleiro que pretenda que seja o no inicial, o algoritmo que pretende utilizar e a profundidade maxima que pretende para o algoritmo dfs"
  (let* (
         (tabuleiro-escolhido (ler-tabuleiro caminho))
        )
    tabuleiro-escolhido
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


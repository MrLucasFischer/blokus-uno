;;;;Disciplina de IA - 2017/2018
;;;;Projeto 1 - Blokus Uno
;;;;Autor: Andreia Pereira (n� 150221021) e Lucas Fischer (n� 140221004)

;;;;Funcoes de interacao com o utilizador e de escrita e leitura de ficheiros

;; carregar-ficheiros

(defun carregar-ficheiros ()
  "Funcao que carrega os restantes ficheiros do projeto (puzzle.lisp e procura.lisp) para que possam ser executados"
  (let (
        (caminho (ler-caminho))
       )
    ;Para Ubuntu, no meu caso:
    ;/home/lucas-fischer/Dropbox/Faculdade/IA/2018/Projeto/blokus-uno
    (progn
      (compile-file (concatenate 'string caminho "/puzzle.lisp"))
      (compile-file (concatenate 'string caminho "/procura.lisp"))
      (menu-principal caminho)
    )
  )
)



;; ler-caminho

(defun ler-caminho (&optional (caminho nil))
  "Funcao que questiona o utilizador pelo caminho onde se encontra os ficheiros do projeto, devolvendo a sua resposta"
  (cond
   ((null caminho) (format T "Introduza o caminho at� ao diretorio do projeto~%") (ler-caminho (read-line)))
   (T caminho)
  )
)




;; menu-principal

(defun menu-principal (caminho)
  "Funcao que ira mostrar ao utilizador o menu principal da aplicacao blokus-uno dando-lhe a escolher qual a acao desejada"

  ;;Ao Correr ficara com a formatacao correta
  (progn
    (format T "~% |---------------------------------------------------|")
    (format T "~% |                  ______                 _____     |")
    (format T "~% |    |---   |     /      \\ | /  |    |   |     \\    |")
    (format T "~% |    |   |  |     |      | |/   |    |   \\_____     |")
    (format T "~% |    |---   |     |      | |\\   |    |         \\    |")
    (format T "~% |    |   |  |     |      | | \\  |    |   \\     |    |")
    (format T "~% |    |---   |____  \\____/  |  \\  \\__/     \\___/     |")
    (format T "~% |                               ____                |")
    (format T "~% |               |     | |\\   | /    \\               |")
    (format T "~% |               |     | | \\  | |    |               |")
    (format T "~% |               |     | |  \\ | |    |               |")
    (format T "~% |                \\___/  |   \\|  \\___/               |")
    (format T "~% |                                                   |")
    (format T "~% |                                                   |")
    (format T "~% |                   1 - Iniciar                     |")
    (format T "~% |                   2 - Sair                        |")
    (format T "~% |                                                   |")
    (format T "~% |---------------------------------------------------|")

    (let* (
            
          )

    )
  )
)

(defun menu-principal-2 (caminho)
  "Funcao que ira mostrar ao utilizador o menu principal da aplicacao blokus-uno dando-lhe a escolher qual a acao desejada"
  (progn
    (format T "~% |---------------------------------------------------|")
    (format T "~% |                                                   |")
    (format T "~% |                       B                           |")
    (format T "~% |                        L                          |")
    (format T "~% |                         O                         |")
    (format T "~% |                          K                        |")
    (format T "~% |                        U  U                       |")
    (format T "~% |                         N  S                      |")
    (format T "~% |                          O                        |")
    (format T "~% |                                                   |")
    (format T "~% |                   1 - Iniciar                     |")
    (format T "~% |                   2 - Sair                        |")
    (format T "~% |                                                   |")
    (format T "~% |---------------------------------------------------|")

    (let* (
            
          )

    )
  )
)
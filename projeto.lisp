;;;;Disciplina de IA - 2017/2018
;;;;Projeto 1 - Blokus Uno
;;;;Autor: Andreia Pereira (nº 150221021) e Lucas Fischer (nº 140221004)

;;;;Funcoes de interacao com o utilizador e de escrita e leitura de ficheiros

;; carregar-ficheiros

(defun carregar-ficheiros ()
  "Funcao que carrega os restantes ficheiros do projeto (puzzle.lisp e procura.lisp) para que possam ser executados"
  (let (
        (caminho (ler-caminho))
       )
    ;Para Ubuntu, no meu caso:
    ;/home/lucas-fischer/Dropbox/Faculdade/IA/2018/Projeto/blokus-uno
    (compile-file (concatenate 'string caminho "/puzzle.lisp"))
    (compile-file (concatenate 'string caminho "/procura.lisp"))
  )
)



;; ler-caminho

(defun ler-caminho (&optional (caminho nil))
  (cond
   ((null caminho) (format T "Introduza o caminho até ao diretorio do projeto~%") (ler-caminho (read-line)))
   (T caminho)
  )
)
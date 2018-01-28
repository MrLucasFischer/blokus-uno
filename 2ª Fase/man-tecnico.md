# **Manual Técnico**

<br /><br />

<p align="center">
    <img src="../1ª Fase/images/IPSlogo.PNG">
</p>

### _Unidade Curricular: Inteligência Artificial_ &nbsp;&nbsp;2017/2018


 Andreia Pereira nº 150221021 <br/>
 Lucas Fischer nº 140221004

<div style="page-break-after: always;"></div>

<h1>Tabela de Conteudos</h1>

* Introdução
* Estrutura do Projeto
* Detalhes de Implementação
* Estudos de eficiência
* Limitações

<div style="page-break-after: always;"></div>

<h1>1- Introdução</h1>

 Blokus-Duo é uma aplicação desenvolvida em Common Lisp para a unidade curricular de Inteligência Artificial. A aplicação consiste num programa que tem como objetivo simular um jogo de blokus entre um humano e um computador, ou  entre dois comptadores. <br/> <br /> Para o contexto da aplicação, o problema a solucionar enquadra-se no jogo do Blokus, mais específicamente em dar a possíbilidade ao computador de fazer jogadas mais informadas.

<br /><br />

<h1>2- Estrutura do Projeto</h1>

 De modo a facilitar a compreensão e a manutenção do código desenvolvido para esta aplicação, a mesma está dividida em três ficheiros _**.lisp**_, estes são:

* <b>_puzzle.lisp_</b> - Neste ficheiro estão situadas todas as funções que modelam o dominio problema a solucionar, é neste ficheiro que está implementado o código dependente do dominio do problema. O ficheiro puzzle.lisp consta com funções que permitem: **estruturar um tipo de dados para o problema**, **definir os operadores do problema**, **identificar o nó objetivo**, **calcular o valor heurístico de um nó**, entre outras funções.

<br/>

* <b>_algortimo.lisp_</b> - O ficheiro algortimo.lisp é o ficheiro onde estão situadas as funções que implementam o **algoritmo AlfaBeta**, **os sucessores**,  e outras funções auxiliares. As funções presentes neste ficheiro são independentes do dominio do problema, podendo ser reutilizadas para outros problemas. O ficheiro algortimo.lisp é o ficheiro que apresenta um maior teor teórico relevante para a unidade curricular de **Inteligência Artificial**

<br/>

* <b>_jogo.lisp_</b> - Este ficheiro é responsável por orquestrar os restantes ficheiros, carregando as funções presentes nos outros ficheiros para memória e compilando-as de modo a que se tornem executáveis. É também neste ficheiro que decorre a implementação do código responsável pela interação com o utilizador e com a leitura e escrita de ficheiros.

<br/>

* <b>_log.dat_</b> - O ficheiro log.dat é onde podem ser consultadas todas as jogadas realizadas durante os jogos. Toda a informação apresentada no ecrã durante a execução do jogo é guardada neste ficheiro para consulta posterior.

<br/>

* <b>_problemas.dat_</b> - Neste ficheiro estão presentes todos os tabuleiros iniciais possíveis para a execução da aplicação. Consiste numa série de listas que representam um tabuleiro separadas por um separador legal.

<br/>

```
blokus-uno/
        ├── jogo.lisp ; Ficheiro onde é iniciada a aplicação
        ├── algoritmo.lisp ; Contem a implementação do algoritmo alfabeta
        ├── puzzle.lisp ; Contem as funções do domínio do problema
        ├── log.dat ; Ficheiro que contem logs das jogadas realizadas
        └── problemas.dat ; Ficheiro com os tabuleiros iniciais do problema
```

<br/><br/>
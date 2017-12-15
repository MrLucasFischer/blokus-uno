
# **&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Manual Técnico**

<br /><br />

## _Unidade Curricular: Inteligência Artificial_ &nbsp;&nbsp;2017/2018


### Andreia Pereira nº 150221021
### Lucas Fischer nº 140221004

<br /><br /><br /><br />

<h1>Tabela de Conteudos</h1>

* <h2>Introdução</h2>
* <h2>Estrutura do Projeto</h2>
* <h2>Detalhes de Implementação</h2>
* <h2>Estudos de Algoritmos</h2>
* <h2>Documentação das Funções</h2>
* <h2>Conclusão</h2>

<br /><br />

<h1>1- Introdução</h1>

### Blokus-Uno é uma aplicação desenvolvida em Common Lisp para a unidade curricular de Inteligência Artificial. A aplicação consiste num programa que tem como objetivo encontrar uma solução para um determinado problema, sendo esta solução a de caminho mais curto ou a de menor custo. <br/> <br /> Para o contexto da aplicação, o problema a solucionar enquadra-se no jogo do Blokus, mais específicamente em encontrar uma solução que permita chegar a um estado onde o jogador não tenha mais possibilidade de jogar.

<br /><br /><br /><br />

<h1>2- Estrutura do Projeto</h1>

### De modo a facilitar a compreensão e a manutenção do código desenvolvido para esta aplicação, a mesma está dividida em três ficheiros _**.lisp**_, estes são:

* <b>_puzzle.lisp_</b> - Neste ficheiro estão situadas todas as funções que modelam o dominio problema a solucionar, é neste ficheiro que está implementado o código dependente do dominio do problema. O ficheiro puzzle.lisp consta com funções que permitem: **estruturar um tipo de dados para o problema**, **definir os operadores do problema**, **identificar o nó objetivo**, **calcular o valor heurístico de um nó**, entre outras funções.

<br/>

* <b>_procura.lisp_</b> - O ficheiro procura.lisp é o ficheiro onde estão situadas as funções que implementam os **algoritmos de procura em espaço de estados**, **os sucessores**, **calculo da efiência dos algoritmos** e outras funções auxiliares dos algoritmos de procura em espaço de estados. As funções presentes neste ficheiro são independentes do dominio do problema, podendo ser reutilizadas para outros problemas. O ficheiro procura.lisp é o ficheiro que apresenta um maior teor teórico relevante para a unidade curricular de **Inteligência Artificial**
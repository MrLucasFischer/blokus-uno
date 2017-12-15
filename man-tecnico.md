
# **Manual Técnico**

<br /><br />

### _Unidade Curricular: Inteligência Artificial_ &nbsp;&nbsp;2017/2018


 Andreia Pereira nº 150221021 <br/>
 Lucas Fischer nº 140221004

<br /><br />

<h1>Tabela de Conteudos</h1>

* Introdução
* Estrutura do Projeto
* Detalhes de Implementação
* Estudos de Algoritmos
* Documentação das Funções
* Conclusão

<br /><br />

<h1>1- Introdução</h1>

 Blokus-Uno é uma aplicação desenvolvida em Common Lisp para a unidade curricular de Inteligência Artificial. A aplicação consiste num programa que tem como objetivo encontrar uma solução para um determinado problema, sendo esta solução a de caminho mais curto ou a de menor custo. <br/> <br /> Para o contexto da aplicação, o problema a solucionar enquadra-se no jogo do Blokus, mais específicamente em encontrar uma solução que permita chegar a um estado onde o jogador não tenha mais possibilidade de jogar.

<br /><br />

<h1>2- Estrutura do Projeto</h1>

 De modo a facilitar a compreensão e a manutenção do código desenvolvido para esta aplicação, a mesma está dividida em três ficheiros _**.lisp**_, estes são:

* <b>_puzzle.lisp_</b> - Neste ficheiro estão situadas todas as funções que modelam o dominio problema a solucionar, é neste ficheiro que está implementado o código dependente do dominio do problema. O ficheiro puzzle.lisp consta com funções que permitem: **estruturar um tipo de dados para o problema**, **definir os operadores do problema**, **identificar o nó objetivo**, **calcular o valor heurístico de um nó**, entre outras funções.

<br/>

* <b>_procura.lisp_</b> - O ficheiro procura.lisp é o ficheiro onde estão situadas as funções que implementam os **algoritmos de procura em espaço de estados**, **os sucessores**, **calculo da efiência dos algoritmos** e outras funções auxiliares dos algoritmos de procura em espaço de estados. As funções presentes neste ficheiro são independentes do dominio do problema, podendo ser reutilizadas para outros problemas. O ficheiro procura.lisp é o ficheiro que apresenta um maior teor teórico relevante para a unidade curricular de **Inteligência Artificial**

<br/>

* <b>_projeto.lisp_</b> - Este ficheiro é responsável por orquestrar os restantes ficheiros, carregando as funções presentes nos outros ficheiros para memória e compilando-as de modo a que se tornem executáveis. É também neste ficheiro que decorre a implementação do código responsável pela interação com o utilizador e com a leitura e escrita de ficheiros.

<br/>

* <b>_estatisticas.dat_</b> - O ficheiro estatisticas.dat é onde podem ser consultadas todas as métricas de eficiência (bem como outras informações) provenientes da execução da aplicação para um determinado problema.

<br/>

* <b>_problemas.dat_</b> - Neste ficheiro estão presentes todos os tabuleiros iniciais possíveis para a execução da aplicação. Consiste numa série de listas que representam um tabuleiro separadas por um separador legal.

<br/>

```
blokus-uno/
        ├── projeto.lisp ; Ficheiro onde é iniciada a aplicação
        ├── procura.lisp ; Contem a implementação dos algoritmos
        ├── puzzle.lisp	; Contem as funções do domínio do problema
        ├── estatisticas.dat ; Ficheiro que contem logs das estatisticas
        └── problemas.dat ; Ficheiro com os tabuleiros iniciais do problema
```

<br/><br/>

<h1>Detalhes da Implementação</h1>

 Dado que Common Lisp é uma linguagem de programação de natureza funcional o desenvolvimento da aplicação consistiu em desenvolver código num paradigma funcional, deste modo algumas técnicas como sequênciação, ciclos e atribuição não foram utilizadas para poder-se focar na recursividade e desenvolvimento de funções. Embora tenham sido permitidas algumas utilizações especiais de ciclos e atribuições, estes não foram utilizados.

<br/><br/>

<h1>Estudo dos Algoritmos</h1>

 Um dos objetivos principais no desenvolvimento deste projeto é construir uma ferramenta que não só desse a solução para um problema como também podesse dar alguma informação relevante para a comparação de eficiência de algoritmos, de modo a que os utilizadores possam ter uma noção mais prática do que consistem estas métricas de eficiência.

<br/>

 Para a comparação de eficiência de algoritmos foram utilizadas as seguintes métricas:

* <b>Número de nós gerados</b> - O número de nós que foram gerados pelo algoritmo até este encontrar o nó objetivo


* <b>Número de nós expandidos</b> - O número de nós que foram gerados pelo algoritmo até este encontrar o nó objetivo


* <b>Penetrância</b> - **P = Tamanho da Solução / Nós gerados** . Esta métrica consiste na razão entre o número de nós que pertencem ao conjunto de nós que constituem a solução do problema e o número total de nós gerados, o que nos dá uma boa percepção do número de nós, sem significado para a solução do problema, que foram gerados até se encontrar o nó objetivo. <br/> O valor da penetrância varia entre **[0,1]** em que 1 seria o valor ideal para esta métrica. Ex:. P = 0.5, conclui-se que 50% dos nós que foram gerados não têm fazem parte do conjunto de nós que constitui a solução


* <b>Fator de Ramificação</b> - **( B / B-1 ) * ( B^L - 1) = T**. É necessário resolver esta equação em ordem a B para nos dar o valor de ramificação médio da árvore de estados do problema, mas dado a impraticabilidade de calcular esta equação, são aplicados métodos computacionais de modo a conseguir resolve-la aproximadamente. Neste projeto foi implementado o método da bisseção para o calculo do fator de ramificação. <br/> Esta métrica representa o número de sucessores que, em média, cada nó terá e corresponde a um valor pertencente ao intervalo de **[1,+00[**.

* <b>Tempo de Execução</b> - Talvez a métrica mais intuitiva, o tempo de execução cronometra o tempo que o algoritmo demorou até devolver uma solução, logo, quanto menos tempo o algoritmo demorar melhor.

Para a comparação de estes algoritmos foi elaborada uma tabela comparativa de modo a facilitar a percepção e comparação entre os algoritmos:

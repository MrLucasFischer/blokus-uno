
# **Manual de Utilizador**

<br /><br />

<p align="center">
    <img src="../1ª Fase/images/IPSlogo.PNG">
</p>

### _Unidade Curricular: Inteligência Artificial_ &nbsp;&nbsp;2017/2018


 Andreia Pereira nº 150221021 <br/>
 Lucas Fischer nº 140221004

<div style="page-break-after: always;"></div>

<h1>1- Descrição da aplicação</h1>

 Blokus-Duo é uma aplicação que simula o jogo de blokus com algumas alterações às suas regras. A aplicação tem como objetivo simular este jogo podendo-se jogar contra um computador ou observar o jogo entre dois computadores.

<br/><br />

<h1>2- Iniciar a Aplicação</h1>

 Para poder dar iniciar a aplicação necessita de abrir o ficheiro _**jogo.lisp**_ no IDE _**LispWorks**_.  Uma vez aberto deverá estar à semelhança da seguinte foto: 

<p align="center">
    <img src="../1ª Fase/images/segunda-fase/jogolisp.png">
</p>

<br/>
 De modo a que consiga iniciar a aplicação, tem que primeiro compilar as suas funções, para isso carregue no botão que diga <b>"Compile Buffer"</b> :
 <p align="center">
    <img src="../1ª Fase/images/compile-buffer.png">
</p>

<br/>

 Está agora pronto para iniciar esta fantástica aplicação! Comece por executar a função `(jogar)` no painel chamado _**Listener**_ e de seguida insira o caminho para a diretoria principal da aplicação. (ex: C:/Users/_NOME DO UTILIZADOR_/Documentos/blokus-uno) e carregue na tecla enter.

<p align="center">
    <img src="../1ª Fase/images/carregar-ficheiros.png">
</p>


 Irá ver que a aplicação foi bem compilada e de seguida ser-lhe-á apresentado um menu principal onde poderá dar início à aplicação.

<p align="center">
    <img src="../1ª Fase/images/segunda-fase/menu-principal.png">
</p>

 Neste magnífico menu principal pode escolher uma de duas opções:
1. **Iniciar** - Esta opção dará início à aplicação, levando-lhe para outros menus onde tem a possibilidade de escolher qual o **tabuleiro inicial** que deseja, qual o **tipo de jogo** (humano vs máquina ou máquina vs máquina), **quem joga primeiro** caso tenha escolhido a opção humano vs máquina, qual o **tempo máximo** que o computador tem para decidir sobre uma jogada, e qual a **profundidade máxima** para a expansão da árvore de procura.

2. **Sair** - Como pode deduzir, esta opção leva ao término da aplicação, parando a sua execução.

<br/><br />

<h1>3- Utilização da Aplicação</h1>

 Escolhendo a opção de **Iniciar** a aplicação irá levá-lo para outros menus onde irá ser questionado sobre as escolhas que pretende fazer na execução da aplicação. <br/> Estes menus são:
* <b>Escolha do tabuleiro inicial</b>

<p align="center">
    <img src="../1ª Fase/images/segunda-fase/escolher-tabuleiro1.png">
</p>

<br/>
Onde pode escolher qual o tabuleiro que pretende que seja o tabuleiro inicial

<br/>

* <b>Escolha do modo de jogo</b>

<p align="center">
    <img src="../1ª Fase/images/segunda-fase/escolha-jogo2.png">
</p>

Aqui pode escolher se pretende jogar contra um computador ou observar o jogo entre dois computadores

* <b>Escolher quem joga primeiro (caso tenha escolhido Humano vs Computador)</b>

<p align="center">
    <img src="../1ª Fase/images/segunda-fase/tipo-jogo3.png">
</p>

Caso tenha escolhido a opção Humano vs Computador no menú anterior é-lhe apresentado uma opção onde pode escolher qual o jogador com que pretende jogar, onde se escolher o jogador1 pode jogar em primeiro lugar

* <b>Escolher o tempo máximo que o Computador tem para decidir sobre uma jogada</b>

<p align="center">
    <img src="../1ª Fase/images/segunda-fase/tempo-jogada4.png">
</p>

Onde pode inserir um número (positivo) que representa quantos **segundos** o computador tem para decidir sobre uma jogada quando é a sua vez de jogar

<p align="center">
    <img src="../1ª Fase/images/segunda-fase/max-depth5.png">
</p>

Neste menú pode inserir um número (também positivo) que representa o nível máximo de expansão da árvore de procura que o computador pode fazer quando está a decidir qual a melhor jogada. **Dica:** Se quiser parecer bem e ganhar sempre ao computador insira um número pequeno!

<br/><br/>

<h1>4- Jogar</h1>

Neste capítulo vamos ensinar-lhe a parte que interessa, jogar! Existem dois modos de jogo na aplicação como já sabe e iremos falar sobre os dois

* <b>Humano vs Computador</b>

Caso tenha escolhido esta opção verá um ecrã semelhante a este

<p align="center">
    <img src="../1ª Fase/images/segunda-fase/jogar-h.png">
</p>

Aqui tem toda a informação necessária para fazer as suas jogadas:

* <b>Tabuleiro e Peças</b>

<p align="center">
    <img src="../1ª Fase/images/segunda-fase/tab.png">
</p>

Esta parte mostra-lhe qual o estado em que o jogo se encontra, i.e., qual o tabuleiro onde vai jogar a sua jogada e quais são o número de peças que lhe faltam e ao computador.

* <b>Jogadas Possíveis</b>

<p align="center">
    <img src="../1ª Fase/images/segunda-fase/jogadas.png">
</p>

Aqui tem a informação sobre quais são as jogadas que pode efetuar, aparecendo-lhe uma lista com sub-listas em que cada uma delas representa um jogada possível **(linha coluna)**

* <b>Escolher a Jogada</b>

<p align="center">
    <img src="../1ª Fase/images/segunda-fase/escolher-peca.png">
</p>

Após ter analisádo toda a árvore de jogo mentalmente e já se sente confiante para vencer o computador, pode então escolher qual a jogada que pretende efetuar e para isso começa por: **Escolher qual o tipo de peça**, depois **Escolher qual a linha que pretende jogar** e finalmente **Escolher qual a coluna que pretende jogar**.
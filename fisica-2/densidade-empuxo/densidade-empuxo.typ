#import "styles.typ": *

#show: setup.with(
  title: [Densidade e Empuxo],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

#section([= Introdução])

O estudo dos fluidos, sejam eles líquidos ou gases, é fundamental para compreender uma vasta gama de fenômenos naturais e aplicações tecnológicas. Dentro desse campo, dois conceitos interligados e de grande importância são a *densidade* e o *empuxo*, este último magistralmente descrito pelo *Princípio de Arquimedes*. A compreensão dessas grandezas nos permite explicar por que alguns objetos flutuam enquanto outros afundam, como navios colossais conseguem navegar e como balões de ar quente se elevam aos céus #cite(<Halliday2>).

A *densidade*, ou *massa específica* ($rho$) de um corpo é uma propriedade fundamental que relaciona sua *massa* ($m$) ao seu *volume* $V$, sendo expressa por:

$
  rho = frac(m, V)
$<eq-densidade>



#figure(
  kind: table,
  caption: [Densidade de algumas substâncias]
)[
  #table(
    columns: (1fr, 1fr),
    align: (left, right),
    table.header([Material], [Densidade $rho$ ($"g/cm"^3$)]),
    [Cobre], [8,93],
    [Ferro], [7,87],
    [Aço], [7,85],
    [Alumínio], [2,70],
    [Água], [1,00]
  )
  #v(-0.25cm)
  #text(size: 10pt)[Fonte: #cite(<Halliday2>, form: "prose")]
]

Essa grandeza nos permite entender o quão "compacta" é a matéria e é uma propriedade crucial para determinar o comportamento de um objeto quando imerso em um fluido.

De acordo com o _Princípio de Pascal_, quando imerso em um fluido, um corpo sofre a ação de pressões sobre sua superfície, maiores em sua parte inferior do que em sua parte superior. Como consequência, o corpo sofre ação de uma força vertical para cima, denominada *empuxo* #cite(<Halliday2>).

Esse fenômeno é governado pelo _Princípio de Arquimedes_, de acordo com o qual o
empuxo sobre um corpo imerso num fluido é uma força cujo módulo ($E$) é igual ao peso do volume de fluido deslocado pelo corpo no processo de imersão. Além disso, como dito acima, esta força tem direção vertical e sentido orientado para cima.

$
  E = rho_f g V_(d e s)
$<eq-empuxo>
#par(first-line-indent: 0pt)[em que $rho_f$ é a densidade do fluido, $g = 9,8 " m/s"^2$ é a aceleração da gravidade local e $V_(d e s)$ é o volume de fluido deslocado.]

Para demonstrar esse fato, consideremos um corpo de massa $m$, volume $V$ e densidade $rho = frac(m, V)$, totalmente subserso
em água e sustentado por um fio conectado a um dinamômetro. 

#figure(
  caption: [Aparato experimental],
  cetz.canvas({
    import cetz.draw: *
    // Suporte
    line((-1, 6.5), (1, 6.5))
    line((0, 6), (0, 6.5))
    for i in range(9) {
      let d = 0.25
      let x = -1 + d * i
      line((x, 6.5), (x+d, 6.5+d))
    }
    // Dinamômetro
    rect((-0.25, 3.75), (0.25, 6), fill: uft-blue, stroke: uft-blue)
    rect((-0.2, 3), (0.2, 3.75), fill: white)
    for i in range(5) {
      let h = 3.2 + i/10
      line((0, h), (0.2, h))
    }
    content(
      (-0.75, 4.5), 
      angle: 90deg,
      [Dinamômetro]
    )
    // Fio
    line((0, 1.3), (0, 3))
    // Corpo de Prova
    rect((-.5,-1.3), (0.5,1.3), fill: uft-yellow.transparentize(50%), stroke: uft-yellow)
    // Fluido
    line((-1.5, 1.5), (-1.5, -3), (1.5, -3), (1.5, 1.5), fill: uft-blue.transparentize(80%), stroke: none)
    // Proveta
    line((-1.5, 2), (-1.5, -3), (1.5, -3), (1.5, 2), stroke: (thickness: 1.5pt))
    for i in range(9) {
      let h = -2.5 + i/2
      line((1.3, h), (1.5, h))
    }
    content(
      (0, -2.75),
      [Proveta]
    )
    // Forças
    circle((0,0), radius: 2pt, fill: black)
    line((0, 0), (0, -2), stroke: (thickness: 1.5pt), mark: (end: "stealth", fill: black), name: "peso")
    content(
      ("peso.end"),
      anchor: "west",
      padding: 0.1, 
      [$P$]
    )
    line((0, 0), (0, 1), stroke: (thickness: 1.5pt), mark: (end: "stealth", fill: black), name: "empuxo")
    content(
      ("empuxo.end"),
      anchor: "west",
      padding: 0.1,
      [$E$]
    )
    line((0, 1.3), (0, 2.3), stroke: (thickness: 1.5pt), mark: (end: "stealth", fill: black), name: "tensao")
    content(
      ("tensao.end"),
      anchor: "west",
      padding: 0.1,
      [$T$]
    )
  })
)<fig-aparato>
#v(-0.25cm)
#align(center)[#text(size: 10pt)[Fonte: Labfis (2025)]]


Como ilustrado na @fig-aparato, sobre o corpo atuam três forças. Além da força de empuxo $E$, definida pela @eq-empuxo, autam a força peso $P$ devido a atração gravitacional terrestre, cujo módulo é dado por

$
  P = m g
$<eq-peso>

#par(first-line-indent: 0pt)[e a tensão $T$ no fio, cujo valor é registrado pelo dinamômetro. Dado que o corpo está em equilíbrio, podemos escrever:]

$
  T + E = P &arrow.double T + rho_f g V_(d e s) = m g \
            &arrow.double T + rho_f g V = (rho V) g \
            &arrow.double rho = rho_f + frac(T, g V)
$<eq-final>

Observe que no desenvolvimento acima, utilizamos a definição de densidade para substituir a massa $m$ ($rho = frac(m, V) arrow.double m = rho V$). Além disso, dado que o corpo está totalmente subserso, temos que o volume deslocado é igual ao volume do corpo ($V_(d e s) = V$).

\
#section([= Objetivos])

+ Compreender os conceitos de densidade e empuxo;
+ Confirmar que o empuxo é igual ao peso do fluido deslocado;
+ Calcular a densidade de corpos de prova de materiais por métodos diferentes;


#section([= Material Necessário])

- Paquímetro ou régua milimetrada;
- Proveta graduada em milílitros;
- Água;
- Balança digital;
- Corpos de prova de materiais distintos.


#section([= Procedimentos])

#section([== Primeira Parte])

#info-box(
  [],
  [
    Nesta etapa o aluno deverá determinar a densidade de diferentes materiais utilizando a definição desta grandeza dada pela @eq-densidade.
  ]
)

+ Ordene os corpos de prova conforme suas características visuais. 
+ Com a balança digital, meça as massas de cada corpo de prova. Anote os resultados na @tab-dados-1.
+ Adicione água na proveta até a marcação de $V_i = 70 "ml"$. 
+ Cuidasosamente, mergulhe completamente cada um dos corpos de prova e verifique a marcação $V_f$ na proveta. 


#info-box([Atenção], [
  Cada "traço" na escala da proveta equivale a $1 "ml"$.\
  Conversão: $1 "ml" equiv 1 "cm"^3$
])


#set enum(start: 5)
+ Calcule o volume dos corpos de prova $V = V_f - V_i$. Converta o resultado de mililitros (ml) para centímetros cúbicos ($"cm"^3$).
+ Usando a @eq-densidade, calcule a densidade de cada um dos corpos de prova.

#figure(
  kind: table,
  caption: [Coleta de dados - Primeira Parte],
)[
  #table(
    columns: (1fr, 3fr, 3fr, 3fr, 3fr, 3fr),
    table.header([], [$m ("g")$], [$V_i ("ml")$], [$V_f ("ml")$], [$V ("cm"^3)$], [$rho ("g/cm"^3)$]),
    [1], [], [], [], [], [],
    [2], [], [], [], [], [],
    [3], [], [], [], [], [],
  )
]<tab-dados-1>

#section([== Segunta Parte])

#info-box(
  [],
  [
    Nesta etapa o aluno deverá determinar a densidade de diferentes materiais utilizando o \ Princípio de Arquimedes  e a @eq-final.
  ]
)

#set enum(start: 1)
+ Execute os passos seguintes com os corpos de prova na mesma ordem da Primeira Parte.
+ Cuidadosamente, conecte o primeiro corpo de prova ao dinamômetro. 
+ Ajuste a altura do sistema até que o corpo de prova fique completamente submerso na água.

#info-box([Atenção], [
  #set math.equation(numbering: none)
  - Faça a leitura da força de tensão na escala em *Newton*;
  - Cada "traço" na escala do dinamômetro equivale a $0,02 "N"$. Por exexmplo, se a leitura indica o terceiro traço após $1 "N"$, o valor da força de tensão será: $ 1 + 3 dot 0,02 = 1,06 "N" $
])

#set enum(start: 4)
+ Faça a leitura da força de tensão $T$ mascada no dinamômetro. Anote o resultado na

+ Colete o volume $V$ de cada corpo de prova obtido na @tab-dados-1. Converta a unidade de $"ml"$ para $"m"^3$ e anote no campo correspondente da @tab-dados-2.

+ Utilizando a @eq-final, deduzida a partir do Princípio de Arquimedes, calcule a densidade de cada corpo de prova.

+ Converta o valor encontrado para a densidade de cada corpo de prova de $"kg/m"^3$ para $"g/cm"^3$ (Lembre-se que $1 "kg/m"^3 equiv 10^(-3) "g/cm"^3$). 

#figure(
  kind: table,
  caption: [Coleta de dados - Segunda Parte],
)[
  #table(
    columns: (1fr, 3.5fr, 3.5fr, 3.5fr, 3.5fr),
    table.header([], [$T ("N")$], [$V ("m"^3)$], [$rho ("kg/m"^3)$], [$rho ("g/cm"^3)$]),
    [1], [], [], [], [],
    [2], [], [], [], [],
    [3], [], [], [], [],
  )
]<tab-dados-2>


#section([= Análise de Dados])

#info-box([], [
  Nesta seção, consideraremos os valores de densidade encontrados na Primeira Parte como _valores esperados_ para a densidade de cada corpo de prova, representando-os por $rho_(e s p)$. Em contrapartida, os valores encontrados na Segunda Parte serão nossos _valores experimentais_, representados por $rho_(e x p)$.

  Vamos avaliar a qualidade do experimento, calculando o erro percentual por meio da fórmula:
  $
    "erro (%)" = frac(|rho_(e x p) - rho_(e s p)|, rho_(e s p)) dot 100 %
  $<eq-erro>
])

#set enum(start: 1)
+ Colete os valores da densidade de cada corpo de prova na Primeira Parte e anote no campo correspondente da @tab-analise. Repita com os dados de densidade da Segunda Parte.
+ Usando a @eq-erro, calcule o erro percentual $"erro (%)"$ na determinação da densidade de cada corpo de prova.
+ Você é capaz de determinar o material de que cada corpo de prova é feito? Discuta os resultados.

#figure(
  kind: table,
  caption: [Análise do erro experimental],
)[
  #table(
    columns: (1fr, 5fr, 5fr, 3.5fr, 3.5fr),
    table.header([],  [Primeira Parte \ $rho_(e s p) ("g/cm"^3)$], [Segunda Parte\ $rho_(e x p) ("g/cm"^3)$], [$"erro (%)"$], [Material]),
    [1], [], [], [], [],
    [2], [], [], [], [],
    [3], [], [], [], [],
  )
]<tab-analise>


#set heading(numbering: none)
#section([= Referências])

#bibliography("assets/references/references.bib", style: "assets/references/abnt.csl", title:"")
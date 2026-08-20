#import "styles.typ": *
#import "@preview/subpar:0.2.2"

#show: setup.with(
  title: [Torque e Equilíbrio Rotacional],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

#section([= Introdução])

Assim como a força é o agente que altera o estado de movimento translacional de um corpo, o *torque* (também chamado de *momento* de uma força) é a grandeza física que mede a tendência de uma força de provocar a rotação de um corpo rígido ao redor de um eixo.

O torque $arrow(tau)$ de uma força $arrow(F)$ em relação a um ponto $O$ de um corpo rífido é definido pelo produto vetorial

$
  arrow(tau) = arrow(r) times arrow(F)
$<eq-def-torque>
#par(first-line-indent: 0cm)[onde $arrow(r)$ é o vetor posição de $O$ a linha de ação da força $arrow(F)$ (Ver @fig-torque). Note que $arrow(tau)$ é um vetor cuja direção é perpendicular ao plano definido pelos vetores $arrow(r)$ e $arrow(F)$ e cujo sentido é dado pela _regra da mão direita_.]

#figure(
  cetz.canvas({
    import cetz.draw: *

    rotate(z: 10deg, y:10deg)

    circle((0,0,0), radius: 1pt, fill: black, name: "centro")
    circle((1.2, 0, 0), radius: 1pt, fill: black, name: "ponto-p")
    circle("centro", radius: (50pt, 15pt), fill: gray.transparentize(80%), stroke: gray+1pt)

    content("centro", [$O$], anchor: "north-east", padding: 0.1)

    line((0,0,0), (2.5,0,0), stroke: (dash: "dashed", paint: gray))


    line((0,0,0), (1.2, 0,0), mark: (end: "stealth"), stroke: uft-blue, fill: uft-blue, name: "vec-r")
    content("vec-r", [$arrow(r)$], anchor: "north", padding: 0.07)
    line((1.2, 0, 0), (1.5, 0, -1.5), mark: (end: "stealth"), stroke: uft-blue, fill: uft-blue, name: "vec-f")
    content("vec-f.end", [$arrow(F)$], anchor: "south", padding: 0.1)

    line((0,0,0), (0, 1.5, 0), mark: (end: "stealth"), stroke: uft-blue, fill: uft-blue, name: "vec-tau")
    content("vec-tau.end", [$arrow(tau)$], anchor: "south", padding: 0.1)


  }),
  caption: [Torque de uma força]
)<fig-torque>

Na maioria das aplicações, a rotação ocorre em torno de um eixo fixo. Nesses casos, podemos utilizar o conceito de *braço da alavanca* (ou *braço do momento*), que é _a distância $d$ perpendicular entre o eixo de rotação e a linha de ação da força_ $arrow(F)$. Assim, o cálculo do torque pode ser calculado de forma mais simples como

$
  tau = plus.minus F d,
$<eq-torque-braco>
#par(first-line-indent: 0cm)[em que o sinal é determinado pela _regra da mão direita_.]

#subpar.grid(


  figure(
    cetz.canvas({
      import cetz.draw: *
      rotate(z: 25deg)
      circle((0,0), radius: (50pt, 20pt), fill: gray.transparentize(80%), stroke: gray+1pt)

      circle((0,0), radius: 1pt, fill: black)
      content((0,0), [$O$], anchor: "north-east", padding: 0.05)
    }),
    caption: [$tau = + F d$]
  ), <fig-a>,
  figure(
    cetz.canvas({
      import cetz.draw: *
      rotate(z: 25deg)
      circle((0,0), radius: (50pt, 20pt), fill: rgb("#eff0f3"), stroke: gray+1pt)

      circle((0,0), radius: 1pt, fill: black)
      content((0,0), [$O$], anchor: "north-east", padding: 0.05)

      line((0,0), (1.5, 0), mark: (start: "|", end: "|"), stroke: uft-blue, fill: uft-blue, name: "braco-d")
      content("braco-d", box(fill: rgb("#eff0f3"), $d$))

      line((1.5, 0), (1.5, 1.5), mark: (end: ">"), stroke: uft-blue, fill: uft-blue, name: "vec-f")
      content("vec-f", [$arrow(F)$], anchor: "west", padding: 0.1)
    }),
    caption: [$tau = - F d$]
  ), <fig-b>,
  columns: (1fr, 1fr),
  caption: [Torque com braço de alavanca]
)


Conforme #cite(<example-book>, form: "prose"), ...

#figure(
  image("assets/images/uftlabfis-logo.png", width: 50%),
  caption: [Legenda da figura]
)<fig-modelo>



#lorem(30) Ver @fig-modelo.

#lorem(20)

$
  E = rho_f g V  
$<eq-empuxo>

#section([= Objetivos])

+ Determinar ...
+ Compreender ...


#section([= Material Necessário])

- Paquímetro;
- Cronômetro;
- Trilho de ar.


#section([= Procedimentos])

#info-box([Atenção], [Conteúdo])

#section([== Primeira Parte])


+ Utilize a @eq-empuxo.
+ #lorem(10)
+ #lorem(10)

#figure(
  kind: table,
  caption: [Coleta de dados],
)[
  #table(
    columns: (1fr, 1fr, 1fr),
    table.header([Coluna1], [Coluna2], [Coluna3]),
    [1], [], [],
    [2], [], [],
    table.cell(colspan: 2)[*Média*]
  )
]<tab-dados>

#section([== Segunta Parte])

+ #lorem(15)
+ #lorem(10)
+ Repita o passo 4.1




#section([= Análise de Dados])

+ Preencha a @tab-dados.
+ #lorem(8)
+ #lorem(10)


#set heading(numbering: none)
#section([= Referências])

#bibliography("assets/references/references.bib", style: "assets/references/abnt.csl", title:"")
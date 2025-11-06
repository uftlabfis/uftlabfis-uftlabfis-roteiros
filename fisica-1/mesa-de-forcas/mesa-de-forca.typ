#import "styles.typ": *

#show: setup.with(
  title: [Adição de Vetores - Mesa de Forças],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

#section([= Introdução])

A força é uma grandeza vetorial, ou seja, além de possuir intensidade, também apresenta direção e sentido. Quando duas forças $F_1$ e $F_2$ atuam sobre um mesmo ponto, o efeito combinado não é dado por uma simples soma algébrica, mas pela soma vetorial. A resultante $F_r$ dessas duas forças pode ser obtida pela *regra do paralelogramo*, na qual os vetores $F_1$ e $F_2$ formam os lados adjacentes de um paralelogramo e a diagonal representa a resultante. #cite(<Halliday2>).

#let F1 = (1.5, 1.5)
#let F2 = (1, -F1.at(0))
#let Fr = (F1.at(0)+F2.at(0), F1.at(1)+F2.at(1))
#let F3 = (-Fr.at(0), -Fr.at(1))
#let alfa1 = calc.atan2(F1.at(0), F1.at(1))
#let alfa2 = -calc.atan2(F2.at(0), F2.at(1))
#let alfa = alfa1+alfa2


#figure(
  caption: [Sistema de Forças em equilíbrio estático],
  cetz.canvas({
    import cetz.draw: *
    // Força F1
    line((0, 0), (F1),
      mark: (end: "stealth", fill: black), name: "F1"
    )
    content("F1.end", [$F_1$], anchor: "south-east")
    // Força F2
    line((0,0), (F2),
      mark: (end: "stealth", fill: black), name: "F2"
    )
    content("F2.end", [$F_2$], anchor: "north-east")
    // Força F3
    line((0,0), (F3),
      mark: (end: "stealth", fill: black), name: "F3"  
    )
    content("F3.end", [$F_3$], anchor: "east")
    // Força Fr
    line((0,0), (Fr),
      mark: (end: "stealth", fill: black), name: "Fr"  
    )
    content("Fr.end", [$F_r$], anchor: "west")
    // Paralelogramo
    line(
      (F1), (Fr), (F2), stroke: (dash: "dashed", thickness: 0.5pt)
    )
    content((5mm, -3mm), [$theta$], anchor: "west")
    rotate(z: -alfa2)
    arc((5mm,0), start: 0deg, stop: alfa, radius: 5mm, mode: "PIE", fill: gray.transparentize(80%), stroke: (thickness: 0.6pt))
    
  })
)

Matematicamente, para duas forças que formam um ângulo $theta$, o módulo da resultante é dado por:

$
  F_r = sqrt(F_1^2 + F_2^2 + 2 F_1 F_2 cos theta)
$<eq-paralelogramo>

Para que o sistema esteja em equilíbrio, é necessário aplicar uma terceira força $F_3$, de mesmo módulo que a resultante $F_r$, porém de sentido oposto: $F_3 = -F_r$.

Esse princípio tem diversas aplicações práticas, como no cálculo de forças em cabos de pontes e estruturas, na análise de forças que atuam sobre um corpo suspenso por fios em diferentes direções, e no equilíbrio de objetos submetidos a tensões em máquinas simples. 


#subpar.grid(
  figure(image("/fisica-1/mesa-de-forcas/assets/images/kit-mesa-de-forca_1.png"), caption: figure.caption(position: bottom)[
    Aparato experimental.
  ]), <fig-mesa-a>,
  figure(image("/fisica-1/mesa-de-forcas/assets/images/mesa-de-forca-120_1.png"), caption: figure.caption(position: bottom)[
    Posição de equilíbrio.
  ]), <fig-mesa-b>,
  columns: (5fr, 4fr),
  caption: [Mesa de Forças.],
  label: <fig-mesa>,
)


O experimento da mesa de forças, ilustrada na @fig-mesa permite compreender de forma visual e prática como a soma vetorial se manifesta no mundo real e como o conceito de equilíbrio está diretamente ligado ao princípio da adição de vetores.


#section([= Objetivos])

+ Compreender que a força é uma grandeza vetorial;
+ Aplicar a _regra do paralelogramo_ para determinar a resultante de um par de forças;
+ Determinar experimentalmente o valor de uma força que equilibra duas outras forças;
+ Determinar graficamente a resultante de duas forças pela regra do paralelogramo.



#section([= Material Necessário])

- Mesa de forças composta por um transferidor de ângulos e base de fixação;
- 03 polias móveis;
- Conjunto de massas e suportes;
- Fios.


#section([= Procedimentos])

#info-box([Atenção], [
  Cada suporte tem massa de 5 gramas.
])

//#section([== Primeira Parte])

+ Monte a mesa de forças conforme mostrado na @fig-mesa-a. Duas para as forças que serão somadas ($F_1$ e $F_2$) e a terceira polia para a força $F_3$ que equilibra as demais.
+ Organize os conjuntos de massa + suporte em três grupos, cada um com massa total igual a *40 g*: 

  #set math.equation(numbering: none)
  $
    m_1 = 40 " g;" m_2 = 40 " g; e " m_3 = 40 " g"
  $
+ Passe os fios sobre as polias e prenda as massas nas extremidades.
+ Fixe uma das polias na marcação de 0º no transferidor da mesa de forças. A massa acoplada, que corresponderá à massa $m_3$, e a posição dessa polia não serão alteradas durante a execução do experimento.
+ Por tentativa e erro, ajuste posição das outras duas polias (para $m_1$ e $m_2$) de modo que o sistema fique em equilíbrio (O sistema estará em equilíbrio quando o disco transparente ficar centralizado em relação à mesa de força, conforme @fig-mesa-b.).
+ Anote o ângulo $theta$ formado pelos fios ligados às massas $m_1$ e $m_2$ no campo correspondente da @tab-dados.
+ Utilizando o valor da aceleração da gravidade $g = 9,8 "m/s"^2$, calcule o valor das forças $F_1$, $F_2$ e $F_3$ correspondentes aos pesos das massas $m_1$, $m_2$ e $m_3$, respectivamente. Anote os resultados na @tab-dados.
+ Aplique a @eq-paralelogramo e determine a Força resultante $F_r$ esperada que equilibraria as forças $F_1$ e $F_2$ com um ângulo $theta$.
+ Represente as forças $F_1$, $F_2$ e $F_3$ no diagrama apropriado do #text(fill: primary-color)[Anexo - Análise Gráfica]. Use a regra do paralelogramo para determinar graficamente a força $F_r$.
+ Repita os passos acima para os ternos de massas $m_1$, $m_2$ e $m_3$ na @tab-dados.

#figure(
  kind: table,
  caption: [Coleta e análise de dados],
)[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    table.header([$m_1$ (g)], [$m_2$ (g)], [$m_3$ (g)], [$F_1$ (N)], [$F_2$ (N)], [$F_3$ (N)], [$theta (°)$], [$F_r$ (N)], [$E (%)$]),
    [40], [40], [40], [], [], [], [], [], [],
    [35], [35], [40], [], [], [], [], [], [],
    [25], [35], [40], [], [], [], [], [], [],
  )
]<tab-dados>


#section([= Análise de Dados])

#info-box([Atenção], [
  Nesta seção, consideraremos os valores calculados da força $F_r$ como _valores esperados_ para a força resultante da soma $F_1 + F_2$. Em contrapartida, os valores medidos $F_3$ serão nossos _valores experimentais_.

  Vamos avaliar a qualidade do experimento por meio do cálculo do erro percentual:
  $
    "E (%)" = frac(|F_3 - F_r|, F_r) dot 100 %
  $<eq-erro>
])

#set enum(start: 1)
+ Usando a @eq-erro, calcule o erro percentual $"E (%)"$ na determinação da força resultante de cada distribuição de massas. Anote o resultado na coluna correspondente da @tab-dados.

+ A análise gráfica permite concluir que a relação $F_3 = -F_r$ é verdadeira? Explique as causas de possíveis erros.

#set heading(numbering: none)
#section([= Referências])

#bibliography("assets/references/references.bib", style: "assets/references/abnt.csl", title:"")

#pagebreak()
#set page(paper: "a4", flipped: true)

#place(
  top + center,
  float: true,
  scope: "parent",
  clearance: 1em,
)[
  #par(justify: false)[
    #text(fill: primary-color)[*ANEXO - ANÁLISE GRÁFICA*]
  ]
]

#let transferifor = {
  cetz.canvas({
    import cetz.draw: *
    let raio = 6.4cm
    circle((0,0), radius: raio)
    for i in range(360) {
      let a=0.95
      if calc.rem(i, 10)==0 {
        a = 0.87
      } else if calc.rem(i, 5)==0 {
        a = 0.9
      } else {
        a = 0.94
      }

      line(
        (a*raio*calc.cos(i * calc.pi/180), a*raio*calc.sin(i * calc.pi/180)),
        (raio*calc.cos(i * calc.pi/180), raio*calc.sin(i * calc.pi/180)),
        stroke: (thickness: 0.5pt)
      )
    }

    for i in range(12) {
      let ang = 30deg * i
      let r = 4cm
      line((0,0),
        (r * calc.cos(ang), r * calc.sin(ang)),
        stroke: (thickness: 0.5pt, dash: "dashed"), 
      )
    }

    for i in range(10) {
      let ang = 10 * i
      let a = 0.82
      content(
        (a*raio*calc.cos(ang * calc.pi/180), a*raio*calc.sin(ang * calc.pi/180)), [#ang]
      )
      content(
        (a*raio*calc.cos(ang * calc.pi/180), a*raio*calc.sin(-ang * calc.pi/180)), [#ang]
      )
      content(
        (a*raio*calc.cos((180-ang) * calc.pi/180), a*raio*calc.sin(ang * calc.pi/180)), [#ang]
      )
      content(
        (a*raio*calc.cos((180-ang) * calc.pi/180), a*raio*calc.sin(-ang * calc.pi/180)), [#ang]
      )
    }

    for r in (2.5cm, 3.5cm, 4cm) {
      arc(
        (r*calc.cos(95deg),r*calc.sin(95deg)), start: 95deg, stop: 445deg, radius: r, stroke: (thickness: 0.5pt)
      )
      let label = $#str(10 * r / 1cm)$
      content(
        (0, r), [#box(fill: white)[$#label$]]
      )
    }
  })
}

#let header(f1, f2, f3) = {
  set table(
    stroke: (x, y) => if y == 0 {
      (top: 0.7pt + primary-color)
      (bottom: 0.7pt + primary-color)
      if x > 0 {
        (left: 0.7pt + primary-color)
      }
    } else {
      (bottom: 0.7pt + primary-color)
      if x > 0 {
        (left: 0.7pt + primary-color)
      }
    },
    fill: (x, y) => if y == 0 {
      primary-color.transparentize(60%)
    } else {
      if calc.even(y) {
        primary-color.transparentize(80%)
      }
    }
  )
  show table: set text(size: 10pt)
  show table.cell.where(y: 0): strong
  table(
    columns: (1fr, 1fr, 1fr),
    table.header([$m_1$ (g)], [$m_2$ (g)], [$m_3$ (g)]),
    [#f1], [#f2], [#f3]
  )
}

#set align(center)
#set table(
  fill: white,
  stroke: (x, y) => if x==0 {
    (right: 0.6pt+primary-color)
  }
)
#table(
  columns: (13.75cm, 13.75cm),
  align: horizon,
  inset: 0.2cm,
  [
    #header(40, 40, 40)
  ], [
    #header(35, 35, 40)
  ],
  [
    #transferifor
  ],
  [
    #transferifor
  ]
)

#pagebreak()
#table(
  columns: (13.75cm, 13.75cm),
  align: horizon,
  inset: 0.2cm,
  [
    #header(25, 35, 40)
  ], [],
  [
    #transferifor
  ],
  []
)
#import "styles.typ": *

#show: setup.with(
  title: [Lei de Ohm],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

#section([= Introdução])

Para que um dispositivo elétrico funcione, é necessária a presença de uma corrente elétrica ($i$) em seu circuito, gerada pela aplicação de uma diferença de potencial ($V$). Observa-se experimentalmente que condutores de mesmas dimensões, mas de materiais distintos, submetidos à mesma diferença de potencial, conduzem correntes diferentes @Halliday3.

Um componente projetado especificamente para restringir ou regular o fluxo de corrente elétrica em um circuito denomina-se *resistor*. Em representações esquemáticas, tal elemento é indicado convencionalmente pelo símbolo:

#figure(
  caption: [Símbolo do resistor],
  cetz.canvas({
    import cetz.draw: *

    let ang = calc.pi/3
    line((-.5,0), (0, 0))
    for i in range(3) {
      line((i,0), (i+0.25, .5), (i+.75, -.5), (i+1, 0))
    }
    line((3, 0), (3.5, 0))
  })
)<fig:resistor>

Embora a resistência de um condutor possa variar com a tensão aplicada, alguns resistores apresentam resistência aproximadamente constante. Esses dispositivos obedecem à *Lei de Ohm*, que estabelece a proporcionalidade direta entre a diferença de potencial e a corrente elétrica:

$
  V = R i
$<eq:lei-de-ohm>

No Sistema Internacional de Unidades (SI), a diferença de potencial é medida em volts (V), a corrente elétrica em ampères (A) e a resistência elétrica em volts por ampère, unidade denominada ohm ($Omega$).

A representação gráfica da diferença de potencial em função da corrente elétrica para um resistor ôhmico resulta em uma reta, conforme ilustrado na @fig:grafico-lei-de-ohm:


#figure(
  caption: [Representação gráfica da Lei de Ohm],
  cetz.canvas({
    import cetz.draw: *

    let opts = (
      x-tick-step: none, y-tick-step: none,
      x-min: 0, y-min: 0, 
      size: (3, 3), 
      axis-style: "school-book"
    )

    plot.plot(..opts, x-label: [$i$], y-label: [$V$], name: "plot", {
      plot.add(domain: (1, 5), i =>  i)
      plot.add-anchor("i1", (1.5, 0))
      plot.add-anchor("v1", (0, 1.5))
      plot.add-anchor("vi1", (1.5, 1.5))

      plot.add-anchor("i2", (4.5, 0))
      plot.add-anchor("v2", (0, 4.5))
      plot.add-anchor("vi2", (4.5, 4.5))

      plot.add-anchor("arc", (2.37, 1.5))
      plot.add-anchor("pt", (4.5, 1.5))
    })
    line("plot.i1", "plot.vi1", "plot.v1", stroke: (dash: "dashed"), name: "line1")
    content("line1.start", [$i_1$], anchor: "north", padding: 0.1)
    content("line1.end", [$V_1$], anchor: "east", padding: 0.1)

    line("plot.i2", "plot.vi2", "plot.v2", stroke: (dash: "dashed"), name: "line2")
    content("line2.start", [$i_2$], anchor: "north", padding: 0.1)
    content("line2.end", [$V_2$], anchor: "east", padding: 0.1)

    

    arc("plot.arc", start: 0deg, stop: 45deg, radius: 0.5,  mode: "PIE", fill: color.mix(white, (primary-color, 50%)), stroke: none)
    content("plot.arc", [$alpha$], anchor: "south-west", padding: "0.1")

    line("plot.vi1", "plot.pt", stroke: (dash: "dashed"))

  })

  
)<fig:grafico-lei-de-ohm>


A resistência elétrica ($R$) do condutor corresponde ao coeficiente angular da reta obtida:

$
  R = tan alpha = (Delta V) / (Delta i)\
  R = (V_2 - V_1) / (i_2 - i_1)
$<eq:r-exp>

#section([= Objetivos])

+ determinar a relação entre a diferença de potencial aplicada aos extremos de um resistor e a intensidade de corrente que circula pelos mesmos;
+ identificar um resistor ôhmico;
+ construir uma curva característica de um resistor ôhmico.


#section([= Material Necessário])

- um painel para associação de resistores (1);
- uma fonte de alimentação (2);
- um resistor ôhmico (3);
- conexões de fios com pinos banana (4);
- um multímetro (5).

#figure(
  caption: [Painel eletroeletrônico],
  image("assets/images/lei-de-ohm.png")
)<fig:montagem-experimento>
#align(center)[#text(size: 10pt)[Fonte: Labfis (2025)]]

#info-box([Multímetro], [

])


#section([= Procedimentos])

#section([== Determinação da resistência experimental por meio da Lei de Ohm])

+ Monte o circuito elétrico conforme @fig:montagem-experimento.

+ Ligue o multímetro e regule-o para a escala de *20 mA em corrente contínua*;

+ Ligue a fonte de alimentação e regule-a para *0 volt*;

+ Aumente a tensão da fonte de alimentação para *1 volt*. Anote na Tabela 1 o valor da intensidade da corrente elétrica mostrada no multímetro. Observe que a escala do multímetro é dada em miliampère (mA), enquanto na @tab-dados é solicitado anotar tambem em Ampères (A). Lembre-se que $1 "mA" = 10^(-3) "A"$. 


  #figure(
    kind: table,
    caption: [Coleta de dados],
  )[

    #table(
      columns: (0.5fr, 1fr, 1fr),
      table.header([$V$ (V)], [$i$ (mA)],[$i$ (A)]),
      [0], [], [],
      [1], [], [],
      [2], [], [],
      [3], [], [],
      [4], [], [],
      [5], [], [],
      [6], [], [],
      [7], [], [],
      [8], [], [],
      [9], [], [],
      [10], [], [],
      //table.cell(colspan: 2)[*Média*]
    )
  ]<tab-dados>

+ Repita o passo anterior para os demais valores de tensão elétrica mostrados na @tab-dados.

+ De posse dos dados, construa o gráfico da tensão elétrica $V$ (V) (no eixo $y$) em função da corrente elétrica $i$ (A) (no eixo $x$).

+ Utilizando o método sugerido pelo professor, determine a equação da reta que melhor se ajuste aos pontos do gráfico construído no item anterior. Comparando a equação geral da reta $y = k x + b$ com a @eq:lei-de-ohm, note que o coeficiente linear deve ser nulo ($b = 0$). Por outro lado, o coeficiente angular $k$ da reta pode ser utilizado para estimar experimentalmente a *resistência* ($R_("exp")$) do resistor do circuito. 

+ Anote o valor da Resistência Experimental ($R_("exp")$) na @tab:resultados. 

#section([== Determinação da resistência esperada usando o multímetro])

+ Desligue a fonte de alimentação e desconecte o resistor do circuito elétrico.

+ Desconecte o multímetro do circuito elétrico.

+ Com o multímetro ajustado para escala de Resistência, conecte o resistor e anote o valor da Resistência Esperada ($R_("esp")$) no campo correspondente da @tab:resultados. 


#section([= Análise de Resultados])

+ Calcule o erro percentual:
$
  Delta "Erro" (%) = abs( (R_("exp") - R_("esp")) / R_("esp")) times 100 %
$<eq-desvio-perc>

+ O resistor utilizado é um Resistor Ôhmico, ou seja, respeita a Lei de Ohm? Discuta os resultados.

  #figure(
    kind: table,
    caption: [Análise de Resultados]
  )[
    #table(
      columns: (1fr, 1fr, 0.8fr),
      table.header([$R_("esp") (Omega)$], [$R_("exp") (Omega)$], [$Delta "Erro" (%)$]),
      [$$]
    )
  ]<tab:resultados>

#set heading(numbering: none)
#section([= Referências])

#bibliography("assets/references/references.bib", style: "assets/references/abnt.csl", title:"")


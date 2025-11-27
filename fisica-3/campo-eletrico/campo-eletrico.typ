#import "styles.typ": *

#show: setup.with(
  title: [Campo Elétrico entre placas paralelas],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

#section([= Introdução])

No século XIX, Michael Faraday introduziu o conceito de _linhas de força_ para explicar o efeito produzido por uma carga eletrizada no espaço ao seu redor. Apesar de imaginárias, tais linhas, hoje denominadas *linhas de campo elétrico*, ajudam a compreender o comportamento dos campos elétricos @Halliday3.

#figure(
  
  caption: [Campo elétrico entre duas placas paralelas]
)[
  #cetz.canvas({
    import cetz.draw: *

    for i in (-1, 1) {
      rect((i * 2.25, -1.5), (i * 1.75, 1.5))
    }
  
    for i in range(1, 6) {
      content((-2, -1.5 + i * 0.5), [$+$])
      content((2, -1.5 + i * 0.5), [$-$])
      line((-1.75, -1.5 + i * 0.5), (0.25, -1.5 + i * .5), mark: (end: "stealth"), fill: black)
      line((0, -1.5 + i * 0.5), (1.75, -1.5 + i * 0.5))

    }

    content((-2.25, -1.5), [$+q$], anchor: "east", padding: 0.1)
    content((2.25, -1.5), [$-q$], anchor: "west", padding: 0.1)
    content((0, 1.5), [$arrow(E)$])

    line((-1.75, -1.8), (1.75, -1.8), mark: (symbol: "bar"), name: "line")
    set-style(content: (frame: "rect", stroke: none, fill: white, padding: .1))
    content("line.mid", [$d$], )

    
  })
]
<fig:campo-eletrico>

//A @fig:campo-eletrico ilustra que as linhas de campo são dotadas das propriedades:

//- em qualquer ponto do espaço, as linhas de campo têm a mesma direção e sentido do vetor campo elétrico no ponto;
//- a distribuição das linhas de campo no espaço é tal que a quantidade de linhas por unidade de área deve ser proporcional à intensidade do campo elétrico.

Como ilustrado na @fig:campo-eletrico, as linhas de campo sempre _começam_ nas cargas positivas e _terminam_ nas cargas negativas. Por outro lado, a cada ponto do espaço, a uma distância $d$ de um dos eletrodos, também esta associado um potencial elétrico $V$, definido de modo que a diferença de potencial entre dois pontos é:

$
  V = - integral_0^d arrow(E) dot d arrow(s)
$<eq:campo-eletrico>

Considerando o caso especial em que o campo elétrico é constante, resolvendo a integral da @eq:campo-eletrico, tem-se:

$
  V = - integral_0^d arrow(E) dot d arrow(s) &arrow.double V = - integral_0^d (- E d s)\
  &arrow.double V = E integral_0^d d s \
  &arrow.double V = E d 
$<eq:campo-eletrico-constante>

A @eq:campo-eletrico-constante mostra que no caso do campo elétrico gerado por eletrodos paralelos, a diferença de potencial $V$ em um ponto  é _proporcional_ à distância $d$ entre as placas.

#figure(
  caption: [Gráfico de $V times d$],
  cetz.canvas({
    import cetz.draw: *

    let opts = (
      x-tick-step: none, y-tick-step: none,
      x-min: 0, y-min: 0,
      x-label: [$d$ (cm)], y-label: [$V$ (V)],
      size: (4, 2), axis-style: "school-book", 
    )

    plot.plot(..opts, name: "plot", {
      plot.add(domain: (0.5, 4.5), x => 0.5*x)
      plot.add-anchor("d-1", (1, 0))
      plot.add-anchor("V-1", (0, .5))
      plot.add-anchor("dV-1", (1, .5))

      plot.add-anchor("d-2", (4, 0))
      plot.add-anchor("V-2", (0, 2))
      plot.add-anchor("dV-2", (4, 2))
    })

    line("plot.d-1", "plot.dV-1", "plot.V-1", stroke: (dash: "dashed"))
    content("plot.d-1", [$d_1$], anchor: "north", padding: 0.2)
    content("plot.V-1", [$V_1$], anchor: "east", padding: 0.2)

    line("plot.d-2", "plot.dV-2", "plot.V-2", stroke: (dash: "dashed"))
    content("plot.d-2", [$d_2$], anchor: "north", padding: 0.2)
    content("plot.V-2", [$V_2$], anchor: "east", padding: 0.2)
  })
)<fig:grafico-lei-de-ohm>

A relação $V times d$ é dada por uma reta passando pela origem e cujo coeficiente angular pode ser utilizado para estimar experimentalmente o campo elétrico entre as placas, conforme @fig:grafico-lei-de-ohm:

$
  E_("exp") = (V_2 - V_1)/(d_2 - d_1)
$<eq:campo-eletrico-exp>


#section([= Objetivos])

+ determinar o campo elétrico entre duas placas paralelas.


#section([= Material Necessário])

+ uma cuba com escala projetável comporta por dois eletrodos retos e conexões de fios;
+ uma ponteira para tomada de dados;
+ uma fonte de alimentação VCC com tensão de saída entre 0 V e 30 V;
+ um multímetro ajustado para voltímetro escala de 20 V  CC;
+ mistura de água e sal.

#figure(
  image("assets/images/aparato-campo-eletrico.png"),
  caption: [Aparato experimental]
)<fig:aparato-experimental>


#section([= Procedimentos])

+ Execute a montagem conforme a Figura @fig:aparato-experimental.

+ Posicione os eletrodos retos em paralelo e separados por uma distância $ d = 20$ cm.

+ Adicione a mistura de água e sal na cuba acrílica o suficiente para definir os contornos dos eletrodos retos.

+ Ligue a fonte de alimentação e regule-a para $V = 10$ Volts.

+ Aplicando a @eq:campo-eletrico-constante, o _valor esperado_ do campo elétrico teórico $E_("esp")$ entre os eletrodos é:

$
  V = E d &arrow.double E_("esp") = V/d\
  &arrow.double E_("esp") = 10/20 = 0,5 "V/cm"
$

+ Posicione a ponteira entre os eletrodos retos. Para cada distância $d$ da @tab:dados meça a diferença de potencial $V$.

#figure(
  kind: table,
  caption: [Coleta de dados],
)[
  #table(
    columns: (2.5cm, 2.5cm),
    table.header([$d$ (cm)], [$V$ (V)]),
    [2], [],
    [4], [],
    [6], [],
    [8], [],
    [10], [],
    [12], [],
    [14], [],
    [16], [],
    [18], [],
    [20], [],
  )
]<tab:dados>


+ Com os dados da Tabela @tab:dados, construa o gráfico diferença de potencial $V$ em função da distância $d$ (Use a área da @fig:grafico-exp). 

+ Calcule o coeficiente de inclinação da reta construída no item anterior (Use a @eq:campo-eletrico-exp). Este será o _valor experimental_ do campo elétrico  ($E_("exp")$).

  $
    Delta "Erro" (%) = abs( (E_("exp") - E_("esp")) / E_("esp")) times 100 %
  $<eq:desvio-perc>

+  Utilize a @eq:desvio-perc para calcular o erro percentual do experimento. Preencha a @tab:resultados.

  #figure(
    kind: table,
    caption: [Análise de Resultados],
  )[
    #table(
      columns: (1fr, 1fr, 1fr),
      table.header([$E_("esp")$ (V/cm)], [$E_("exp")$ (V/cm)], [$Delta "Erro" (%)$],),
      [$$], [], []
      
      //table.cell(colspan: 2)[*Média*]
    )
  ]<tab:resultados>




#set heading(numbering: none)
#section([= Referências])

#bibliography("assets/references/references.bib", style: "assets/references/abnt.csl", title:"")

#pagebreak()

#set page(flipped: true, columns: 1)


#figure(
  caption: [Esboço do gráfico $V times d$],
  cetz.canvas({
    import cetz.draw: *

    grid((0,0), (22, 12), stroke: (0.7pt+gray))
    line((0, 13.5), (0,0), (23.5, 0), mark: (start: "stealth", end: "stealth", fill: black), name: "ax")
    content("ax.start", [$V$ (V)], anchor: "east",padding: 0.2)
    content("ax.end", [$d$ (cm)], anchor: "north", padding: 0.2)

    for i in range(1, 45) {
      if calc.rem(i, 2)==0 {
        line((i/2, -0.2), (i/2, (0.2)))
        let l = i/2
        content((i/2, -0.2), [$#l$], anchor: "north", padding: 0.2)
      } else {
        line((i/2, -0.15), (i/2, (0.15)))
      }
    }


    for j in range(1, 25) {
      if calc.rem(j, 2)==0 {
        line((-0.2, j/2), (0.2, j/2))
        let m = j/2
        content((-0.2, j/2), [$#m$], anchor: "east", padding: 0.2)
      } else {
        line((-0.15, j/2), (0.15, j/2))
      }
    }
  })
)<fig:grafico-exp>






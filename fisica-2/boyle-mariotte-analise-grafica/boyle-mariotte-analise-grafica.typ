#import "styles.typ": *

#show: setup.with(
  title: [Lei de Boyle-Mariotte - Análise gráfica],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

#section([= Introdução])

O *gás* é um fluido formado por átomos ou moléculas distribuídos de tal forma que ocupem todo o volume disponível no recipiente no qual estejam inseridos @Halliday2.

Apesar da imensa quantidades de gases existentes no mundo real, para a maioria das aplicações industriais e científicas, é possível fazer o estudo dos gases
por meio de um modelo teórico denominado _Gás Ideal_ ou _Gás Perfeito_. Para aplicação desse modelo, o gás em estudo deve satisfazer a certas características (o tamanho das partículas é desprezível comparado com a distância entre elas; ausência de forças atrativas ou repulsivas entre suas partículas, que colidem elasticamente entre si, ou com as paredes do recipiente). Nessas condições, o comportamento do gás é determinado apenas pelas grandezas: pressão, temperatura e volume e obedecem à seguinte relação (*Lei dos gases ideais*):

$
  p V = n R T
$<eq:lei-dos-gases>

#par(first-line-indent: (amount: 0cm))[
  em que $p$ é a pressão absoluta, $V$ é o volume ocupado pelo gás, $n$ é o número de mols e $T$ é a temperatura em kelvin. O fator $R$ é denominado  *constante universal dos gases ideais* e vale 
]

#nonum($ R = 8,31 "J/mol" dot "K" $)

Conforme #cite(<example-book>, form: "prose"), ...



== Lei de Boyle-Mariotte (Transformação isotérmica)

Quando uma certa quantidade de um gás ideal está confinado em um recipiente fechado e submetido a uma temperatura constante, percebe-se da relação
dos gases ideais acima que a pressão do gás varia com o inverso do volume ocupado. Tal fato foi primeiramente observado por Robert Boyle e Edme Mariotte no
século XVII. A lei enunciada pelos cientistas recebeu o nome de Lei de Boyle- Mariotte. Lembrando que é caracterizada por ocorrer à temperatura constante, o
processo descrito pela *Lei de Boyle-Mariotte* é chamado de *transformação isotérmica*:

#nonum($ p V = k " (constante)" $)

Observe que a Lei de Boyle-Mariotte é um caso especial da Lei dos Gases Ideais (@eq:lei-dos-gases) quando o número de mols $n$ e a temperatura $T$ são mantidas constantes. 

$
  p = (n R T) times 1/V
$<eq:boyle-mariotte>

Nesse caso, a constante $k = n R T$ na @eq:boyle-mariotte caracteriza a Lei de Boyle-Mariotte. Matematicamente,  a relação entre as variáveis pressão $p$ e volume $V$ é dada por uma hipérbole, denominada _isoterma_, conforme mostrado na @fig:boyle-mariotte-a.

#let opts = (
  x-tick-step: none, y-tick-step: none,
  x-min: 0, y-min: 0, 
  size: (3, 3), 
  axis-style: "school-book"
)


#let pressao(V) = 6/V

#let V = (1, 1.4, 2.3, 3.4, 4.5, 6)



#let data-a = V.map(v => (v, pressao(v) - 0.25*calc.sin(v * calc.pi/3)))
#let data-b = V.map(v => (1/v, pressao(v) - 0.25*calc.sin(v * calc.pi/3)))



#subpar.grid(
  figure(
    caption: [$p$ vs. $V$],
    cetz.canvas({
      import cetz.draw: *

      plot.plot(..opts, x-label: [$V$], y-label: [$p$], {
        plot.add(domain: (0.9, 6.5), v => 6/v, style: (stroke: 1.5pt+primary-color))
        plot.add(data-a, style: (stroke: none), mark: "o", mark-size: 0.14, mark-style: (fill: primary-color.mix(white), stroke: primary-color))
      })
    })
  ), <fig:boyle-mariotte-a>,
  figure(
    caption: [$p$ vs. $1/V$],
    cetz.canvas({
      import cetz.draw: *

      plot.plot(..opts, x-label: [$1/V$], y-label: [$p$], {
        plot.add(domain: (1/6.5, 1/0.9), v => 6*v, style: (stroke: 1.5pt+primary-color))
        plot.add(data-b, style: (stroke: none), mark: "o", mark-size: 0.14, mark-style: (fill: primary-color.mix(white), stroke: primary-color))
      })
    })
  ), <fig:boyle-mariotte-b>,
  columns: (1fr, 1fr),
  caption: [Lei de Boyle-Mariotte],
  label: <fig:boyle-mariotte>
)
#align(center)[#text(size: 10pt)[Fonte: Labfis (2025)]]



Uma forma de simplificar o estudo das transformações isotérmicas é construir o gráfico da pressão em função do inverso do volume, ou seja, $p times 1/V$, como ilustrado na @fig:boyle-mariotte-b . Esse gráfico corresponde a uma reta que passa pela origem e tem coeficiente angular $k$.


$
  E = rho_f g V  
$<eq-empuxo>

#section([= Objetivos])

+ Compreender a Lei de Boyle-Mariotte;
+ Determinar a constante universal dos gases ideais $R$.


#section([= Material Necessário])

#figure(
  image("assets/images/kit_boyle_mariotte.png"),
  caption: [Equipamento para Boyle-Mariotte]
)<fig:equipamento-boyle-mariotte>

- Equipamento de Boyle-Mariotte;
- Termômetro.


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
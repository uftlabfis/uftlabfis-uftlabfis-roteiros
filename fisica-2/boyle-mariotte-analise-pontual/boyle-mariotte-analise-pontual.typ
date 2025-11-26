#import "styles.typ": *

#show: setup.with(
  title: [Lei de Boyle-Mariotte - Análise pontual],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

#section([= Introdução])

//O *gás* é um fluido formado por átomos ou moléculas distribuídos de tal forma que ocupem todo o volume disponível no recipiente no qual estejam inseridos @Halliday2.

//Apesar da imensa quantidades de gases existentes no mundo real, para a maioria das aplicações industriais e científicas, é possível fazer o estudo dos gases por meio de um modelo teórico denominado _Gás Ideal_ ou _Gás Perfeito_. Para aplicação desse modelo, o gás em estudo deve satisfazer a certas características (o tamanho das partículas é desprezível comparado com a distância entre elas; ausência de forças atrativas ou repulsivas entre suas partículas, que colidem elasticamente entre si, ou com as paredes do recipiente). Nessas condições, o comportamento do gás é determinado apenas pelas grandezas: pressão, temperatura e volume e obedecem à seguinte relação (*Lei dos gases ideais*):

 //Embora existam muitos gases reais, grande parte das aplicações científicas e industriais pode ser descrita pelo modelo de *Gás Ideal*, que assume partículas pontuais, sem forças de interação e com colisões perfeitamente elásticas. 

Conforme #cite(<Halliday2>, form: "prose"), um gás é um fluido cujas moléculas se distribuem de modo a ocupar o volume disponível. O comportamento do gás depende apenas de pressão, volume e temperatura, relacionados pela *Lei dos Gases Ideais*:

$
  P V = n R T
$<eq:lei-dos-gases>

#par(first-line-indent: (amount: 0cm))[
  em que $p$ é a pressão absoluta, $V$ é o volume ocupado pelo gás, $n$ é o número de mols e $T$ é a temperatura em kelvin. O fator $R$ é denominado  *constante universal dos gases ideais* e vale $R = 8,31 "J/mol" dot "K"$.
]

//Conforme #cite(<example-book>, form: "prose"), ...

== Lei de Boyle-Mariotte (Transformação isotérmica)

Quando uma quantidade fixa de gás ideal é mantida a *temperatura constante*, sua pressão varia inversamente com o volume. Essa relação, descoberta por Boyle e Mariotte no século XVII, é conhecida como *Lei de Boyle-Mariotte*, caracterizando uma *transformação isotérmica* @Halliday2.

//Quando uma certa quantidade de um gás ideal está confinado em um recipiente fechado e submetido a uma temperatura constante, percebe-se da relação dos gases ideais acima que a pressão do gás varia com o inverso do volume ocupado. Tal fato foi primeiramente observado por Robert Boyle e Edme Mariotte no século XVII. A lei enunciada pelos cientistas recebeu o nome de Lei de Boyle- Mariotte. Lembrando que é caracterizada por ocorrer à temperatura constante, o processo descrito pela *Lei de Boyle-Mariotte* é chamado de *transformação isotérmica*:

Note que a Lei de Boyle-Mariotte é um caso especial da Lei dos Gases Ideais (@eq:lei-dos-gases). A curva $P times V$ é uma hipérbole, denominada _isoterma_, conforme mostrado na @fig:boyle-mariotte.



#let opts = (
  x-tick-step: none, y-tick-step: none,
  x-min: 0, y-min: 0, 
  size: (3, 3), 
  axis-style: "school-book"
)


#figure(
  caption: [Lei de Boyle-Mariotte],
  cetz.canvas({
    import cetz.draw: *

    plot.plot(..opts, x-label: [$V$], y-label: [$P$], name: "plot", {
      plot.add(domain: (0.9, 6.5), v => 6/v, style: (stroke: 1.5pt+primary-color))
      plot.add-anchor("v1", (1.2, 0))
      plot.add-anchor("p1", (0, 5))
      plot.add-anchor("pv-1", (1.2, 5))
      plot.add-anchor("v2", (5, 0))
      plot.add-anchor("p2", (0, 1.2))
      plot.add-anchor("pv-2", (5, 1.2))

      plot.add-anchor("pt-1", (2, 3))
      plot.add-anchor("pt-2", (3, 4))
    })
    line("plot.v1", "plot.pv-1", "plot.p1", stroke: (dash: "dashed"), name: "pv-1")
    content("pv-1.start", [$V_1$], anchor: "north", padding: 0.2)
    content("pv-1.end", [$P_1$], anchor: "east", padding: 0.15)
    line("plot.v2", "plot.pv-2", "plot.p2", stroke: (dash: "dashed"), name: "pv-2")
    content("pv-2.start", [$V_2$], anchor: "north", padding: 0.2)
    content("pv-2.end", [$P_2$], anchor: "east", padding: 0.15)

    line("plot.pt-1", "plot.pt-2", mark: (start: "stealth", fill: black), name: "line")
    content("line.end", [isoterma], anchor: "south-west", padding: 0.05)

  })
) <fig:boyle-mariotte>
#align(center)[#text(size: 10pt)[Fonte: Labfis (2025)]]


A lei pode ser expressa pela fórmula

$ 
P_1 V_1 = P_2 V_2 = "constante" 
$<eq:boyle-mariotte>

#par(first-line-indent: (amount: 0em))[
  em que os índices 1 e 2 indicam, respectivamente, os estados inicial e final do gás durante o processo de transformação isotérmica.
]


Neste experimento, o ar (tratado como um gás ideal) será submetido a uma *transformação isotérmica* (temperatura constante). Medições de pressão e volume do gás nos estados inicial e final serão utilizados para comprovar a validade de Lei de Boyle-Mariotte.


#section([= Objetivos])

- Comprovar a da Lei de Boyle-Mariotte.


#section([= Material Necessário])

- Equipamento de Boyle-Mariotte.

#figure(
  image("assets/images/kit_boyle_mariotte.png"),
  caption: [Equipamento para Boyle-Mariotte]
)<fig:equipamento-boyle-mariotte>
#align(center)[#text(size: 10pt)[Fonte: Labfis (2025)]]



#info-box([Manômetro], [

  Conforme ilustrado na @fig:equipamento-boyle-mariotte, o equipamento é dotado de um *manômetro* (1), uma válvula de descarga (2), um êmbolo (3), uma câmara de gás (4). 

  A pressão indicada pelo manômetro ($p_("man")$) é a diferença entre a pressão absoluta ($P$) dentro da câmara e a pressão atmosférica local ($p_("atm") = 1,033 " kgf/cm"^2$), tal que:

  $ 
    P = p_("atm") + p_("man") 
  $<eq:pressao-absoluta>

  *Atenção*: Neste  experimento, utilizaremos apenas a graduação $"kgf/cm"^2$ (escala em preto).

  Como exemplo, consideremos que o manômetro do equipamento marque a pressão $p_("man") = 0,2 " kgf/cm"^2$. A pressão absoluta do gás será:

  #nonum($ P = p_("atm") + p_("man") = 1,033 + 0,2 = 1,233 " kgf/cm"^2. $)

])

  #info-box([Câmara de gás], [
    A Câmara de gás está graduada em centímetros e possui raio interno $R = 1,6$ cm. Assim, para encontrar o volume ocupado pelo gás, deve-se multiplicar a posição  $L$ do êmbolo pela área de seção transversal $S = pi R^2$:

    $ 
      V = L times pi R^2. 
    $<eq:volume-camara>
  ])


#section([= Procedimentos])


+ Abra a válvula de descarga. 

+ Gire a manopla do êmbolo até a posição $L = 20$ cm e feche a válvula de descarga.

+ Utilize a @eq:volume-camara para calcular o volume de gás na posição $L = 20$ cm e anote o valor correspondente na @tab:dados.

+ Ainda com o êmbolo na posição $L = 20$ cm, leia a pressão manométrica correspondente e calcule a pressão absoluta nesse ponto (ver @eq:pressao-absoluta). Anote o resultado na @tab:dados.

+ Repita os passos 4.3 a 4.5 para a posição $L = 15$ cm. 





#section([= Análise de Dados])


+ Compare o valor do produto $P V$ obtidos para os dois estados do gás. 

+ Calcule erro percentual para o produto $P V$, conforme @eq-desvio-perc.

  #set text(size: 11pt)
  $
    Delta "Erro" (%) = abs( (P_2 V_2 - P_1 V_1) / (P_1 V_1)) times 100 %
  $<eq-desvio-perc>


+ A Lei de Boyle-Mariotte foi confirmada com este experimento? Discuta os resultados. 



#set heading(numbering: none)
#section([= Referências])

#bibliography("assets/references/references.bib", style: "assets/references/abnt.csl", title:"")

#place(
  bottom,
  float: true,
  scope: "parent", 
  clearance: 1em
)[
  #figure(
    kind: table,
    caption: [Coleta de dados]
  )[
    #table(
      columns: (0.5fr, 0.5fr, 1fr, 1fr, 1fr, 1fr),
      table.header([#text(size:10pt)[Estado]], [#nonum($ L " " ("cm") $)], [#nonum($ p_("man") " " ("kgf/cm"^2)$)], [#nonum($ P " " ("kgf/cm"^2) $)], [#nonum($ V " " ("cm"^3) $)], [#nonum($ P V  " "("kgf" dot "cm") $)]),
      [1], [20], [], [], [], [], 
      [2], [15], [], [], [], [],
      table.cell(colspan: 5)[$Delta "Erro" (%)$]
    )
  ]<tab:dados>
]
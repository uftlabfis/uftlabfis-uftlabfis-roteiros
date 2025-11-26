#import "styles.typ": *

#show: setup.with(
  title: [Lei de Boyle-Mariotte - Análise gráfica],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

#section([= Introdução])

//O *gás* é um fluido formado por átomos ou moléculas distribuídos de tal forma que ocupem todo o volume disponível no recipiente no qual estejam inseridos @Halliday2.

//Apesar da imensa quantidades de gases existentes no mundo real, para a maioria das aplicações industriais e científicas, é possível fazer o estudo dos gases por meio de um modelo teórico denominado _Gás Ideal_ ou _Gás Perfeito_. Para aplicação desse modelo, o gás em estudo deve satisfazer a certas características (o tamanho das partículas é desprezível comparado com a distância entre elas; ausência de forças atrativas ou repulsivas entre suas partículas, que colidem elasticamente entre si, ou com as paredes do recipiente). Nessas condições, o comportamento do gás é determinado apenas pelas grandezas: pressão, temperatura e volume e obedecem à seguinte relação (*Lei dos gases ideais*):

Conforme #cite(<Halliday2>, form: "prose"), um gás é um fluido cujas moléculas se distribuem de modo a ocupar totalmente o volume disponível. Embora existam muitos gases reais, grande parte das aplicações científicas e industriais pode ser descrita pelo modelo de *Gás Ideal*, que assume partículas pontuais, sem forças de interação e com colisões perfeitamente elásticas. Nessas condições, o comportamento do gás depende apenas de pressão, volume e temperatura, relacionados pela *Lei dos Gases Ideais*:

$
  p V = n R T
$<eq:lei-dos-gases>

#par(first-line-indent: (amount: 0cm))[
  em que $p$ é a pressão absoluta, $V$ é o volume ocupado pelo gás, $n$ é o número de mols e $T$ é a temperatura em kelvin. O fator $R$ é denominado  *constante universal dos gases ideais* e vale $R = 8,31 "J/mol" dot "K"$.
]

//Conforme #cite(<example-book>, form: "prose"), ...

== Lei de Boyle-Mariotte (Transformação isotérmica)

Quando uma quantidade fixa de gás ideal é mantida a *temperatura constante*, sua pressão varia inversamente com o volume. Essa relação, descoberta por Boyle e Mariotte no século XVII, é conhecida como *Lei de Boyle-Mariotte*, caracterizando uma *transformação isotérmica* @Halliday2.

//Quando uma certa quantidade de um gás ideal está confinado em um recipiente fechado e submetido a uma temperatura constante, percebe-se da relação dos gases ideais acima que a pressão do gás varia com o inverso do volume ocupado. Tal fato foi primeiramente observado por Robert Boyle e Edme Mariotte no século XVII. A lei enunciada pelos cientistas recebeu o nome de Lei de Boyle- Mariotte. Lembrando que é caracterizada por ocorrer à temperatura constante, o processo descrito pela *Lei de Boyle-Mariotte* é chamado de *transformação isotérmica*:

#nonum($ p V = k " (constante)" $)

Observe que a Lei de Boyle-Mariotte é um caso especial da Lei dos Gases Ideais (@eq:lei-dos-gases) quando o número de mols $n$ e a temperatura $T$ são mantidas constantes. A curva $p times V$ é uma hipérbole, denominada _isoterma_, conforme mostrado na @fig:boyle-mariotte-a.



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
    caption: [$p times V$],
    cetz.canvas({
      import cetz.draw: *

      plot.plot(..opts, x-label: [$V$], y-label: [$p$], {
        plot.add(domain: (0.9, 6.5), v => 6/v, style: (stroke: 1.5pt+primary-color))
        plot.add(data-a, style: (stroke: none), mark: "o", mark-size: 0.14, mark-style: (fill: primary-color.mix(white), stroke: primary-color))
      })
    })
  ), <fig:boyle-mariotte-a>,
  figure(
    caption: [$p times 1/V$],
    cetz.canvas({
      import cetz.draw: *

      plot.plot(..opts, x-label: [$1\/V$], y-label: [$p$], {
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

Reorganizando a @eq:lei-dos-gases, obtém-se:

$
  p = (n R T) times 1/V
$<eq:boyle-mariotte>

#par(first-line-indent: (amount: 0em))[
  mostrando que $p$ é _linearmente proporcional_ a $1\/V$. 
]

Nesse caso, a constante $k = n R T$ na @eq:boyle-mariotte caracteriza a Lei de Boyle-Mariotte. Assim, o gráfico $p times 1\/V$, mostrado na @fig:boyle-mariotte-b é uma reta, com coeficiente linear nulo e coeficiente angular $k$. 


#section([= Objetivos])

+ Compreender a Lei de Boyle-Mariotte;
+ Determinar a constante universal dos gases ideais $R$.


#section([= Material Necessário])

#figure(
  image("assets/images/kit_boyle_mariotte.png"),
  caption: [Equipamento para Boyle-Mariotte]
)<fig:equipamento-boyle-mariotte>
#align(center)[#text(size: 10pt)[Fonte: Labfis (2025)]]

- Equipamento de Boyle-Mariotte;
- Termômetro.

Conforme ilustrado na @fig:equipamento-boyle-mariotte, o equipamento é dotado de um *manômetro* (1), uma válvula de descarga (2), um êmbolo (3), uma câmara de gás
(4). 

#info-box([Manômetro], [

  O manômetro é um instrumento que mede a pressão relativa dentro da câmara de gás e a pressão externa (pressão atmosfética). A pressão manométrica ($p_("man")$) é definida como a diferença entre a pressão absoluta ($p$) dentro da câmara e a pressão atmosférica local ($p_("atm")$), tal que:

  #nonum($ p = p_("atm") + p_("man") $)

  Note que o manômetro graduado em psi (escala em vermelho) e em $"kgf/cm"^2$ (escala em preto). Neste  experimento, utilizaremos apenas a graduação $"kgf/cm"^2$.

  Como exemplo, consideremos que o manômetro do equipamento marque a pressão $p_("man") = 0,2 " kgf/cm"^2$. Lembrando que a pressão atmosférica é  $1,033 " kgf/cm"^2$, a pressão absoluta do gás será:

  #nonum($ p = p_("atm") + p_("man") = 1,033 + 0,2 = 1,233 " kgf/cm"^2. $)

  Sabendo que

  #nonum($ 1 " kgf/cm"^2  = 9.8066,5 " Pa",$)

  a pressão absoluta deste exemplo será:

  #nonum($ p = 1,233 times  9.8066,5 approx 120.916 " Pa"\ p = 1,209 times 10^5 " Pa".$)  

])


#section([= Procedimentos])

//#info-box([Atenção], [Conteúdo])

//#section([== Primeira Parte])




+ Abra a válvula de descarga e gire a manopla do êmbolo até a posição $L = 20$ cm.

  #info-box([Câmara de gás], [
    A Câmara de gás está graduada em centímetros e possui raio interno $R = 1,6$ cm. Assim, para encontrar o volume ocupado pelo gás, deve-se multiplicar a posição  $L$ do êmbolo pela área de seção transversal $S = pi R^2$:

    #nonum($ V = L times pi R^2. $)

    Por exemplo, para a posição inicial $L = 20$ cm, temos que o volume de gás inicialmente presente na câmara de gás é:

    #nonum($
      V = 20 times (pi 1,6^2) approx 161 " cm"^3 =  1,61 times 10^(-4) " m"^3        
    $)

    
    Considerando o volume calculado acima e os valores típicos para a densidade do ar ($rho_("ar")$) e massa molar do ar ($M_("ar")$) a 20 °C, podemos determinar o número de mols ($n$) confinados na câmara de gás no momento em que a válvula de descarga é fechada:

    #set text(size: 9.5pt)
    #nonum($
      cases(
        rho_("ar") &= 1\,204 " kg/m"^3 ,
        M_("ar") &= 28\,96 " g/mol" = 2\,896 times 10^(-2) " kg/mol" ,
      ) \

      n = display((m_("ar"))/(M_("ar"))) = display((rho_("ar") times V)/(M_("ar"))) = display((1\,204 times (1,61 times 10^(-4)))/(2\,896 times 10^(-2))) \
        n approx 6\,7 times 10^(-3) " mol"         
    $)

    A quantidade de mols calculada acima será utilizada como um dos parâmetros do experimento (ver @tab:parametros).

  ])

+ Feche a válvula de descarga.

+ Com o termômetro (ou multímetro digital na escala de temperatura), anote o valor da temperatura ambiente em kelvin (K).

  #figure(
    kind: table,
    caption: [Parâmetros do Experimento]
  )[
    #table(
      columns: (0.8fr, 1fr, 1fr),
      table.header([Número\ de mols], table.cell(colspan: 2)[Temperatura\ ambiente]),

      [#nonum($n " (mol)"$)], [#nonum($ t_c "(°C)" $)], [#nonum($ T "(K)"\ T  = t_c + 273 $)],
      [$6,7 times 10^(-3)$], [], []
    )
  ]<tab:parametros>

+ Com o êmbolo na posição $L = 20$ cm, leia a pressão manométrica e anote o resultado na @tab:dados.
+ Repita o passo anterior para as demais posições do êmbolo. 



#section([= Análise de Dados])

+ De posse dos dados, construa o gráfico da pressão absoluta $p$ em Pascal (no eixo $y$) em função do inverso do volume $1\/V$ (no eixo $x$).
+ Utilizando o método sugerido pelo professor, determine a equação da reta que melhor se ajuste aos pontos do gráfico construído no item anterior. Comparando a equação geral da reta $y = k x + b$ com a @eq:boyle-mariotte, note que o coeficiente linear deve ser nulo ($b = 0$). Por outro lado, o coeficiente angular $k$ da reta pode ser utilizado para estimar experimentalmente a *constante universal dos gases* ($R_("exp")$):

  $
    k = n R T \
    R_("exp") = k/(n T)
  $<eq:r-exp>

+ Utilize a @eq:r-exp e os dados da @tab:parametros para calcular o valor experimental da constante universal dos gases. 



  #figure(
    kind: table,
    caption: [Análise de Resultados]
  )[
    #table(
      columns: (1fr, 1fr, 1fr),
      table.header([$k$], [$R_("exp")$], [$Delta "Erro" (%)$]),
      [$$]
    )
  ]<tab:resultados>

+ Calcule o erro percentual:
  $
    Delta "Erro" (%) = abs( (R_("exp") - R) / R) times 100 %
  $<eq-desvio-perc>

  #par(first-line-indent: (amount: 0em))[
    em que o valor teórico da constante universal dos gases é $R = 8,31 "J/mol" dot "K"$. Discuta os resultados.
  ]



#set heading(numbering: none)
#section([= Referências])

#bibliography("assets/references/references.bib", style: "assets/references/abnt.csl", title:"")


#place(
  bottom,
  float: true,
  scope: "parent", 
  clearance: 1.5em
)[
  #figure(
    kind: table,
    caption: [Coleta de dados],
  )[
    #table(
      columns: (0.5fr, 1fr, 1fr, 1fr, 1fr, 1fr),
      table.header([$L " (cm)"$], [$V " (m"^3)$], [$1 \/ V " (m"^(-3))$], [$p_("man") " (kgf/cm"^2)$], [$p " (kgf/cm"^2)$], [$p " (Pa)"$]),
      [$20$], [$1,61 times 10^(-4)$], [$6,21 times 10^3$], [$0$], [$1,033$], [$1,013 times 10^5$],
      [$19$], [], [], [], [], [],
      [$18$], [], [], [], [], [],
      [$17$], [], [], [], [], [],
      [$16$], [], [], [], [], [],
      [$15$], [], [], [], [], [],
      [$14$], [], [], [], [], [],
      [$13$], [], [], [], [], [],
      [$12$], [], [], [], [], [],
      [$11$], [], [], [], [], [],
      //table.cell(colspan: 2)[*Média*]
    )
  ]<tab:dados>
]
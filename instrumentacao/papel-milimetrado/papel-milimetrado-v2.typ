#import "styles.typ": *

#show: setup.with(
  title: [Uso do papel milimetrado],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

// Dimensões do Papel Milimetrado
#let x = 160
#let y = 210
// Margem de segurança
#let margem = 10
// Área útil do papel milimetrado
#let L = x - margem
#let H = y - margem
// Fator de redução da figura
#let k = 21
// Dados
#let dados = (
  (.2078, .4),
  (.3708, .5),
  (.5448, .6),
  (.6849, .7),
  (.9424, .8)
)

#let t = dados.map(row => row.at(0))
#let s = dados.map(row => row.at(1))
// Máximos e Mínimos
#let t_max = calc.max(..t)
#let s_max = calc.max(..s)

// Escala Horizontal
#let ex = calc.round(10000*(t_max)/L)/10000
// Escala Vertical
#let ey = calc.round(10000*(s_max/H))/10000


// Regressão
#let t_bar = 0
#let s_bar = 0
#for i in range(t.len()) {
  t_bar += t.at(i)
  s_bar += s.at(i)
}
#let t_bar = t_bar/t.len()
#let s_bar = s_bar/s.len()

#let soma_produto = 0
#let soma_quadrados = 0
#for i in range(t.len()) {
  soma_produto += (t.at(i) - t_bar) * (s.at(i) - s_bar)
  soma_quadrados += (t.at(i) - t_bar)*(t.at(i) - t_bar)
}
#let m = soma_produto/soma_quadrados
#let b = s_bar - m * t_bar


// Pontos extremos da reta de regressão
#let ta = 0
#let sa = b
#let sb = y * ey
#let tb = (sb - b)/m

// Pontos observado no gráfico para cálculo da inclinação observada
#let x1=30
#let y1 = 100
#let x2 = 110
#let y2 = 170

// Inclinação observada
#let t1 = x1 * ex
#let s1 = y1 * ey
#let t2 = x2 * ex
#let s2 = y2 * ey
#let v = (s2 - s1)/(t2 - t1) 


// Dados
#let dados_exercicio = (
  (.9, .31),
  (1.4, .51),
  (1.9, .69),
  (2.4, .84),
  (2.9, 1.02)
)

#section([= Introdução])

O papel milimetrado é uma ferramenta essencial em diversas áreas da ciência e engenharia, principalmente para a *análise gráfica de dados*. Seu _layout_, com linhas horizontais e verticais finamente espaçadas, facilita a plotagem precisa de pontos e a visualização de relações entre variáveis. Ele é especialmente útil para determinar a relação linear entre duas grandezas, como a posição e o tempo, e para calcular coeficientes como a inclinação da reta.

Consideremos um estudo experimental no qual foram coletados dados das variáveis $(u, v)$. Deseja-se representar esses dados em um papel milimetrado de comprimento $L$ e altura $H$. Podemos usar o conceito de proporção para relacionar a medida de uma variável de estudo com sua representação no papel milimetrado. 

Sem perda de generalidade, associando a variável $u$ à escala horizontal do papel, temos a seguinte relação de proporção mostrada na @fig-proporcao.

#figure(
  caption: [Relação de proporção da variável $u$],
  cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let L = 3
    let delta = 0.25
    let pos_x = (0, 3)
    let labels_var = ("Papel", $u$)
    let anchors = ("east", "west")
    let pos_y = (0.1*L, 0.6*L, 0.9*L)
    let labels_y = (($0$, $x$, $L$), ($u_("min")$, $u$, $u_("max")$))
    for i in range(2) {
      let xi = pos_x.at(i)
      let label_var = labels_var.at(i)
      line((xi, 0), (xi, L))
      content((xi, L), anchor: "south", padding: 0.1, [#label_var])
      for j in range(3) {
        let yi = pos_y.at(j)
        let label_y = labels_y.at(i).at(j)
        line((xi - delta/2, yi), (xi + delta/2, yi))
        content((xi + (i - 1)*delta/2, yi), anchor: anchors.at(i), padding: 0.2, [#label_y])
        line((pos_x.at(0), yi), (pos_x.at(1), yi), stroke: (thickness: 0.5pt, dash: "dashed"))
      }
    }
  })
)<fig-proporcao>

Observe que o valor mínimo $u_("min")$ equivale ao $0$ (zero) do papel; o valor máximo $u_("max")$ equivale ao comprimento útil do papel. Assim, um valor arbitrário da variável $u$ dicará associado a uma posição  $x$ do papel milimetrado. Matematicamente, tem-se:


#set math.equation(numbering: none)
$
  x/L = (u - u_("min"))/(u_("max") - u_("min"))
$

#set math.equation(numbering: "(1)", number-align: bottom)

Podemos reescrever a expressão acima como:

$
  u = u_("min") + e_x dot x
$<eq-prop-x>

#par(first-line-indent: 0mm)[em que] 
$ 
  e_x = display((u_("max") - u_("min"))/L) 
$<eq-escala-x> 
#par(first-line-indent: 0mm)[é a razão de escala horizontal. O mesmo raciocínio permite obter as equações para a escala vertical:]


$
  v = v_("min") + e_y dot y
$<eq-prop-y>

#par(first-line-indent: 0mm)[em que] 
$ 
  e_y = display((v_("max") - v_("min"))/L) 
$<eq-escala-y>  
#par(first-line-indent: 0mm)[é a razão de escala vertical.]

#section([= Objetivos])

+ Compreender o uso do papel milimetrado para a representação gráfica de dados experimentais;
+ Representar graficamente os pontos experimentais de um conjunto de dados;
+ Traçar a "melhor" reta que se ajusta aos dados;
+ Calcular a inclinação da reta ajustada.


#section([= Material Necessário])

- Papel milimetrado;
- Régua.


#section([= Procedimentos])

Para esta atividade, utlizamos os seguintes dados, relativos à posição (em metros) e tempo (em segundos) de um móvel, para determinar a velocidade por meio de análise gráfica:

#figure(
  kind: table,
  caption: [Dados fictícios de Tempo e Posição de um móvel]
)[
  #table(
    columns: 2,
    table.header([$t$ (s)], [$s$ (m)]),
    ..dados.flatten().map(row => [#str(row).replace(".", ",")])
  )
]



#section([== Cálculo e Criação das Escalas])

  #info-box([Atenção], [
    Nesta atividade, optamos por incluir a Origem ($0, 0$) no gráfico. Assim, no cálculo das amplitudes, o valor mínimo usado foi igual a 0 (zero). Caso deseje limitar o gráfico estritamente ao intervalo de dados, escolha como valor mínimo o menor valor na tabela de dados coletados.
  ])

#set math.equation(numbering: none)


+ Eixo Horizontal ($u arrow t$). Aplique a equação @eq-escala-x para calcular o valor da razão de escala horizontal. Note que a largura do papel é igual a $#x$ mm. Entretando, a fim de ter uma _margem de segurança_, utilizaremos $L = #L$ mm. Preencha a @tab-escala-x.

#figure(
  kind: table,
  caption: [Cálculo da escala horizontal]
)[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr),
    table.header(
      [$t_("min")$], [$t_("max")$], [$L$], [$e_x$],
    ), 
    [0], [], [], []
  )
]<tab-escala-x>

+ Eixo Vertical ($v arrow s$). Aplique a equação @eq-escala-y para calcular o valor da razão de escala vertical. Note que a altura do papel é igual a $#y$ mm. Entretando, a fim de ter uma _margem de segurança_, utilizaremos $H = #H$ mm. Preencha a @tab-escala-y.

#figure(
  kind: table,
  caption: [Cálculo da escala vertical]
)[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr),
    table.header(
      [$s_("min")$], [$s_("max")$], [$H$], [$e_y$],
    ), 
    [0], [], [], []
  )
]<tab-escala-y>

#section([== Marcação dos pontos e traçado da reta])

+ Localize cada par (tempo, posição) no gráfico e marque-os com pequenos pontos. Por exemplo, para localizar no papel o par ordenado ($t = #str(t.at(2)).replace(".", ",")$ s, $s = #str(s.at(2)).replace(".", ",")$ m), faça:
  - Para o eixo horizontal ($x$), aplique a @eq-prop-x ($u arrow t$): 
  $
    &t = t_("min") + e_x dot x \ 
    &arrow.double 
    x = (t - t_("min"))/e_x = #str(t.at(2)).replace(".", ",")/#str(ex).replace(".", ",") approx  #str(calc.round(t.at(2)/ex)).replace(".", ",") " mm"
  $
  - Para o eixo vertical ($y$), aplique a @eq-prop-y ($v arrow s$): 
  $
    &s = s_("min") + e_y dot y \ 
    &arrow.double 
    y = (s - s_("min"))/e_y =  #str(s.at(2)).replace(".", ",")/#str(ey).replace(".", ",") approx  #str(calc.round(s.at(2)/ey)).replace(".", ",") " mm"
  $

+ Com a régua, trace uma reta que passe o mais próximo possível de todos os pontos, equilibrando os que ficam acima e abaixo (Ver @fig-papel).




#section([== Cálculo da inclinação])

+ Escolha dois pontos distintos da reta (preferencialmente distante um do outro)  $P_1 = (t_1, s_1)$ e $P_2 = (t_2, s_2)$ e calcule a velocidade (inclinação) pela fórmula:

$
  m = frac(s_2 - s_1, t_2 - t_1)
$

+ Observando a @fig-papel, percebemos que a reta passa pelos pontos $P_1 = (#x1, #y1)$ e $P_2 = (#x2, #y2)$. Sabendo que cada 1 mm no eixo horizontal equivale a 0,0059 s e que cada 1 mm no eixo vertical equivale a 0,0040 m, temos:

#show math.equation: set text(size: 11pt)
  $
      P_1 &= (x1, y1) &arrow.double 
      &cases(
        t_1 = x1 times #str(ex).replace(".", ",") &= #str(calc.round(1000*t1)/1000).replace(".", ",")\
        s_1 = y1 times #str(ey).replace(".", ",") &= #str(calc.round(1000*s1)/1000).replace(".", ",")
      )\
      P_2 &= (x2, y2) &arrow.double 
      &cases(
        t_2 = x2 times #str(ex).replace(".", ",") &= #str(calc.round(1000*t2)/1000).replace(".", ",")\
        s_2 = y2 times #str(ey).replace(".", ",") &= #str(calc.round(1000*s2)/1000).replace(".", ",")
      )\
  $

  Então,
#show math.equation: set text(size: 12pt)
  $
    m &= frac(s_2 - s_1, t_2 - t_1) = (#str(calc.round(1000*s2)/1000).replace(".", ",") - #str(calc.round(1000*s1)/1000).replace(".", ",")) / (#str(calc.round(1000*t2)/1000).replace(".", ",") - #str(calc.round(1000*t1)/1000).replace(".", ",")) approx #str(calc.round(1000*v)/1000).replace(".", ",") "m/s"
  $

+ Especifique no papel milimetrado os eixos para as variável tempo ($t$) e posição ($s$). Aplicando a @eq-prop-x, perceba que $50$ mm no papel equivalem a $0,32$ s no eixo horizontal e, aplicando a @eq-prop-y,  para o eixo vertical, $50$ mm equivalem a $0,2$ m.

  #figure(
    caption: [Análise gráfica dos dados de exemplo],
    cetz.canvas({
      import cetz.draw: *

      for i in range(y+1, step: 10) {
        let cor = gray
        if i <= x {

          if calc.rem(i, 50)==0 and i != 0{
            let t = str(calc.round(100 * (i * ex))/100).replace(".", ",")
            cor = black.transparentize(30%)
            content((i/k, -1/10), [#text(fill: primary-color)[#t]], anchor: "north")
            content((i/k, y/k+1/10), [#i], anchor: "south")
          }
          line(
            (i/k, 0), (i/k, y/k), stroke: cor
          )
        }

        if calc.rem(i, 50)==0 and i != 0{
            let s = str(calc.round(100 * (i * ey))/100).replace(".", ",")
            cor = black.transparentize(30%)
            content((-1/10, i/k), [#text(fill: primary-color)[#s]], anchor: "east")
            content((x/k+1/10, i/k), [#i], anchor: "west",)
        }
        line(
          (0, i/k), (x/k, i/k), stroke: cor
        )
      }

      line(
        (x1/k, y1/k), (x2/k, y1/k), (x2/k, y2/k),
        fill: gray.transparentize(50%), stroke: none
      )

      line(
        ((ta/ex)/k, (sa/ey)/k), ((tb/ex)/k, (sb/ey)/k), stroke: 1.5pt+primary-color
      )

      let xi
      let yi
      for i in range(t.len()) {
        xi = t.at(i) / ex
        yi = s.at(i) / ey
        circle(
          (xi/k, yi/k), radius: 3pt, fill: primary-color, stroke: none
        )
      }

      line(
        ((x1 + 15)/k, (y1 - 30)/k), (x1/k, y1/k), mark: (end: "stealth", fill: black), name: "P1"
      )
      content("P1.start", [$P_1$], anchor: "north", padding: 0.06, fill: white)
      line(
        ((x2 + 15)/k, (y2 - 30)/k), (x2/k, y2/k), mark: (end: "stealth", fill: black), name: "P2"
      )
      content("P2.start", [$P_2$], anchor: "north", padding: 0.06, fill: white)

      line((0,0), (x/k+15/k, 0), stroke: 2pt+primary-color, mark: (end: "stealth", fill: primary-color), name: "x-axis")
      content("x-axis.end", anchor: "north", padding: 0.2, [#text(fill: primary-color)[$t$ (s)]])

      line((0,0), (0, y/k + 15/k), stroke: 2pt+primary-color, mark: (end: "stealth", fill: primary-color), name: "y-axis")
      content("y-axis.end", anchor: "east", padding: 0.2, [#text(fill:primary-color)[$s$ (m)]])
    })
  )<fig-papel>



#section([= Exercício])
+ Aplique o procedimento acima aos seguintes dados e calcule a velocidade do móvel:

#figure(
  kind: table,
  caption: [Dados para exercício]
)[
  #table(
    columns: 2,
    table.header([Tempo (s)], [Posição (m)]),
    ..dados_exercicio.flatten().map(row => [#str(row).replace(".", ",")])
  )
]


/*
#set heading(numbering: none)
#section([= Referências])

#bibliography("assets/references/references.bib", style: "assets/references/abnt.csl", title:"")
*/

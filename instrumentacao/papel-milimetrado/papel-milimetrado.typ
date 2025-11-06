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
#let k = 28
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
  caption: [Dados fictícios para atividade]
)[
  #table(
    columns: 2,
    table.header([Tempo (s)], [Posição (m)]),
    ..dados.flatten().map(row => [#str(row).replace(".", ",")])
  )
]



#section([== Cálculo e Criação das Escalas])

  #info-box([Atenção], [
    Nesta atividade, optamos por incluir a Origem ($0, 0$) no gráfico. Assim, no cálculo das amplitudes, o valor mínimo usado foi igual a 0 (zero). Caso deseje limitar o gráfico estritamente ao intervalo de dados, escolha como valor mínimo o menor valor na tabela de dados coletados.
  ])

#set math.equation(numbering: none)



+ Eixo Horizontal: $x arrow.double  t "(Tempo)"$.

  - Cálculo da amplitude horizontal ($A_h$):
    $ 
      A_x &= t_("máx")= #str(t_max).replace(".", ",") " s"
    $
  - Divida a amplitude  horizontal ($A_h$)  pela largura do papel (nese caso igual a $L = #L$ mm) para encontrar a escala horizontal ($e_x$):
    $
      e_x &= frac(A_h, L) = #t_max/#L approx #str(ex).replace(".", ",") " s/mm" 
    $
  - Cada 1 milímetro no papel equivale a #str(ex).replace(".", ",") segundos da variável experimental tempo.

+ Eixo Vertical: $y arrow.double  s "(Posição)"$.

  - Cálculo da amplitude vertical ($A_v$):
    $ 
      A_v &= s_("máx") = #str(s_max).replace(".", ",") " m"
    $
  - Divida a amplitude  vertical ($A_v$)  pela altura do papel (nese caso igual a $H = #H $ mm) para encontrar a escala horizontal ($e_y$):
    $
      e_y &= frac(A_v, H) = #s_max/#H approx #str(ey).replace(".", ",") " m/mm" 
    $
  - Cada 1 milímetro no papel equivale a $#str(ey).replace(".", ",")$ metros da variável experimental posição.

#section([== Marcação dos pontos e traçado da reta])

+ Localize cada par (tempo, posição) no gráfico e marque-os com pequenos pontos. Por exemplo, para localizar no papel o par ordenado ($t = #str(t.at(2)).replace(".", ",")$ s, $s = #str(s.at(2)).replace(".", ",")$ m), faça:
  - Eixo horizontal ($x$): 
  $
    x &= (t)/e_x = #str(t.at(2)).replace(".", ",")/#str(ex).replace(".", ",") approx  #str(calc.round(t.at(2)/ex)).replace(".", ",") " mm"
  $
  - Eixo Vertical ($y$): 
  $
    y &= (s)/e_y =  #str(s.at(2)).replace(".", ",")/#str(ey).replace(".", ",") approx  #str(calc.round(s.at(2)/ey)).replace(".", ",") " mm"
  $

+ Com a régua, trace uma reta que passe o mais próximo possível de todos os pontos, equilibrando os que ficam acima e abaixo (Ver @fig-papel).




#section([== Cálculo da inclinação])

+ Escolha dois pontos distintos da reta (preferencialmente distante um do outro)  $P_1 = (t_1, s_1)$ e $P_2 = (t_2, s_2)$ e calcule a velocidade (inclinação) pela fórmula:

$
  m = frac(s_2 - s_1, t_2 - t_1)
$

+ Observando a @fig-papel, percebemos que a reta passa pelos pontos $P_1 = (#x1, #y1)$ e $P_2 = (#x2, #y2)$. Sabendo que cada 1 mm no eixo horizontal equivale a 0,0059 s e que cada 1 mm no eixo vertical equivale a 0,0040 m, temos:

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

  $
    m &= frac(s_2 - s_1, t_2 - t_1) = (#str(calc.round(1000*s2)/1000).replace(".", ",") - #str(calc.round(1000*s1)/1000).replace(".", ",")) / (#str(calc.round(1000*t2)/1000).replace(".", ",") - #str(calc.round(1000*t1)/1000).replace(".", ",")) approx #str(calc.round(1000*v)/1000).replace(".", ",") "m/s"
  $


  #figure(
    caption: [Análise gráfica dos dados de exemplo],
    cetz.canvas({
      import cetz.draw: *


      line(
        (x1/k, y1/k), (x2/k, y1/k), (x2/k, y2/k),
        fill: gray.transparentize(50%), stroke: none
      )

      line(
        ((ta/ex)/k, (sa/ey)/k), ((tb/ex)/k, (sb/ey)/k), stroke: 1.5pt+primary-color
      )

      for i in range(y+1, step: 10) {
        if i <= x {
          line(
            (i/k, 0), (i/k, y/k), stroke: black.transparentize(60%)
          )
          if calc.rem(i, 50)==0 and i != 0{
            content((i/k, -1/10), [#i], anchor: "north")
            content((i/k, y/k+1/10), [#i], anchor: "south")
          }
        }
        line(
          (0, i/k), (x/k, i/k), stroke: black.transparentize(60%)
        )
        if calc.rem(i, 50)==0{
            content((-1/10, i/k), [#i], anchor: "east")
            content((x/k+1/10, i/k), [#i], anchor: "west",)
        }
      }

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

/**
#set heading(numbering: none)
#section([= Referências])

#bibliography("assets/references/references.bib", style: "assets/references/abnt.csl", title:"")
*/
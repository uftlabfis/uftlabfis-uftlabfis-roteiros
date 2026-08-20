#import "styles.typ": *

#show: setup.with(
  title: [Uso do papel milimetrado],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

// Dimensões do Papel Milimetrado
#let x = 180
#let y = 280
// Margem de segurança
#let margem = 0
// Área útil do papel milimetrado
#let L = x - margem
#let H = y - margem
// Fator de redução da figura
#let k = 28
// Dados
#let dados = (
  (0,  4),
  (2, 9),
  (4, 14),
  (6, 19),
  (8, 24),
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
  (0, 10),
  (2, 14),
  (4,  18),
  (6, 22),
  (8, 26)
)

#section([= Introdução])

O papel milimetrado é uma ferramenta essencial em diversas áreas da ciência e engenharia, principalmente para a *análise gráfica de dados*. Seu _layout_, com linhas horizontais e verticais finamente espaçadas, facilita a plotagem precisa de pontos e a visualização de relações entre variáveis. Ele é especialmente útil para determinar a relação linear entre duas grandezas, como a posição e o tempo, e para calcular coeficientes como a inclinação da reta.

#section([= Objetivos])

+ Compreender o uso do papel milimetrado;
+ Plotar os pontos de um conjunto de dados;
+ Traçar a "melhor" reta que se ajusta aos dados;
+ Calcular a inclinação da reta ajustada.


#section([= Material Necessário])

- Papel milimetrado (dimensões: 180 mm x 280 mm);
- Régua.


#section([= Procedimentos])

Para esta atividade, utlizamos os seguintes dados, relativos à posição (em metros) e tempo (em segundos) de um móvel, para determinar a velocidade por meio de análise gráfica:


#set table(
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

#show table.cell.where(y: 0): none

#figure(
  kind: table,
  caption: [Dados fictícios para atividade]
)[
  #table(
    columns: (3fr, 2fr, 2fr, 2fr, 2fr, 2fr),
    table.header(none),
    [$t$ (s)], ..t.map(i => str(i)),
    [$s$ (m)], ..s.map(i => str(i)),

  )
]







#section([== Preparação do papel e marcação dos pontos])

+ Posicione o papel milimetrado na orientação retrato (altura maior que a largura).

+ Desenhe com lápis e régua:
  - O eixo horizontal (tempo) partindo da origem para a direita. 
  - O eixo vertical (espaço) partindo da origem para cima.

// #section([== Determinando a escala])

+ Para o *Eixo Horizontal* $->$ *Tempo* (0 a 8 segundos):
  - Observe que a largura útil do papel é 180 mm ou 18 cm e desejamos representar 8 segundos.
  - Por simplicidade, podemos usar a equivalência de *2 cm no papel* para cada *1 segundo no tempo*. Veja na @fig-papel como fica a representação tempo no eixo horizontal.

+ Para o *Eixo Vertical* $->$ *Espaço* (0 a 24 metros):
  - Observe que a altura útil do papel é 280 mm ou 28 cm e desejamos representar 24 metros.
  - Por simplicidade, podemos usar a equivalência de *1 cm no papel* para cada *1 metro no espaço*. Veja na @fig-papel como fica a representação tempo no eixo vertical.

  #info-box([Atenção], [
   A análise nos dois itens acima pode ser diferente para outros conjuntos de dados.
  ])


+ Localize cada par (tempo, posição) no gráfico e marque-os com pequenos pontos. Por exemplo, para o ponto (2, 9), contamos 4 cm na horizontal e 9 cm na vertical.

#section([== Traçado da "melhor" reta e equação])

+ Com a régua, trace uma reta de modo que haja aproximadamente o mesmo número de pontos acima e abaixo dela.


#section([== Equação da Reta])

+ Lembre que a equação geral da reta é:

  $
    y = m x + b
  $
  #par(first-line-indent: (amount: 0cm))[em que $m$ é o *coeficiente angular* e $b$ é o coeficiente linear.]

+ *Coefiente linear*: Corresponde ao ponto em que a reta "toca" o eixo vertical. No caso deste exemplo: $b = 4$ metros.

+ *Coeficiente angular*: Escolha dois pontos distintos da reta (preferencialmente distante um do outro)  $P_1 = (t_1, s_1)$ e $P_2 = (t_2, s_2)$ e calcule a velocidade (inclinação) pela fórmula:

  $
    m = frac(s_2 - s_1, t_2 - t_1)
  $


  #par(first-line-indent: (amount: 0cm))[Então,]

  $
    m &= frac(s_2 - s_1, t_2 - t_1) = (24 - 4)/(8 - 0)  = 2,5 "m/s" 
  $

+ Assim, neste exemplo, obtivemos que a equação horária do móvel é 

$
  s = 4 + 2,5 t
$
ou seja, sua posição inicial é $s_0 = 4$ m e sua velocidade é $v = 2,5 $ m/s. 

  #figure(
    caption: [Gráfico dos dados de exemplo],
    cetz.canvas({
      import cetz.draw: *

      scale(0.4)
      

      for i in range(19) {
        line( (i, 0), (i, 28),  )
      }


      for j in range(29) {
        line( (0, j), (18, j), stroke: uft-gray)
      } 


      line((0, 0), (20, 0), stroke: uft-blue+1.5pt, mark: (end: "stealth", fill: uft-blue))
      content((19,-1), [t (s)])

      for i in range(1, 9) {
        line((2*i, 0), (2*i, -0.5), stroke: uft-blue+1.5pt)
        content((2*i, -1), [#i])
      }

      line((0,0), (0, 30), stroke: uft-blue+1.5pt, mark: (end: "stealth", fill: uft-blue))
      content((-0.5, 30), [s (m)], anchor: "south-west")

      for i in range(4, 28, step: 4) {
        line((0, i), (-0.5, i), stroke: uft-blue+1.5pt )
        content((-0.6, i), [#i], anchor: "east")
      }

      
      for p in dados {
        circle(
          (2*p.at(0), p.at(1)), radius: 8pt, fill: uft-blue, stroke: uft-blue
        )
      }

      line((0, 4), (16, 24), stroke: 1.5pt+primary-color)



    })
  )<fig-papel>

#section([= Exercício])
+ Aplique o procedimento acima aos seguintes dados e calcule a velocidade do móvel:

#figure(
  kind: table,
  caption: [Dados para exercício]
)[
  #table(
    columns: (3fr, 2fr, 2fr, 2fr, 2fr, 2fr),
    table.header(none),
    [$t$ (s)], ..dados_exercicio.map(row => row.at(0)).map(i => str(i)),
    [$s$ (m)], ..dados_exercicio.map(row => row.at(1)).map(i => str(i)),

  )
]



/**
#set heading(numbering: none)
#section([= Referências])

#bibliography("assets/references/references.bib", style: "assets/references/abnt.csl", title:"")
*/
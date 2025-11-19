#import "styles.typ": *

#show: setup.with(
  title: [Superfícies Equipotenciais e Campo Elétrico],
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
      rect((i * 1.25, -1.5), (i * 0.75, 1.5))
    }
  
    for i in range(1, 6) {
      content((-1, -1.5 + i * 0.5), [$+$])
      content((1, -1.5 + i * 0.5), [$-$])
      line((-0.75, -1.5 + i * 0.5), (0.25, -1.5 + i * 0.5), mark: (end: "stealth"), fill: black)
      line((0, -1.5 + i * 0.5), (0.75, -1.5 + i * 0.5))

    }

    content((-1.25, -1.5), [$+q$], anchor: "east", padding: 0.1)
    content((1.25, -1.5), [$-q$], anchor: "west", padding: 0.1)
    content((0, 1.5), [$arrow(E)$])

    line((-0.75, -1.8), (0.75, -1.8), mark: (symbol: "bar"), name: "line")
    set-style(content: (frame: "rect", stroke: none, fill: white, padding: .1))
    content("line.mid", [$d$], )

    
  })
]
<fig:campo-eletrico>

A @fig:campo-eletrico ilustra que as linhas de campo são dotadas das propriedades:

- em qualquer ponto do espaço, as linhas de campo têm a mesma direção e sentido do vetor campo elétrico no ponto;
- a distribuição das linhas de campo no espaço é tal que a quantidade de linhas por unidade de área deve ser proporcional à intensidade do campo elétrico.

Observe que as linhas de campo sempre _começam_ nas cargas positivas e _terminam_ nas cargas negativas. Por outro lado, a cada ponto do espaço também esta associado um potencial elétrico, definido de modo que a diferença de potencial entre dois pontos é:

$
  V = - integral_0^d arrow(E) dot d arrow(s)
$<eq:campo-eletrico>

Considerando o caso especial em que o campo elétrico é constante, resolvendo a integral da @eq:campo-eletrico, tem-se:

$
  V = - integral_0^d arrow(E) dot d arrow(s) &arrow.double V = - integral_0^d (- E d s)\
  &arrow.double V = E integral_0^d d s \
  &arrow.double V = E d \
  &arrow.double E = V / d 
$<eq:campo-eletrico-constante>


#section([= Objetivos])

+ identificar e/ou descrever campo elétrico e linhas de força;
+ analisar as linhas de força ao redor de placas paralelas;
+ determinar o campo elétrico entre duas placas elétricas.


#section([= Material Necessário])

+ uma cuba com escala projetável;
+ conexões de fios com pinos banana e garras de jacaré;
+ uma ponteira para tomada de dados;
+ dois eletrodos retos;
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
  E_("esp") = V/d = 10/20 = 0,5 "V/cm"
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


+ Com os dados da Tabela @tab:dados}, construa o gráfico diferença de potencial $V$ em função da distância $d$.

+ Calcule o coeficiente de inclinação da reta construída no item anterior. Este será o _valor experimentao_ do campo elétrico  ($E_("exp")$).

+  Utilize a @eq:erro para calcular o erro percentual do experimento. Preencha a @tab:resultados.


#figure(
  kind: table,
  caption: [Análise de Resultados],
)[
  #table(
    columns: (0.6fr, 1fr),
    table.header([Grandeza], [Valor Encontrado]),
    [$E_("esp")$ (V/cm)], [],
    [$E_("exp")$ (V/cm)], [],
    [Erro (%)], []
    //table.cell(colspan: 2)[*Média*]
  )
]<tab:resultados>

$
  "Erro (%)" = 100 times abs(E_("exp") - E_("esp"))/(E_("esp"))
$<eq:erro>


#set heading(numbering: none)
#section([= Referências])

#bibliography("assets/references/references.bib", style: "assets/references/abnt.csl", title:"")
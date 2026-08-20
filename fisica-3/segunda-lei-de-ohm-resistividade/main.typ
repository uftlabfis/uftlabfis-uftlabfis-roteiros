#import "styles.typ": *

#show: setup.with(
  title: [Resistividade e 2ª Lei de Ohm],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

#section([= Introdução])

Quando uma tensão é aplicada às extremidades de um fio condutor, estabelece-se uma corrente elétrica. A oposição à passagem dessa corrente é a resistência elétrica ($R$), que depende não apenas do material, mas também do comprimento, da área da seção transversal e da temperatura do condutor.

#figure(
  cetz.canvas({
    import cetz.draw: *


    circle((0, 0), radius: (0.4, 1), stroke: (dash: "dashed", paint: gray), fill: gray.transparentize(80%))
    line((-2.5, 1), (2.5, 1))
    line((-2.5, -1), (2.5, -1))
    arc((-2.5, -1), start: -90deg, delta: -180deg, radius: (0.4, 1))
    circle((2.5, 0), radius: (0.4, 1))

    content((0, 0), [$A$])

    line((-2.5, 1.5), (2.5, 1.5), mark: (start: ">", end: ">", fill: black), name: "ln")
    content("ln.mid", box(fill: white, inset: 2pt, [$L$]))
    
  })
)<fig-fio>

Para caracterizar uma propriedade intrínseca do material, independente de sua geometria, utiliza-se a resistividade elétrica ($rho$). Para um fio homogêneo, de seção transversal uniforme e temperatura constante, a 2ª Lei de Ohm estabelece que a resistência é diretamente proporcional ao comprimento ($L$) e inversamente proporcional à área da seção transversal ($A$), segundo a relação:


$
  R = rho dot L / A.
$<eq-ohm-lei-2>

O estudo dessa lei é fundamental para o dimensionamento de circuitos, linhas de transmissão e dispositivos eletrônicos, pois relaciona a resistência às características físicas do condutor.


Neste experimento, a resistência elétrica $R$ será medida para diferentes comprimentos $L$ de um fio de seção transversal constante $A$. Os pares $(L, R)$ serão plotados em um gráfico cartesiano. Como a relação $R = (rho \/ A) dot L$ é linear, espera-se que os pontos experimentais se alinhem segundo uma reta que passa pela origem.  O coeficiente angular dessa reta (obtido, por exemplo, por regressão linear) será numericamente igual a $rho \/ A$. Multiplicando-se esse coeficiente pela área $A$ (calculada a partir do diâmetro medido do fio), obtém-se diretamente o valor experimental da resistividade $rho$, que poderá então ser comparado com valores tabelados para o material.



#section([= Objetivos])

+ Verificar a relação linear entre resistência e comprimento do fio ($R times L$), mantendo a área $A$ constante;
+ Determinar a resistividade do material do fio a partir do coeficiente angular do gráfico $R times L$


#section([= Material Necessário])

- Fio metálico;
- Múltimetro digital e garras de jacaré;
- Trena.


#section([= Procedimentos])

//info-box([Atenção], [Conteúdo])

//#section([== Primeira Parte])


+ Conecte a ponteira preta da garra de jacaré a uma extremidade do fio elétrico, conforme
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
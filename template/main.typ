#import "styles.typ": *

#show: setup.with(
  title: [Título do roteiro],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

#section([= Introdução])

#lorem(50) 

Conforme #cite(<example-book>, form: "prose"), ...

#figure(
  image("assets/images/uftlabfis-logo.png", width: 50%),
  caption: [Legenda da figura]
)<fig-modelo>



#lorem(30) Ver @fig-modelo.

#lorem(20)

$
  E = rho_f g V  
$<eq-empuxo>

#section([= Objetivos])

+ Determinar ...
+ Compreender ...


#section([= Material Necessário])

- Paquímetro;
- Cronômetro;
- Trilho de ar.


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
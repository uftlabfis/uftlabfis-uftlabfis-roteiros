#import "styles.typ": *

#show: setup.with(
  title: [Pêndulo Simples],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

#section([= Introdução])

Considere um pêndulo simples: massa pontual $m$ presa a uma haste (ou fio) inextensível de comprimento $l$, sem atrito, oscilando no plano vertical sob a aceleração da gravidade $g$. O ângulo que o fio faz com a vertical é $theta$ @Halliday2

#figure(
  caption: [Pêndulo Simples],
  cetz.canvas({
    import cetz.draw: *

    // -----------------------------
    // Definição de parâmetros
    // m: massa
    // g: gravidade
    // l: comprimento do fio
    // teta_0: ângulo da vertical para referência (270° = vertical para baixo)
    // teta: deslocamento angular do pêndulo
    // -----------------------------
    let (m, g, l, teta_0, teta) = (.16, 9.8, 4, 270deg, 35deg)
    let teta_1 = teta_0 + teta

    // Pontos principais:
    let O = (0,0)  // ponto de suspensão
    let P = (l*calc.cos(teta_1), l*calc.sin(teta_1))  // posição da massa

    // -----------------------------
    // SUPORTE DO TETO
    // -----------------------------
    rect((-1.5*l*calc.sin(teta), -0.05),
        ( 1.5*l*calc.sin(teta),  0.05),
        fill: black)

    // -----------------------------
    // ARCO DO ÂNGULO TOTAL DO PÊNDULO
    // -----------------------------
    arc((l*calc.cos(teta_0), l*calc.sin(teta_0)),
        start: teta_0, stop: teta_1, radius: l,
        stroke: (dash: "dashed", thickness: 0.6pt))

    // Arco menor preenchido para marcar visualmente o ângulo θ
    arc(((l/3)*calc.cos(teta_0), (l/3)*calc.sin(teta_0)),
        start: teta_0, stop: teta_1, radius: l/3,
        mode: "PIE", stroke: none,
        fill: color.mix(white, (primary-color, 50%)))

    // Rótulo do ângulo θ próximo ao arco menor
    content((1.2*(l/3)*calc.cos((teta_0 + teta/2)),
            1.2*(l/3)*calc.sin(teta_0 + teta/2)),
            [$theta$])

    // Linha vertical tracejada para referência
    line(O, (O.at(0), O.at(1)-1.35*l),
        stroke: (dash: "dashed", thickness: 0.6pt))

    // Pequeno arco de ângulo mostrado junto ao ponto P
    arc((P.at(0)+(l/6)*calc.cos(teta_0),
        P.at(1)+(l/6)*calc.sin(teta_0)),
        start: teta_0, stop: teta_1, radius: l/6,
        mode: "PIE", stroke: none,
        fill: color.mix(white, (primary-color, 50%)))

    // Rótulo θ mostrado próximo ao ponto P
    content((P.at(0)+0.65*(l/3)*calc.cos((teta_0 + teta/2)),
            P.at(1)+0.65*(l/3)*calc.sin(teta_0 + teta/2)),
            [#text(size: 10pt)[$theta$]])

    // -----------------------------
    // DESENHO DO PÊNDULO
    // -----------------------------
    line(O, P, stroke: 0.8pt, name: "fio")  // fio do pêndulo

    circle(P, radius: 0.1, fill: black, name: "massa")  // massa na extremidade

    // Rótulo da massa
    content("massa", [$m$], anchor: "south-west", padding: 0.1)

    // Rótulo do fio indicando o comprimento l
    content("fio.mid", [$l$], anchor: "west", padding: "0.2")

    // -----------------------------
    // FORÇAS APLICADAS NA MASSA
    // -----------------------------

    // Tensão no fio
    line(P,
        (P.at(0)-m*g*calc.cos(teta)*calc.sin(teta),
          P.at(1)+m*g*calc.cos(teta)*calc.cos(teta)),
        stroke: (thickness: 1pt, paint: uft-yellow),
        mark: (end: ">>", fill: uft-yellow),
        name: "tensao")

    content("tensao.end",
            [$T$],
            anchor: "south-west", padding: 0.1)

    // Peso (vertical para baixo)
    line(P, (P.at(0), P.at(1)-m*g),
        stroke: (thickness: 1pt, paint: uft-blue),
        mark: (end: ">>", fill: uft-blue),
        name: "peso")

    content("peso.end", [$arrow(P)$],
            anchor: "north", padding: 0.2)

    // Componente paralela ao fio
    line(P,
        (P.at(0)+m*g*calc.cos(teta)*calc.sin(teta),
          P.at(1)-m*g*calc.cos(teta)*calc.cos(teta)),
        stroke: (thickness: 0.8pt, paint: uft-blue),
        mark: (end: ">>", fill: uft-blue),
        name: "peso-paralelo")

    content("peso-paralelo.end",
            [$accent(P, arrow)_parallel$],
            anchor: "south-west", padding: 0.01)

    // Componente perpendicular ao fio
    line(P,
        (P.at(0)-m*g*calc.sin(teta)*calc.cos(teta),
          P.at(1)-m*g*calc.sin(teta)*calc.sin(teta)),
        stroke: (thickness: 0.8pt, paint: uft-blue),
        mark: (end: ">>", fill: uft-blue),
        name: "peso-perpendicular")

    content("peso-perpendicular.end",
            [$arrow(P)_perp$],
            anchor: "south", padding: 0.25)

    // Linha tracejada conectando as extremidades das forças
    line("peso-paralelo.end",
        "peso.end",
        "peso-perpendicular.end",
        stroke: (dash: "dashed", thickness: 0.6pt))

  })
)<fig-pendulo>




Como ilustrado na @fig-pendulo, atuam sobre a massa $m$ duas forças: o peso $arrow(P) = m arrow(g)$ e a tensão $T$ no fio. O peso pode  ser decomposto em duas componentes: 
  #set enum(numbering: "(i)")
  + a componente radial $arrow(P)_parallel = m g cos theta$, paparela ao fio e equilibrada pela tensão;
  + a componente tangencial $arrow(P)_perp = m g sin theta$, perpendicular ao fio e responsável pela aceleração ao longo da trajetória.

Seja $theta(t)$ o ângulo que o fio faz com a vertical. A componente
tangencial do peso tem módulo $m g sin(theta)$ e atua no sentido de reduzir
$theta$. Aplicando a segunda lei de Newton na direção tangencial:

$
  F_R = m a = - m g sin theta
$


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
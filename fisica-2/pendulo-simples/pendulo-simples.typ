#import "styles.typ": *

#show: setup.with(
  title: [Pêndulo Simples],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

#section([= Introdução])

Considere um pêndulo simples formado por uma massa pontual $m$ presa a um fio inextensível de comprimento $l$, oscilando no plano vertical sem atrito sob a aceleração da gravidade $arrow(g)$. O movimento é descrito pelo ângulo $theta$ que o fio faz com a vertical @Halliday2.

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
    let a = 1.5 * l * calc.sin(teta)

    // Pontos principais:
    let O = (0,0)  // ponto de suspensão
    let P = (l*calc.cos(teta_1), l*calc.sin(teta_1))  // posição da massa

    // -----------------------------
    // SUPORTE DO TETO
    // -----------------------------
    rect((-a, -0.05),
        (+a,  0.05),
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
    // ACELERAÇÃO DA GRAVIDADE
    // -----------------------------
    line((-a/2, -a/2), (-a/2, -a/2-g/8), mark: (end: ">>"), fill: black, name: "acel-g")
    content("acel-g.mid", [$arrow(g)$], anchor: "east", padding: 0.2)

    // -----------------------------
    // SENTIDO DE ARCO POSITIVO
    // ----------------------------- 
    arc((O.at(0), O.at(1) - 1.5*l), start: teta_0, stop: teta_0+teta, radius: 1.5*l, stroke: (thickness: 0.6pt), mark: (end: ">>", fill: black), name: "arco-positivo")
    content("arco-positivo.end", [$+$], anchor: "west", padding: 0.1)


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
            [$arrow(T)$],
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


#let sen = math.op("sen")

Como ilustrado na @fig-pendulo, atuam sobre a massa $m$ duas forças: o peso $arrow(P) = m arrow(g)$ e a tensão $arrow(T)$ no fio. O peso pode  ser decomposto em duas componentes: 
  #set enum(numbering: "(i)")
  + a componente radial $arrow(P)_parallel = m g cos theta$, paparela ao fio e equilibrada pela tensão;
    $ arrow(T) = arrow(P)_parallel arrow.double T = m g cos theta $
  + a componente tangencial $arrow(P)_perp = m g sen theta$, perpendicular ao fio e responsável pela aceleração ao longo da trajetória.


Como o movimento se dá em um arco de raio $l$, descrevemos a dinâmica pelo deslocamento ao longo do arco, $s$, medido a partir do equilíbrio e positivo no sentido anti-horário. Aplicando a 2ª Lei de Newton,

$
  arrow(F)_r = arrow(P)_perp &arrow.double F_r = - m g sen theta\
  &arrow.double m dot.double(s) = - m g sen theta\
  &arrow.double dot.double(s) = - g sen theta
$<eq-d2sdt2>

O sinal negativo aparece visto que a força $arrow(P)_perp$ sempre aponta no sentido oponto ao deslocamento $theta$, o que caracteriza $arrow(P)_perp$ como como uma *força restauradora*. 

Lembrando que o comprimento de arco $s$ está relacionado ao ângulo $theta$ por $s = l theta$, e portanto, $dot.double(s) = l dot.double(theta)$, a equação @eq-d2sdt2 pode ser reescrita como:

$
  dot.double(theta) = - g/l sen theta\
  dot.double(theta) + omega^2 sen theta = 0
$<eq-d2thetadt2>
#par(first-line-indent: (amount: 0em))[
  em que $omega = sqrt(g\/l)$. 
]

A @eq-d2thetadt2 é uma equação diferencial não linear que não possui solução explicita. Entretanto, aplicando a aproximação para pequenos ângulos, temos $sen theta approx theta$, resultado na conhecida equação do oscilador harmônico simples:

$
  dot.double(theta) + omega^2 theta = 0
$<eq-edo-mhs>

Após resolver a @eq-edo-mhs, a solução geral pode ser escrita como (ver #cite(<BoyceDiPrima>, form: "prose")):

$
  theta (t) = A cos (omega t + phi) 
$
#par(first-line-indent: (amount: 0em))[
  em que os parâmetros $A$ e $phi$ dependem das concições iniciais do movimento.
]

Finalmente, para de pequenas amplitudes, o pêndulo simples descreve um movimento periódico, cujo período é dado por:

$
  T = (2 pi)/ omega\
  T = 2 pi sqrt(l/g)
$<eq-periodo>

#section([= Objetivos])

+ Verificar experimentalmente a relação teórica entre o período de oscilação e o comprimento de um pêndulo simples.


#section([= Material Necessário])

- Aparato de pêndulo simples com massa e fio ajustável;
- Cronômetro e Trena.


#section([= Procedimentos])

//#info-box([Atenção], [Conteúdo])

//#section([== Primeira Parte])


+ Ajuste o comprimento do fio para $l = 0,5$ m.
+ Desloque o pêndulo de seu ponto de equlíbrio (aproximadamente 5 cm) e deixe-o oscilar livremente.
+ Meça o tempo $t$ para 10 oscilações completas. Calcule o período experimental $T_("exp")$.
+ Use a @eq-periodo para calcular o período teórico $T$ correspondente ao comprimento de  $l = 0,5$ m. 
+ Registre os valores encontrados na @tab-dados. 
+ Repita os passos acima para o comprimento $l = 0,8$ m.

#figure(
  kind: table,
  caption: [Coleta de dados],
)[
  #table(
    columns: (0.6fr, 0.8fr, 0.8fr, 0.8fr, 1fr),
    table.header([$l$ (m)], [$t$ (s)], [$T_("exp")$ (s)], [$T$ (s)], [$Delta "Err" (%)$]),
    [0,5], [], [], [], [],
    [0,8], [], [], [], [],
    //table.cell(colspan: 2)[*Média*]
  )
]<tab-dados>


#section([= Análise de Resultados])

+ Para cada comprimeto $l$ do fio na @tab-dados, calcule o erro percencual com base na @eq-erro-perc.

  $
    Delta "Err" (%) = abs((T_("exp") - T)/T) times 100 %
  $<eq-erro-perc>

+ Os períodos experimentais obtidos para cada comprimento concordam, dentro da incerteza, com os valores teóricos previstos pela @eq-periodo?

+ Quais limitações experimentais (amplitude inicial, atrito do ar, ponto de suspensão, medição de tempo, etc.) podem ter influenciado os resultados? Comente.

#set heading(numbering: none)
#section([= Referências])

#bibliography("assets/references/references.bib", style: "assets/references/abnt.csl", title:"")
#import "styles.typ": *

#show: setup.with(
  title: [Velocidade de Onda em uma Corda Vibrante],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

#section([= Introdução])

Ondas estacionárias resultam da interferência de duas ondas progressivas idênticas (mesmo comprimento de onda, velocidade e amplitude) que se propagam em sentidos opostos no mesmo meio. Um exemplo comum de como essas condições são satisfeitas é em uma corda esticada: ondas geradas por uma fonte vibrante em uma extremidade são refletidas na outra extremidade, e essa onda refletida, viajando no sentido contrário, interfere com as ondas que ainda estão se aproximando, produzindo o padrão de onda estacionária #cite(<Halliday2>).

Sob condições específicas, uma corda esticada e fixa em ambas as extremidades exibe *modos naturais de vibração* característicos, nos quais as extremidades devem ser sempre *nós* (pontos de amplitude zero). A corda pode vibrar em diferentes números de segmentos: no modo fundamental (um único segmento), o comprimento da corda ($L$) é igual a metade do comprimento de onda ($lambda / 2$); no próximo modo (dois segmentos, com um nó central), $L$ é igual a $lambda$; e assim sucessivamente. De forma geral, o comprimento da corda deve sempre ser um múltiplo inteiro de meio comprimento de onda ($L = n lambda/2$, onde $n = 1, 2, 3, dots$), o que define os comprimentos de onda permitidos para as ondas estacionárias na corda. A @fig:modos-naturais mostra os 3 primeiros modos  naturais para uma corda vibrante de comprimento $L$.

//Conforme #cite(<example-book>, form: "prose"), ...

#figure(
  caption: [Frequências naturais em uma corda vibrante],
  cetz.canvas({
    import cetz.draw: *

      plot.plot(
        size: (5, 4), axis-style: none, name: "plot", 
        {
          for n in range(1, 4) {
            let y0 = 4 * (n - 1)
            plot.add(domain: (0, 2 * calc.pi), style: (stroke: (0.8pt+black)),
              t => (t, calc.sin(n * t/2) - y0)
            )
            plot.add(domain: (0, 2 * calc.pi), style: (stroke: (thickness: 0.6pt, paint: black, dash: "dashed")),
              t => (t, -calc.sin(n * t/2) - y0)
            )

            plot.add-anchor("pt-left-"+str(n), (-0.25, -y0))
            plot.add-anchor("pt-right-"+str(n), (2.1 * calc.pi, -y0))
          }
        } 
      )

      for n in range(1, 4) {
        content("plot.pt-left-"+str(n), [$n =  #n$], anchor: "east")
        if n == 2 {
          content("plot.pt-right-"+str(n), [$L =  lambda$], anchor: "west")
        } else {
          content("plot.pt-right-"+str(n), [$L =  #n/2 lambda$], anchor: "west")
        }
      }

      line((0, 4), (0, -1), stroke: (thickness: 0.5pt, dash: "dashed"))
      line((5, 4), (5, -1), stroke: (thickness: 0.5pt, dash: "dashed"))
      line((0, -.5), (5, -.5), mark: (start: "stealth", end: "stealth"), stroke: 0.8pt, fill: black, name: "line-l")
      content("line-l.mid", [$L$], anchor: "north", padding: 0.1)
  })
)<fig:modos-naturais>
#align(center)[#text(size: 10pt)[Fonte: Labfis (2025)]]

Para qualquer onda com comprimento de onda $lambda$ e frequência $f$, a velocidade de propagação da onda, $v$, é dada por:

$
  v = lambda f
$<eq:vel-lambda-f>

Por outro lado, se a corda tem massa $m$ e comprimento total $l$ e está fujeita a uma força de tensão $F$, a velocidade $v$ de propagação da onda também pode ser determinada pela relação:

$
  v = sqrt(F/mu)
$<eq:vel-tensao-mu>

#par(first-line-indent: 0cm)[
  em que $mu = display(m/l)$ é a _massa específica linear_ da corda.
]

Neste experimento, ondas estacionárias são geradas em uma corda esticada,por meio de vibrações de um gerador de ondas senoidais acionado eletricamente. A disposição do aparelho é mostrada na @fig:kit-ondas. A tensão na corda é igual ao peso das massa suspensa sobre a polia.


#section([= Objetivos])

+ Compreender a relação entre a frequência, o comprimento da corda, a tensão e os diferentes modos de vibração (harmônicos) das ondas estacionárias;
+ Determinar a velocidade de propagação de uma onda estacionária em uma corda vibrante.


#section([= Material Necessário])

#figure(
  caption: [Aparato experimental],
  image("assets/images/equipamento-ondas-pasco.png")
)<fig:kit-ondas>
#align(center)[#text(size: 10pt)[Fonte: Labfis (2025)]]

- Gerador de ondas senoidais (1);
- Gerador de vibrações (2);
- Fio trançado inelástico (3);
- Polia e haste (4);
- Conjunto de massa e suporte (5);
- Trena, balança digital e acessórios.


#v(2cm)

#section([= Procedimentos])

//#info-box([Atenção], [Conteúdo])

#section([== Primeira Parte: Velocidade de onda em função da tensão $F$ e da massa específica $mu$])

#figure(
  kind: table,
  caption: [Coleta de dados da primeira parte],
)[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    table.header([$m$\ (kg)], [$l$\ (m)], [$M$\ (kg)], [$mu$\ (kg/m)], [$F$\ (N)], [$v_("esp")$\ (m/s)]),
    [$$], [], [], [], [], []
    //[2], [], [],
    //table.cell(colspan: 2)[*Média*]
  )
]<tab:dados-1>


+ Com a balança digital, determine a massa $m$ do fio e com a trena, meça o respectivocomprimento $l$. Calcule a massa específica $mu$ da corda.

+ Com a balança digital, determine a massa suspensa pela polia $M$. 

+ Calcule a tensão $F = M\g$ à qual a corda está submetida.

+ Utilize a @eq:vel-tensao-mu para calcular o valor esperado da velocidade ($v_("esp")$) de propagação da onda na corda.



#section([== Segunta Parte: Velocidade de onda na corda vibrante])

#figure(
  kind: table,
  caption: [Coleta de dados da segunta parte],
)[
  #table(
    columns: (1fr, 1fr, 1fr),
    table.header([$lambda$ (m)], [$f$ (Hz)], [$v_("obs")$ (m/s)]),
    [$$], [], []
  )
]<tab:dados-2>

+ Prenda uma extremidade da corda à haste metálica do gerador de vibrações;
+ Na outra extremidade da corda, prenda o suporte com a massa externa $M$ , passando essa extremidade pela polia, conforme mostrado na @fig:kit-ondas.
+ Com a trena, meça a distância $L$ entre o orifício da haste metálica do gerador de vibrações e a polia. Esse valor correspondará ao comprimento de onda $lambda$ a ser anotado na @tab:dados-2.
+ Ligue o gerador de ondas senoidais e ajuste a frequência $f$ de tal modo que o padrão de ondas estacionárias corresponda a 1 (um) comprimento de onda $lambda$. Note que nessa configuração, $lambda = L$.

#info-box([Atenção], [

  #figure(
    cetz.canvas({
      import cetz.draw: *
      content((0,0),
        image("assets/images/gerador-de-ondas.png", width: 5cm)
      )
      line((-2.5, -2.5), (-1.7,-1.4), mark: (end: "stealth"), fill:black, stroke: 2pt, name: "ajuste-grosso")
      content("ajuste-grosso.start", anchor: "north", padding: 0.1, [
        #text(size: 9pt)[#align(center)[Pré-ajuste\ de Frequência\ Passo: 1 Hz]]
      ])
      line((-0.05, -2.5), (-0.05, -1.4), mark: (end: "stealth"), fill: black, stroke: 2pt, name: "ajuste-fino")
      content("ajuste-fino.start", anchor: "north", padding: 0.1, [
        #text(size: 9pt)[#align(center)[Ajuste Fino\ de Frequência\ Passo: 0,1 Hz]]
      ])
      line((2.3, -2.5), (1.5, -1.4), mark: (end: "stealth"), fill: black, stroke: 2pt, name: "ajuste-amplitude")
      content("ajuste-amplitude.start", anchor: "north", padding: 0.1, [
        #text(size: 9pt)[#align(center)[Ajuste de\ Amplitude]]
      ])
    })
  )

])

+ Utilize a @eq:vel-lambda-f para calcular a velocidade de onda observada ($v_("obs")$).




#section([= Análise de Dados])

+ Compare os dois valores de velocidade nos items acima. Utilize a @eq-desvio-perc para calcular o desvio percentual entre os valores obtidos.

$
  Delta D (%) = abs( (v_("obs") - v_("esp")) / (v_("esp"))) times 100 %
$<eq-desvio-perc>

#figure(
  kind: table,
  caption: [Análise de Resultados]
)[
  #table(
    columns: (1fr, 1fr, 1fr),
    table.header([$v_("esp")$ (m/s)], [$v_("obs")$ (m/s)], [$Delta D (%)$]),
    [$$]
  )
]


#set heading(numbering: none)
#section([= Referências])

#bibliography("assets/references/references.bib", style: "assets/references/abnt.csl", title:"")
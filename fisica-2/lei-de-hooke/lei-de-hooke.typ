#import "styles.typ": *

#show: setup.with(
  title: [Lei de Hooke],
  author: [Laboratório de Ensino de Física],
  abbr: [Labfis],
  url: [https://github.com/uftlabfis/uftlabfis]
)

#section([= Introdução])

Considere um mola em *posição de equilíbrio* (comprimento natural), conforme @fig-molas(a). Nessa situação, nenhuma força é aplicada sobre a mola. Quando uma mola é alongada (@fig-molas(b)) ou comprimida (@fig-molas(c)), ela exerce uma *força restauradora*, $arrow(F)$, que sempre aponta para a posição de equilíbrio. 



#let x(t, k: 0) = [
  #if t < -11*calc.pi or t > 0 {
    return 3*k
  }
  #return calc.sin(t) + 3*k
]

#let y(t, k:0) = [
  #let D = (2.5, 1.5, 6)
  #if t < -11*calc.pi {
    return - 1 - 11*calc.pi/2 * (1/D.at(k)) - 1
  } else if t > 0 {
    return 1 + t
  }
  #return calc.cos(t) + t/2 * (1/D.at(k))
]

#figure(
  caption: [Forças aplicadas em uma mola],
  
  cetz.canvas({
    // Importa todas as funções de desenho do módulo cetz.draw.
    import cetz.draw: *

    // --- Bloco de Geração do Gráfico (Plotting) ---
    plot.plot(
      size: (5, 4),           // Define o tamanho da área do gráfico (largura x altura).
      axis-style: none,       // Remove os eixos padrão para um visual mais limpo.
      name: "plot",           // Nomeia o gráfico para referências posteriores.
      {
        // Loop para gerar três curvas (k = 0, 1, 2)
        for k in range(3) {
          
          // 1. Adiciona a Curva Principal (a função x(t, k) e y(t, k) deve estar definida em outro lugar)
          plot.add(
            samples: 500,               // Número de pontos para desenhar a curva.
            style: (stroke: 1pt+black), // Estilo da linha: 1pt de espessura, cor preta.
            domain: (-11*calc.pi - 1, 1), // O domínio do parâmetro 't'.
            t => (x(t, k: k),  y(t, k: k)) // A função parametrizada (assumidamente definida externamente).
          )

          // 2. Adiciona um Segmento de Linha Horizontal Central
          plot.add(
            style: (stroke: 2pt+black), // Estilo da linha: 2pt de espessura, cor preta.
            // Desenha um pequeno segmento horizontal (para demarcar algo na curva).
            // A posição x é deslocada por 3*k.
            ((-1.2 + 3*k, 2), (1.2 + 3*k, 2)) 
          )
          // Âncora para o Rótulo da Etiqueta da figura
          plot.add-anchor("label-"+str(k), (3*k, 2))

          // 3. Adiciona uma Linha tracejada de Referência Horizontal
          plot.add(
            style: (stroke: (dash: "dashed", thickness: 0.6pt, paint: uft-gray)), // Estilo: tracejada, fina, cinza.
            // Desenha uma linha horizontal através de todo o gráfico na altura da curva no início do domínio.
            ((-2.5, y(-11*calc.pi - 1, k:k)), (8.5, y(-11*calc.pi - 1, k:k)))
          )

          // 4. Cria Âncoras para Anotações

          // Âncora para um Círculo (no ponto inicial da curva)
          plot.add-anchor(
            "circ-"+str(k), 
            (x(-11*calc.pi - 1, k:k), y(-11*calc.pi - 1, k:k))
          )

          // Âncora para o Texto da Seta (abaixo do ponto inicial)
          plot.add-anchor(
            "pt-"+str(k), 
            (x(-11*calc.pi - 1, k:k), y(-11*calc.pi - 1, k:k)-3)
          )

          // Âncora para o Rótulo do Nível (na extremidade esquerda da linha tracejada)
          plot.add-anchor(
            "level-"+str(k), 
            (-2.5, y(-11*calc.pi - 1, k:k))
          )
        }
      }
    ) // Fim de plot.plot

    // --- Bloco de Anotações e Detalhes ---

    // Define os rótulos de texto para os níveis (k=0, k=1, k=2)
    let levels = ([$x = 0$], [$x > 0$], [$x < 0$])
    
    // Loop para desenhar círculos e rótulos de nível
    for k in range(3) {
      // Desenha um círculo preenchido sobre o ponto inicial da curva (usando a âncora "circ-k")
      //circle("plot.circ-"+str(k), radius: 0.2, fill: black, stroke: none)
      
      // Adiciona o rótulo do nível na âncora "level-k"
      content(
        "plot.level-"+str(k), 
        [#text(size: 9pt)[#levels.at(k)]], // O texto do rótulo
        anchor: "south-east",              // Posiciona o texto ao sudeste da âncora
        padding: 0.05                      // Um pequeno preenchimento
      )

      // Adicione o texto da etiqueta da figura
      let labels = ("(a)", "(b)", "(c)")
      content(
        "plot.label-"+str(k),
        [#text(size: 10pt)[#labels.at(k)]],
        anchor: "south",
        padding: 0.1
      )
    }

    // Desenha uma seta para a curva k=1 (representando $x > 0$)
    line(
      "plot.pt-1", "plot.circ-1", 
      mark: (end: ">>", fill: uft-yellow),  // Marca de seta dupla no início, preenchida de amarelo.
      stroke: (1.5pt+uft-yellow),             // Linha amarela de 1.5pt.
      name: "ln-1"                            // Nomeia a linha
    )
    // Adiciona o texto ao lado da âncora da seta k=1
    content(
      "plot.pt-1", 
      [#text(size: 9pt)[$arrow(F)$]], 
      anchor: "east", 
      padding: "0.2"
    )

    // Desenha uma seta para a curva k=2 (representando $x < 0$)
    line(
      "plot.pt-2", "plot.circ-2", 
      mark: (start: ">>", fill: uft-yellow),    // Marca de seta dupla no *fim*, preenchida de amarelo.
      stroke: (1.5pt+uft-yellow),             // Linha amarela de 1.5pt.
      name: "ln-2"                            // Nomeia a linha
    )
    // Adiciona o texto ao lado da âncora da seta k=2
    content(
      "plot.pt-2", 
      [$arrow(F)$], 
      anchor: "east", 
      padding: "0.2"
    )


    
  }) // Fim de cetz.canvas
)<fig-molas>

Experimentos mostram que, para deformações pequenas, o módulo dessa força é proporcional ao quanto a mola foi esticada ou comprimida em relação ao seu comprimento natural. Essa relação linear é expressa pela Lei de Hooke @Halliday2:

$
  arrow(F) = - k arrow(x),
$<eq-hooke>
#par(first-line-indent: (amount: 0em))[
  em que $x$
]

#section([= Objetivos])

+ Determinar ...
+ Compreender ...


#section([= Material Necessário])

#figure(
  image("assets/images/equipamento.png", width: 35%),
  caption: [Aparato experimental]
)<fig-aparato>

- Paquímetro;
- Cronômetro;
- Trilho de ar.


#section([= Procedimentos])

#info-box([Atenção], [Conteúdo])

#section([== Primeira Parte])


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
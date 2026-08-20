#import "@preview/cetz:0.4.0" // Desenho vetorial

#set page(
  header: none,
  footer: none,
  margin: (x: 10mm, y: 10mm)
)

#table(
  columns: (1fr, 1fr, 0.5fr, 1fr, 1fr, 1fr, 0.5fr, 1fr),
  [Curso], table.cell(colspan: 7)[],
  [Disciplina], table.cell(colspan: 3)[], [Professor], table.cell(colspan: 3)[],
  [Tema], table.cell(colspan: 5)[], [Data], [],
  [Aluno], table.cell(colspan: 3)[], [Aluno], table.cell(colspan: 3)[],
  [Aluno], table.cell(colspan: 3)[], [Aluno], table.cell(colspan: 3)[],
  [Aluno], table.cell(colspan: 3)[], [Aluno], table.cell(colspan: 3)[],
)

#let X = 180
#let Y = 220
\ 
#align(
  center,
  cetz.canvas(length: 1mm, {
    import cetz.draw: *

    for i in range(X+1) {
      line((i, 0), (i, Y), stroke: gray+0.8pt)
    }

    for j in range(Y+1) {
    line((0, j), (X, j), stroke: gray+0.8pt)
    }

    for i in range(X+1) {
      if calc.rem(i, 50) == 0 {
        line((i, -1.5), (i, Y+1.5), stroke: black+0.8pt)
      } else if  calc.rem(i, 10) == 0 {
        line((i, 0), (i, Y), stroke: black+0.8pt)
      }
    }

    for j in range(Y+1) {
      if calc.rem(j, 50) == 0 {
        line((-1.5, j), (X+1.5, j), stroke: black+0.8pt)
      } else if calc.rem(j, 10) == 0 {
        line((0, j), (X, j), stroke: black+0.8pt)
      } 
    }
  })
)
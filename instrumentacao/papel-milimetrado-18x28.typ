#import "@preview/cetz:0.4.0" // Desenho vetorial

#set page(
  header: none,
  footer: none,
  margin: (x: 15mm, y: 7mm)

)


#align(
  cetz.canvas(length: 1mm, {
    import cetz.draw: *

    for i in range(181) {
      line((i, 0), (i, 280), stroke: gray+0.8pt)
    }

    for j in range(281) {
    line((0, j), (180, j), stroke: gray+0.8pt)
    }

    for i in range(181) {
      if calc.rem(i, 50) == 0 {
        line((i, -1.5), (i, 281.5), stroke: black+0.9pt)
      } else if  calc.rem(i, 10) == 0 {
        line((i, 0), (i, 280), stroke: black+0.9pt)
      }
    }

    for j in range(281) {
      if calc.rem(j, 50) == 0 {
        line((-1.5, j), (180, j), stroke: black+0.9pt)
      } else if calc.rem(j, 10) == 0 {
        line((0, j), (180, j), stroke: black+0.9pt)
      } 
    }
  })
)
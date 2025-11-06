// Bibliotecas importadas
#import "@preview/cetz:0.4.0" // Desenho vetorial
#import "@preview/subpar:0.2.2" //Subfiguras

// 🎨 Definição de Cores
#let uft-green = rgb("#008577")
#let uft-blue = rgb("#004A80")
#let uft-yellow = rgb("#FDB913")
#let uft-gray = rgb("#666666")
#let primary-color = uft-blue
#let secondary-color = uft-green

// 🏛️ Título principal
#let main-title(title, author) = {
  rect(height: 1.5pt, fill: primary-color, width: 100%)
  grid(
    columns: (8fr, 2fr),
    align: (right+horizon, right),
    [
      UNIVERSIDADE FEDERAL DO *TOCANTINS*\
      Câmpus Universitário de *Palmas* \
      #author
    ],
    [
      #image("assets/images/uftlabfis-logo.png", width: 2.5cm)
    ]
  )
  rect(height: 1.5pt, fill: primary-color, width: 100%)
  v(0.5cm)
  block(below: 0.2em, fill: primary-color, inset: 3pt, width: 100%, height: 1cm)[
    #align(center+horizon)[
      #upper(text(weight: "semibold", fill: white, size: 16pt)[#title])
    ]
  ]
  v(0.5cm)
}

// 📚 Títulos de seções
#let section(title) = context {
  let headings = counter(heading).get()
  if headings.at(0) > 1 {
    v(0.5cm)
  }

  set par(first-line-indent: 0pt)
  set text(weight: "semibold", fill: primary-color, size: 12pt)

  [#upper(title)] 

  context {
    if counter(heading).get().len() == 1 {
      rect(height: 1pt, fill: primary-color, width: 100%)
    } else {
      v(0.25cm)
    }
  } 
}

// 📦 Caixa de destaque (ex: definições)
#let info-box(title, content) = {
  set text(size: 10pt)
  block(
    fill: primary-color.transparentize(80%), inset: 8pt, radius: 2pt, width: 100%,
    stroke: (left: (thickness: 4pt, paint: primary-color))
  )[
    #set align(center)
    #text(fill: primary-color, weight: "semibold", size: 10pt)[*#title*]
    
    #content
  ]
}

// ⚙️ Função setup — configurações do documento
#let setup(
  title: none,
  author: none,
  abbr: none,
  url: none,
  body
) = {
  // 📄 Configuração da página
  set page(
    paper: "a4", 
    margin: (
      top: 3cm, bottom: 2cm, left: 1cm, right: 1cm
    ),
    columns: 2, 
    numbering: "1",
    // 🔝 Cabeçalho condicional
    header: context{
      let current-page =  counter(page).get().at(0)
      if current-page > 1 {
        set par(first-line-indent: 0pt)
        set text(size: 10pt)
        set align(left)
        if calc.odd(current-page){
          [#title] 
          h(1fr)
          counter(page).display("1")
        } else {
          counter(page).display("1")
          h(1fr)
          [#author/UFT]
        }
        box( height: 1pt, fill: primary-color, width: 100%)
      }
    },
    // 🔚 Rodapé com link
    footer: context {
      let current-page =  counter(page).get().at(0)
      set text(size: 10pt)
      set par(first-line-indent: 0pt)
      box(height: 1pt, fill: primary-color, width: 100%)
        set text(fill: secondary-color)
        if calc.odd(current-page){
          set align(right)
          link("www.github.com")[#url]
        } else {
          set align(left)
          link("www.github.com")[#url]
        }
    }
  )
  // ✍️ Estilo de texto e parágrafo
  set text(lang: "pt", size: 12pt,  font: "Times New Roman")

  set par(
    first-line-indent: (
      all: true, amount: 1.25cm
    ),
    justify: true
  )

  // ∑ Equações numeradas
  set math.equation(numbering: "(1)", number-align: bottom)

  // 🧭 Numeração de seções e listas
  set heading(numbering: "1.1.")
  show heading: set text(size: 12pt, fill: primary-color)
  set list(marker: text(primary-color)[-])
  set enum(
    numbering: it => context {
      let headings = counter(heading).get()
      let sec = headings.at(0)
      if headings.len() > 1 {
        let subsec = headings.at(1)
        strong(text(primary-color)[#sec.#subsec.#it.])
      } else {
        strong(text(primary-color)[#sec.#it.])
      }
  })


  // 🖼️ Figuras e tabelas
  set figure.caption(position: top)
  show figure.caption: set text(size: 10pt)

  set table(
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
  show table: set text(size: 10pt)
  show table.cell.where(y: 0): strong

  
  //📌 Coloca o título no topo da primeira página
  place(
    top+center,
    float: true,
    scope: "parent"
  )[
    #main-title(title, author)
  ]

  // 🧾 Corpo do documento
  body
}


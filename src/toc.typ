// Table of contents functions for INVICTA thesis

// Helper function for table of contents
#let make-toc(
  title: auto,
  figures-title: auto,
  tables-title: auto,
) = {
  context {
    let lang = text.lang
    let actual-title = if title != auto {
      title
    } else if lang == "pt" {
      [Índice]
    } else {
      [Table of Contents]
    }

    let actual-figures-title = if figures-title != auto {
      figures-title
    } else if lang == "pt" {
      [Índice de Figuras]
    } else {
      [List of Figures]
    }

    let actual-tables-title = if tables-title != auto {
      tables-title
    } else if lang == "pt" {
      [Índice de Tabelas]
    } else {
      [List of Tables]
    }

    outline(
      title: actual-title,
      depth: 3,
      target: selector(heading).after(<main-content>),
    )
    
    pagebreak()
    
    let has-figures = query(figure.where(kind: image).after(<main-content>)).len() > 0
    if has-figures {
      outline(
        title: actual-figures-title,
        target: selector(figure.where(kind: image)).after(<main-content>),
      )
      pagebreak()
    }
    
    let has-tables = query(figure.where(kind: table).after(<main-content>)).len() > 0
    if has-tables {
      outline(
        title: actual-tables-title,
        target: selector(figure.where(kind: table)).after(<main-content>),
      )
      pagebreak()
    }
  }
}


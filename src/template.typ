// UPS THESIS TEMPLATE
// Main template function and document setup

#import "covers.typ": make-committee-page, make-cover
#import "toc.typ": make-toc
#import "utils.typ": set-config

// Main template function
#let ups-thesis(
  // Document metadata
  title: "<DISSERTATION-TITLE>",
  author: "<FULL-NAME>",
  degree: "<DEGREE>",
  school: "<SCHOOL NAME>",
  document-type: "Dissertação",
  supervisor: "<SUPERVISOR>",
  second-supervisor: none,
  // Dates and copyright
  thesis-date: none, // If none, current date will be used
  copyright-notice: none,
  // Visual elements
  logo: none,
  header-logo: "/src/UPSHeader.png",
  additional-front-text: none,
  // Committee information
  committee-text: none, // Put text if final version
  committee-members: (),
  signature: false, // true if handwritten signature
  dedication-text: none, // Optional dedication
  // Configuration options
  stage: none, // none, "jury", "final"
  language: "en", // "en", "pt"
  on-paper: false, // if true, links are not shown (for paper versions)
  // Document body
  body,
) = {
  // Create configuration object
  let config = (
    title: title,
    author: author,
    degree: degree,
    school: school,
    document-type: document-type,
    supervisor: supervisor,
    second-supervisor: second-supervisor,
    thesis-date: thesis-date,
    copyright-notice: copyright-notice,
    logo: logo,
    header-logo: header-logo,
    additional-front-text: additional-front-text,
    committee-text: committee-text,
    committee-members: committee-members,
    signature: signature,
    stage: stage,
    language: language,
    on-paper: on-paper,
  )

  // Document setup
  set document(
    title: title,
    author: author,
    date: datetime.today(),
  )

  // Page setup
  set page(
    paper: "a4",
    margin: (
      top: 3.5cm,
      bottom: 2cm,
      left: 3cm,
      right: 2cm,
    ),
    numbering: "1",
    number-align: top + right,
  )

  // Text formatting
  set text(
    size: 11pt,
    lang: language,
    font: ("Arial", "Helvetica", "sans-serif"),
  )

  // Paragraph formatting
  set par(
    justify: true,
    leading: 0.8em,
    first-line-indent: (amount: 1.5em, all: false),
    spacing: 1.2em,
  )

  set heading(numbering: "1.1")

  // Heading formatting
  show heading: it => [

    #let heading_size = if it.level == 1 {
      22pt
    } else if it.level == 2 {
      18pt
    } else if it.level == 3 {
      15pt
    } else {
      14pt
    }

    #if it.level > 1 {
      v(1em)
      block(
        text(counter(heading).display() + h(0.4cm) + it.body, size: heading_size)
      )
      v(1em)
    } else {
      pagebreak(weak: true)
      v(6.3em)
      if it.numbering != none {
        let chapter_num = counter(heading).get().first()

        // Check if this is an appendix by looking at the numbering pattern
        if it.numbering == "A.1" {
          // Convert number to letter (1=A, 2=B, etc.)
          let appendix_letter = str.from-unicode(65 + chapter_num - 1) // 65 is ASCII for 'A'
          block(
            text(size: 24pt, weight: "bold", [Appendix #appendix_letter #h(0.4cm) #it.body]),
          )
        } else {
          block(
            text(size: 24pt, weight: "bold", [#chapter_num #h(0.4cm) #it.body]),
          )
        }
      } else {
        block(
          text(size: 24pt, weight: "bold", it.body),
        )
      }
      v(2em)
    }
    
  ]

  // Figure and table formatting
  set figure(
    gap: 1em,
  )

  set table(
    stroke: 0.5pt,
    fill: (x, y) => if y == 0 { gray.lighten(80%) },
  )

  // Link formatting
  show link: it => text(
    fill: if on-paper { blue } else { black },
    it,
  )

  // Generate the document
  // Main document structure
  make-cover(config)

  // Preliminary materials
  make-committee-page(config)

  // Store config temporarily for main-content access
  set-config(config)

  // Set the UPS header for all subsequent pages
  set page(
    header: context {
      let h-logo = config.at("header-logo", default: "/src/UPSHeader.png")
      if h-logo != none {
        image(h-logo, height: 1.12cm)
      }
    },
    header-ascent: 30%,
  )

  body
}

// Function to set up main content with headers and page numbering
#let main-content(config, body) = {
  set par.line(numbering: n => if config.stage == "jury" and calc.rem(n, 2) == 0 { n })

  // Disable default numbering on the page config, rely on footer
  set page(
    numbering: none,
    footer: context {
      let page-number = counter(page).at(here()).first()
      align(center)[#text(size: 11pt)[#page-number]]
    },
  )
  counter(page).update(1)
  body
}

# UPS Template User Guide

This document describes how to use and change the Typst template for Universidade Politécnica de Santarém (UPS).

---

## 1. Directory Structure

The repository contains two primary directories:
- `template/`: Contains all user content, chapters, images, and references.
- `src/`: Contains the template engine, layout configuration, and graphics. Do not change these files unless you must modify the base style.

```text
TemplateUPS/
├── README.md               # General information and compilation commands
├── DOC.md                  # This document
├── typst.toml              # Typst package manifest
├── src/                    # Template engine and UPS styles
│   ├── covers.typ          # Layout for cover and committee pages
│   ├── lib.typ             # Public exports for template functions
│   ├── template.typ        # Configuration for pages, margins, and headings
│   ├── toc.typ             # Logic for tables of contents and lists
│   ├── utils.typ           # Helper functions for code, algorithms, and acronyms
│   ├── UPS.png             # Primary UPS logo
│   └── UPSHeader.png       # Header logo
└── template/               # User content directory
    ├── main.typ            # Main document file
    ├── refs.bib            # BibTeX file for references
    ├── prologue/           # Front matter documents
    │   ├── acknowns.typ    # Acknowledgments
    │   ├── resumo.typ      # Portuguese abstract and keywords
    │   ├── abstract.typ    # English abstract and keywords
    │   └── unsdg.typ       # UN Sustainable Development Goals (optional)
    ├── chapters/           # Thesis chapters
    │   ├── chapter-template.typ        # Template for new chapters
    │   ├── 1-introduction.typ          # Introduction chapter
    │   ├── 2-literature-review.typ     # Literature review chapter
    │   ├── 3-theoretical-foundations.typ
    │   ├── 4-methodology.typ           # Methodology chapter
    │   ├── 5-result-and-analysis.typ   # Results and analysis chapter
    │   └── 6-conclusions-and-future-work.typ # Conclusion chapter
    ├── figures/            # Images and diagrams
    └── appendixes/         # Document appendixes
        ├── A-implementation-details.typ
        └── B-additional-results.typ
```

---

## 2. Main File: `template/main.typ`

The file `template/main.typ` controls the full document. It sets the document metadata, controls front matter sections, and includes chapters.

### 2.1 Document Metadata

Open `template/main.typ`. Set your metadata in the `#show: ups.template.with(...)` block:

```typst
#show: ups.template.with(
  // Document data
  title: "Your Dissertation Title",
  author: "Your Full Name",
  degree: "Your Course Name",
  school: "Escola Superior de Tecnologia e Gestão",
  document-type: "Dissertação",
  logo: "/src/UPS.png",
  header-logo: "/src/UPSHeader.png",
  supervisor: "Supervisor Name",
  second-supervisor: "Co-supervisor Name", // Set to none if you do not have one

  // Dates and copyright
  thesis-date: none,                       // If none, the template uses current date
  copyright-notice: "Your Name, 2025",

  // Examination committee data (for final version)
  committee-text: "Approved in oral examination by the committee:",
  committee-members: (
    (role: "President", name: "Prof. Committee President Name"),
    (role: "Referee", name: "Prof. Committee Member Name"),
    (role: "Referee", name: "Prof. Supervisor Name"),
  ),
  signature: false,                        // Set to true to show signature line

  // Configuration options
  stage: none,     // Options: none, "jury" (adds watermark and line numbers), "final"
  language: "pt",  // Set to "pt" (Portuguese) or "en" (English)
  on-paper: false, // Set to true to print on paper (removes link colors)
)
```

---

## 3. How to Edit Document Sections

### 3.1 Cover Page and Title Page
Do not edit code in `src/covers.typ`. Set your data in `template/main.typ`. The template builds the cover page and the committee page automatically.

### 3.2 Dedication
1. Open `template/main.typ`.
2. Find the `#ups.dedication(...)` call:
   ```typst
   #ups.dedication(
     text("Your dedication text here.", hyphenate: false),
   )
   ```
3. If you do not want a dedication, delete or comment out this call.

### 3.3 Acknowledgments
1. Open `template/prologue/acknowns.typ`.
2. Write your acknowledgment text.
3. Save the file.

### 3.4 List of Acronyms
1. Open `template/main.typ`.
2. Find the `#ups.acronym-list(...)` call.
3. Add or change your acronyms in the list:
   ```typst
   #ups.acronym-list((
     ("AI", "Artificial Intelligence"),
     ("API", "Application Programming Interface"),
     ("UPS", "Universidade Politécnica de Santarém"),
   ))
   ```

### 3.5 Resumo and Abstract
- Edit `template/prologue/resumo.typ` to write the Portuguese summary and keywords.
- Edit `template/prologue/abstract.typ` to write the English summary and keywords.

### 3.6 Tables of Contents and Lists
The template calls `#ups.table-of-contents()` in `template/main.typ`.
- The template creates the Table of Contents automatically.
- The template creates the List of Figures if the document contains figures.
- The template creates the List of Tables if the document contains tables.
- All titles adapt to the configured language (`"pt"` or `"en"`).

---

## 4. Chapters

### 4.1 Chapter Files
The `template/chapters/` directory contains all chapters:
- `1-introduction.typ`
- `2-literature-review.typ`
- `3-theoretical-foundations.typ`
- `4-methodology.typ`
- `5-result-and-analysis.typ`
- `6-conclusions-and-future-work.typ`

### 4.2 How to Add a New Chapter
1. Copy `template/chapters/chapter-template.typ` to create a new file (example: `template/chapters/7-discussion.typ`).
2. Open `template/main.typ`.
3. Add the `#include` statement in the chapters area:
   ```typst
   #include "chapters/1-introduction.typ"
   #include "chapters/2-literature-review.typ"
   // ...
   #include "chapters/7-discussion.typ"
   ```

### 4.3 Chapter Heading Syntax
Use standard Typst headings in each chapter file:
```typst
#heading(level: 1)[Chapter Title] // Or use: = Chapter Title

Write your introduction text here.

== Section Title
Write your section text here.

=== Subsection Title
Write your subsection text here.
```

---

## 5. Figures and Images

### 5.1 Add an Image File
Put your image files (PNG, JPG, or SVG) in the `template/figures/` directory.

### 5.2 Insert a Figure
Insert a figure with the `#figure` function:
```typst
#figure(
  image("../figures/system-architecture.png", width: 80%),
  caption: [Architecture of the proposed system.],
) <fig:architecture>
```

### 5.3 Reference a Figure
Reference the figure label in your text:
```typst
As shown in @fig:architecture, the pipeline has three stages.
```

---

## 6. Tables

Use the `#figure` function with the `table` kind:
```typst
#figure(
  table(
    columns: (auto, 1fr, 1fr),
    [Metric], [Model A], [Model B],
    [Accuracy], [94.2%], [97.5%],
    [F1-Score], [93.1%], [96.8%],
  ),
  caption: [Performance comparison between models.],
) <tab:results>
```

Reference the table in your text:
```typst
The results are shown in @tab:results.
```

---

## 7. Bibliography and Citations

### 7.1 Add References
1. Open `template/refs.bib`.
2. Add your reference in standard BibTeX format:
   ```bibtex
   @article{vaswani2017attention,
     title={Attention is all you need},
     author={Vaswani, Ashish and others},
     journal={Advances in Neural Information Processing Systems},
     year={2017}
   }
   ```

### 7.2 Cite References in Text
- To cite a reference, use `@` with the BibTeX key:
  ```typst
  Recent studies show good results @vaswani2017attention.
  ```
- To cite a specific page:
  ```typst
  According to @vaswani2017attention[p. 15], self-attention improves results.
  ```

### 7.3 Change Bibliography Style
Open `template/main.typ`. Set the style in the `#ups.make-bibliography(...)` call:
```typst
#ups.make-bibliography("elsevier-vancouver")
```
Supported styles include:
- `"ieee"`
- `"apa"`
- `"elsevier-vancouver"`
- `"springer-vancouver"`
- `"chicago-author-date"`

---

## 8. Appendixes

### 8.1 Location of Appendix Files
Appendix files are located in `template/appendixes/`.

### 8.2 Add an Appendix
1. Create a new file in `template/appendixes/` (example: `C-extra-data.typ`).
2. Open `template/main.typ`.
3. Add the `#include` statement after the appendix heading setup:
   ```typst
   #set heading(numbering: "A.1", level: 1)
   #counter(heading).update(0)

   #include "appendixes/A-implementation-details.typ"
   #include "appendixes/B-additional-results.typ"
   #include "appendixes/C-extra-data.typ"
   ```
The template numbers appendixes with letters (Appendix A, Appendix B, Appendix C) automatically.

---

## 9. Special Helper Functions (`#ups....`)

The template provides custom helper functions:

| Function | Example | Description |
| :--- | :--- | :--- |
| **Code Block** | `#ups.code-block(```python\nprint("Hello")\n```, caption: "Script")` | Shows a formatted box for source code listings |
| **Algorithm** | `#ups.algorithm("Binary Search")[1. Start... 2. Compare...]` | Shows formatted pseudocode for algorithms |
| **Epigraph** | `#ups.epigraph("I think, therefore I am.", "Descartes")` | Shows a quote aligned to the right |
| **Glossary Entry** | `#ups.glossary-entry("Overfitting", "Model memorizes training data.")` | Formats a glossary term and its definition |
| **Notation List** | `#ups.notation-list(( "theta": "Model parameters" ))` | Formats a list of mathematical symbols |

---

## 10. Modifications in the `src/` Directory

Do not edit files in `src/` unless you must modify the core layout:
- `src/covers.typ`: Controls layout of the front cover and the committee page.
- `src/template.typ`: Controls page geometry, margins, paragraph indentations, and fonts.
- `src/UPS.png` and `src/UPSHeader.png`: Official institutional graphics.

---

## 11. How to Compile the Document

### Method 1: VS Code (Recommended)
1. Install the **Tinymist Typst** extension in VS Code.
2. Open `template/main.typ`.
3. Click the **Typst: Preview** button in the top right corner.
4. The extension shows a live preview of the PDF.

### Method 2: Command Line Interface (CLI)
Open a terminal in the root directory of the repository (`TemplateUPS`). Run the following command:

```bash
# Compile once to generate the PDF file:
typst compile template/main.typ --root .

# Recompile automatically when files change:
typst watch template/main.typ --root .
```

> **NOTE:** You must include the `--root .` option. The compiler requires this option to find files in the `src/` directory. The generated file is saved at `template/main.pdf`.

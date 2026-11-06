# UPS Template User Guide

This document describes how to use and change the Typst template for Universidade Politécnica de Santarém (UPS).

---

## 1. Quick Start: Repository Setup and Dependencies

Follow these steps to create your personal thesis repository, pull the template files, install the required dependencies, and build your document.

Template repository URL: `https://github.com/tomasvieira121/typst_UPS.git`

---

### 1.1 Step 1: Create Your Personal Repository
You should keep your thesis in your own personal Git repository on GitHub (or another Git host) to save your work, version control changes, and back it up safely.

#### Option A: Via GitHub Web (Easiest)
1. Sign in to your [GitHub account](https://github.com).
2. Click **+** in the top-right corner and select **New repository**.
3. Name your repository (e.g. `minha-dissertacao` or `my-thesis`).
4. Set the visibility to **Private** (recommended while writing your dissertation) or **Public**.
5. **Important:** Leave "Add a README file", ".gitignore", and "Choose a license" **unchecked** to create an empty repository.
6. Click **Create repository** and copy your repository URL (e.g., `https://github.com/<YOUR-USERNAME>/my-thesis.git`).

#### Option B: Via VS Code Source Control (GUI)
You can create and publish your repository directly inside VS Code without using the browser:
1. Open your thesis folder in VS Code (`File` > `Open Folder...`).
2. Open the **Source Control** view (`Ctrl+Shift+G` on Windows/Linux or `Cmd+Shift+G` on macOS).
3. If the folder is not yet a git repository, click **Initialize Repository**.
4. Click the blue **"Publish to GitHub"** button (or click the `...` menu > **Branch** > **Publish Branch**).
5. Sign in to your GitHub account if prompted by VS Code.
6. Select **"Publish to GitHub private repository"** (recommended for your thesis) or public repository.
7. VS Code will automatically create the repository on GitHub, configure the remote `origin`, and push your files.

#### Option C: Via Git Command Line
```bash
# Create and initialize a local folder
mkdir my-thesis
cd my-thesis
git init -b main
```

---

### 1.2 Step 2: Get the Template Files

You can bring the template files into your project using one of the following approaches:

#### Method A: Clone the Template & Switch Remote to Your Repo (Recommended)
This is the simplest and most foolproof method. You clone the template, rename its remote to `upstream`, and set your own repository as `origin`:

```bash
# 1. Clone the template into your project directory
git clone https://github.com/tomasvieira121/typst_UPS.git my-thesis
cd my-thesis

# 2. Rename the template remote so you can pull future template updates
git remote rename origin upstream

# 3. Add your personal repository as 'origin'
git remote add origin https://github.com/<YOUR-USERNAME>/my-thesis.git

# 4. Push everything to your personal repository
git push -u origin main
```

#### Method B: Pull / Merge into an Empty Repository (Git Remote + Pull)
If you already created an empty repository locally or on GitHub:

```bash
# Inside your empty project folder (my-thesis):
# 1. Add the template repository as a remote
git remote add upstream https://github.com/tomasvieira121/typst_UPS.git

# 2. Pull and merge the template files into your main branch
git pull upstream main --allow-unrelated-histories

# 3. Add your personal GitHub repository as origin (if not done yet)
git remote add origin https://github.com/<YOUR-USERNAME>/my-thesis.git

# 4. Push to your personal repository
git push -u origin main
```

> [!TIP]
> **How to sync future template updates:**
> If the template is updated with new fixes or styles in the future, you can pull them into your thesis at any time:
> ```bash
> git fetch upstream
> git merge upstream/main
> ```

---

### 1.3 Step 3: Install Dependencies to Build the Document

Typst does not require heavy LaTeX distributions (such as TeX Live or MiKTeX). All you need is Typst itself, which can be used in three ways:

#### Option A: VS Code + Tinymist Typst Extension (Recommended)
This option provides real-time side-by-side PDF preview as you type, autocomplete, and syntax highlighting.

1. Install [Visual Studio Code](https://code.visualstudio.com/).
2. Open the **Extensions** panel (`Ctrl+Shift+X` on Windows/Linux or `Cmd+Shift+X` on macOS).
3. Search for **Tinymist Typst** (by *Myriad-Dreamin*) and click **Install**.
   - *Note: Tinymist includes the Typst compiler bundled in the extension. No additional command-line tool is required.*
4. In VS Code, open the repository folder (`File` > `Open Folder...`).
5. Open `template/main.typ`.
6. Click the **"Typst: Preview"** button in the top-right editor bar (or press `Ctrl+K, V`).
7. A live preview will open next to your code. Every save automatically compiles the document to `template/main.pdf`.

#### Option B: Standalone Typst CLI (Command Line)
If you prefer compiling via terminal or running automated scripts (e.g., GitHub Actions):

- **Windows**:
  ```powershell
  winget install --id Typst.Typst
  # Alternatively with Scoop: scoop install typst
  # Alternatively with Chocolatey: choco install typst
  ```
- **macOS**:
  ```bash
  brew install typst
  ```
- **Linux**:
  ```bash
  # Arch Linux:
  sudo pacman -S typst
  # Fedora:
  sudo dnf install typst
  # Via Cargo (Rust):
  cargo install --locked typst-cli
  ```
- **Direct Binary Download (Any OS)**:
  Download the latest standalone executable from [Typst GitHub Releases](https://github.com/typst/typst/releases) and place it in your system `PATH`.

**Compiling with Typst CLI:**
Run from the root directory of your project:
```bash
# Compile once to generate template/main.pdf:
typst compile template/main.typ --root .

# Or run in watch mode (auto-recompiles whenever you save a file):
typst watch template/main.typ --root .
```

> [!IMPORTANT]
> Always pass `--root .` when using `typst compile` or `typst watch`. The template uses root-relative paths (e.g. `/src/lib.typ`), which require the root flag to locate assets and libraries correctly.

#### Option C: Typst Web App (No Local Installation)
If you prefer not to install anything on your machine:
1. Open [typst.app](https://typst.app/) and create an account.
2. Create a new empty project.
3. Upload the repository contents (the `src/` and `template/` folders).
4. Open `template/main.typ` to write and export your PDF directly from your browser.

---

## 2. Directory Structure

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

## 3. Main File: `template/main.typ`

The file `template/main.typ` controls the full document. It sets the document metadata, controls front matter sections, and includes chapters.

### 3.1 Document Metadata

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

## 4. How to Edit Document Sections

### 4.1 Cover Page and Title Page
Do not edit code in `src/covers.typ`. Set your data in `template/main.typ`. The template builds the cover page and the committee page automatically.

### 4.2 Dedication
1. Open `template/main.typ`.
2. Find the `#ups.dedication(...)` call:
   ```typst
   #ups.dedication(
     text("Your dedication text here.", hyphenate: false),
   )
   ```
3. If you do not want a dedication, delete or comment out this call.

### 4.3 Acknowledgments
1. Open `template/prologue/acknowns.typ`.
2. Write your acknowledgment text.
3. Save the file.

### 4.4 List of Acronyms
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

### 4.5 Resumo and Abstract
- Edit `template/prologue/resumo.typ` to write the Portuguese summary and keywords.
- Edit `template/prologue/abstract.typ` to write the English summary and keywords.

### 4.6 Tables of Contents and Lists
The template calls `#ups.table-of-contents()` in `template/main.typ`.
- The template creates the Table of Contents automatically.
- The template creates the List of Figures if the document contains figures.
- The template creates the List of Tables if the document contains tables.
- All titles adapt to the configured language (`"pt"` or `"en"`).

---

## 5. Chapters

### 5.1 Chapter Files
The `template/chapters/` directory contains all chapters:
- `1-introduction.typ`
- `2-literature-review.typ`
- `3-theoretical-foundations.typ`
- `4-methodology.typ`
- `5-result-and-analysis.typ`
- `6-conclusions-and-future-work.typ`

### 5.2 How to Add a New Chapter
1. Copy `template/chapters/chapter-template.typ` to create a new file (example: `template/chapters/7-discussion.typ`).
2. Open `template/main.typ`.
3. Add the `#include` statement in the chapters area:
   ```typst
   #include "chapters/1-introduction.typ"
   #include "chapters/2-literature-review.typ"
   // ...
   #include "chapters/7-discussion.typ"
   ```

### 5.3 Chapter Heading Syntax
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

## 6. Figures and Images

### 6.1 Add an Image File
Put your image files (PNG, JPG, or SVG) in the `template/figures/` directory.

### 6.2 Insert a Figure
Insert a figure with the `#figure` function:
```typst
#figure(
  image("../figures/system-architecture.png", width: 80%),
  caption: [Architecture of the proposed system.],
) <fig:architecture>
```

### 6.3 Reference a Figure
Reference the figure label in your text:
```typst
As shown in @fig:architecture, the pipeline has three stages.
```

---

## 7. Tables

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

## 8. Bibliography and Citations

### 8.1 Add References
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

### 8.2 Cite References in Text
- To cite a reference, use `@` with the BibTeX key:
  ```typst
  Recent studies show good results @vaswani2017attention.
  ```
- To cite a specific page:
  ```typst
  According to @vaswani2017attention[p. 15], self-attention improves results.
  ```

### 8.3 Change Bibliography Style
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

## 9. Appendixes

### 9.1 Location of Appendix Files
Appendix files are located in `template/appendixes/`.

### 9.2 Add an Appendix
1. Create a new file in `template/appendixes/` (example: `C-extra-data.typ`).
2. Open `template/main.typ`.
3. Add the `#include` statement after the appendix heading setup:
   ```typst
   #set heading(numbering: "A.1")
   #counter(heading).update(0)

   #include "appendixes/A-implementation-details.typ"
   #include "appendixes/B-additional-results.typ"
   #include "appendixes/C-extra-data.typ"
   ```
The template numbers appendixes with letters (Appendix A, Appendix B, Appendix C) automatically.

### 9.3 Formatting Guidelines for Tables and Code in Appendixes
When building appendixes with wide tables or extensive code snippets:
1. **Table Font Size**: Add `#show figure.where(kind: table): set text(size: 9.5pt)` at the top of the appendix file to fit dense tabular data cleanly.
2. **Column Proportions and Alignment**: Use fractional widths (`fr`) and cell-level alignment functions:
   ```typst
   table(
     columns: (2.2fr, 1.1fr, 1.3fr, 3.8fr),
     align: (col, row) => if row == 0 { center + horizon } else if col == 1 or col == 2 { center + horizon } else { left + horizon },
     ...
   )
   ```
3. **Long Monospaced Identifiers**: Break long identifier names across lines to prevent overflowing into adjacent cells (e.g. `[`classification.` \ `confidence`]`).
4. **Typst Math Notation**: Use standard dot notation for decimals in math mode (e.g. `$>= 0.60$`, not LaTeX `$>= 0{,}60$`).
5. **Multi-page Code Listings**: `#ups.code-block()` is configured with `breakable: true` and compact font sizing (`8pt`, `0.5em` leading) to flow across page breaks without clipping.

---

## 10. Special Helper Functions (`#ups....`)

The template provides custom helper functions:

| Function | Example | Description |
| :--- | :--- | :--- |
| **Code Block** | `#ups.code-block(```python\nprint("Hello")\n```, caption: "Script")` | Shows a formatted box for source code listings |
| **Algorithm** | `#ups.algorithm("Binary Search")[1. Start... 2. Compare...]` | Shows formatted pseudocode for algorithms |
| **Epigraph** | `#ups.epigraph("I think, therefore I am.", "Descartes")` | Shows a quote aligned to the right |
| **Glossary Entry** | `#ups.glossary-entry("Overfitting", "Model memorizes training data.")` | Formats a glossary term and its definition |
| **Notation List** | `#ups.notation-list(( "theta": "Model parameters" ))` | Formats a list of mathematical symbols |

---

## 11. Modifications in the `src/` Directory

Do not edit files in `src/` unless you must modify the core layout:
- `src/covers.typ`: Controls layout of the front cover and the committee page.
- `src/template.typ`: Controls page geometry, margins, paragraph indentations, and fonts.
- `src/UPS.png` and `src/UPSHeader.png`: Official institutional graphics.

---

## 12. How to Compile the Document

### 12.1 Method 1: VS Code (Recommended)
1. Install the **Tinymist Typst** extension in VS Code.
2. Open `template/main.typ`.
3. Click the **Typst: Preview** button in the top right corner.
4. The extension shows a live preview of the PDF.

### 12.2 Method 2: Command Line Interface (CLI)
Open a terminal in the root directory of the repository (`TemplateUPS`). Run the following command:

```bash
# Compile once to generate the PDF file:
typst compile template/main.typ --root .

# Recompile automatically when files change:
typst watch template/main.typ --root .
```

> **NOTE:** You must include the `--root .` option. The compiler requires this option to find files in the `src/` directory. The generated file is saved at `template/main.pdf`.

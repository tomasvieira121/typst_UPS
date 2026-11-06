# UPS Thesis Template

An unofficial Master's thesis template for the Universidade Politécnica de Santarém (UPS) written in Typst.

This template provides a clean and professional layout that follows UPS's thesis formatting requirements, offering a modern alternative to LaTeX templates.

---

> 📖 **In-Depth Guide & Setup:**  
> For a comprehensive, step-by-step guide on how to create your personal repository, pull template files, install dependencies, customize chapters, and format tables/code, please refer to **[DOC.md](DOC.md)**.

---

## Quick Start

### 1. Using VS Code (Recommended)
1. Install [VS Code](https://code.visualstudio.com/) and the **[Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)** extension.
2. Open this folder in VS Code and open `template/main.typ`.
3. Click the **"Typst: Preview"** button in the top-right corner (or press `Ctrl+K, V`) for a live side-by-side preview.

### 2. Using the Command Line
Compile directly from your terminal (requires the [Typst CLI](https://github.com/typst/typst)):

```bash
# Compile once (generates template/main.pdf):
typst compile template/main.typ --root .

# Or auto-recompile on save:
typst watch template/main.typ --root .
```

*Note: The `--root .` flag is required.*

---

## Documentation

Consult **[DOC.md](DOC.md)** for detailed guides on:
- **Repository Setup**: Creating your personal repository via GitHub Web, VS Code Source Control, or Git CLI.
- **Template Updates**: How to pull and sync future template changes without conflicts.
- **Configuration & Customization**: Modifying document metadata, cover pages, acronyms, and chapters.
- **Formatting Guidelines**: Proportions for tables, algorithms, breakable code blocks, and appendices.

---

## Acknowledgments & Disclaimer

This template is an unofficial fork and adaptation of the **Invicta Thesis Template** (`@preview/invicta-thesis` by João Lourenço) for the UPS community. It is not officially endorsed by the university.

Always verify that your thesis meets current UPS requirements before submission. The UPS logo and branding remain the property of Universidade Politécnica de Santarém.

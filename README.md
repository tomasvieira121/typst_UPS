# UPS Thesis Template

An unofficial Master's thesis template for the Universidade Politécnica de Santarém (UPS) written in Typst.

This template provides a clean and professional layout that follows UPS's thesis formatting requirements, offering a modern alternative to LaTeX templates.

> 📖 **User Guide:** For complete instructions on where and how to edit each part of the template, refer to [DOC.md](DOC.md).

## Build Instructions

### Option 1: Using VS Code (Recommended)
The easiest way to write and compile this template is by using an editor extension.
1. Install [VS Code](https://code.visualstudio.com/).
2. Install the **Tinymist Typst** extension.
3. Open the `template/main.typ` file.
4. Click the "Typst: Preview" button in the top right corner to get a live, side-by-side PDF preview as you type!

### Option 2: Using the Command Line
If you prefer compiling directly from your terminal:
1. Install the Typst compiler from the [official website](https://typst.app/) (or use `winget install typst` / `brew install typst`).
2. Open a terminal in the root folder of this repository.
3. Run the following command (the `--root .` is important so the compiler can find the `src/` folder):

```bash
typst compile template/main.typ --root .
```
4. The generated PDF will be created at `template/main.pdf`.

## Example Usage

```typst
#show: template.with(
  title: "Advanced Machine Learning Techniques for Computer Vision",
  author: "Luís Vaz de Camões",
  degree: "Master in Electrical and Computer Engineering",
  supervisor: "Prof. Maria Santos",
  second-supervisor: "Prof. Pedro Costa",
  copyright-notice: "Luís Camões, 2025",
  committee-text: "Approved in oral examination by the committee:",
  committee-members: (
    (role: "President", name: "Prof. Ana Ferreira"),
    (role: "Referee", name: "Prof. Carlos Oliveira"),
    (role: "Referee", name: "Prof. Luisa Rodrigues"),
  ),
  stage: "final",
  language: "en",
  on-paper: true,
)
```

## Acknowledgments

This template was created for the UPS community and is not officially endorsed by the university. The UPS logo and university branding remain property of the Universidade Politécnica de Santarém.

This template is a fork and adaptation of the **Invicta Thesis Template** (a package available in the Typst Universe as `@preview/invicta-thesis`, created by João Lourenço). 

---

**Note**: This is an unofficial template. Always verify that your thesis meets current UPS requirements before submission. The UPS logo and UP logo used in this template are under copyright of Universidade Politécnica de Santarém, and shall not be used for non-professional purposes or by people outside of the institution without its express authorization.

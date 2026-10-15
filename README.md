# Course repository template (ITU PhD, Control and Automation)

One repository per course. `common/` is copied between course repos (no submodules).

## Start a new course (5 minutes)
1. Copy this folder, rename it (e.g. `mpc-2026f`, `robot-intelligence-2026f`).
2. Edit course name, code and your name in `notes/main.tex`, `homework/hw01/hw01.tex`
   and `summary/cheat-sheet.tex`.
3. Create a **private** empty repository on GitHub/GitLab, then:
   ```
   git init -b main
   git add .
   git commit -m "init: course skeleton"
   git remote add origin <your-repo-url>
   git push -u origin main
   ```

## Folders
```
common/      ituphd.cls, macros.sty, refs.bib, logos/   (copied between courses)
notes/       main.tex + lectures/lecNN-topic.tex        (one file per lecture)
homework/    hwNN/hwNN.tex, code/, figures/{generated,static}
code/        shared course code (matlab/, python/)
prep/        pre-class questions, one markdown file per lecture (copy lec00-template.md)
summary/     cheat-sheet.tex (exam preparation, update weekly)
ideas.md     research ideas, one line each, dated
```

## Building
- **VS Code (LaTeX Workshop):** open the repository folder (not a subfolder) and save a
  `.tex` file. `.vscode/settings.json` builds into `build/` and points LaTeX at `common/`.
  `.vscode/settings.json` is set up for **Windows + MiKTeX** (`;` separators and
  `-include-directory`). On macOS/Linux/TeX Live, use `:` in the `env` entries and remove the
  `-pdflatex=...` line from `args`.
- **Command line**, from the folder of the `.tex` file:
  ```
  TEXINPUTS=../common//: BIBINPUTS=../common//: BSTINPUTS=../common//: \
    latexmk -pdf -outdir=build main.tex
  ```
  (use `../../common//:` from `homework/hwNN/`).

## Document types
- `\documentclass[notes]{ituphd}` for notes and summaries, `[homework]` for homework.
- `\makecover` gives a full cover page (logo, university, course, title, student, student no.,
  instructor, date). Notes use it by default; homework uses it too.
  The compact `\maketitle` header is still available if you prefer it.
  Set `\studentid{...}` and `\instructor{...}` in the preamble.
- Switch logo in a document with `\renewcommand{\itulogofile}{itu-black.pdf}`.
- Boxed environments: theorem, lemma, proposition, corollary (blue), definition,
  assumption (gold); plain: example, remark. Homework: `problem` and `solution`.
- `\figfile{figures/generated/name.pdf}` shows a red placeholder instead of failing when a
  generated figure has not been created yet.

## What goes into Git
| Track | Do not track |
|---|---|
| `.tex`, `.bib`, `.sty`, `.cls`, `.py`, `.m`, `.md` | `build/` and LaTeX aux files |
| `figures/static/` (photos, scans, instructor figures) | `figures/generated/` (rerun the script) |
| Submitted homework PDF (copy it out of `build/`, e.g. `hw01-submitted.pdf`) | `.mat`, `.h5`, `data/` |

Record the MATLAB version and toolboxes, the Python package versions and random seeds in
each homework folder so figures can be reproduced. Python: `pip install -r requirements.txt`.

## Commit messages
```
notes: add lec03 terminal constraints
hw: hw01 problem 2 solution and plots
code: RRT* baseline with fixed seeds
prep: questions for lec04
common: add lemma box
refs: add Mayne 2000 survey
```
Commit at the end of every work session and push daily. When you submit something:
`git tag hw01-submitted && git push --tags`.

## Updating `common/` across courses
Improve `common/` in whichever course repo you are in, commit it as `common: ...`, and copy the
folder into your other course repos when you next need it. Do not maintain it in two places at once.

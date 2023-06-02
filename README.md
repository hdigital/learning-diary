# Learning snippets

Code snippets of smaller things I learned -- Today I learned (TIL)

## Usage

Render page. Posts are rendered individually -- see below.

```sh
quarto render
```

Posts are [frozen](https://quarto.org/docs/projects/code-execution.html#freeze) and updates need to be rendered by document. Use VS Code or RStudio alternatively to render pages.

```sh
quarto render posts/welcome/index.qmd
```

Publish page on [GitHub Pages](https://quarto.org/docs/publishing/github-pages.html).

```sh
quarto publish
```

Run page locally at <http://localhost:8000/>

```sh
cd _site
python -m http.server 8000
```

## Installation

+ [Quarto](https://quarto.org/docs/get-started/)
+ Tidyverse-R -- R and tidyverse
+ Python -- [create `env`](https://quarto.org/docs/projects/virtual-environments.html#using-venv)

R packages

```r
install.packages(c("gapminder", "knitr", "patchwork", "tidyverse"))
```

Python packages -- see [requirements.txt](requirements.txt)

```sh
python -m pip install -r requirements.txt
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
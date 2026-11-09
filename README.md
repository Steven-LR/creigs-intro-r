# CREiGS Intro to R: Data Wrangling and Visualization

Workshop materials for CREiGS Intro to R, taught by Steven Lawrence, PhD, on November 18, 2026.

## Get the materials

You need R 4.6.1 and RStudio installed first. Then paste this into the RStudio console:

```r
install.packages("usethis")
usethis::use_course("https://github.com/Steven-LR/creigs-intro-r/archive/refs/heads/main.zip")
```

Answer **yes** to the prompts. RStudio opens the project in a new window, in a folder called `creigs-intro-r-main`. Always open the workshop from `creigs-intro-r.Rproj` so R can find the data.

To give the folder your own name, choose **File › Close Project** in RStudio, rename the folder in Finder or File Explorer, then double-click `creigs-intro-r.Rproj` to reopen it. The workbook finds its files relative to the project folder, so everything keeps working.

If packages fail to install, run `renv::restore(library = .libPaths()[1])` inside the project to install the exact versions used for the workshop.

## What's here

| File | Contents |
|---|---|
| `creigs-intro-r-workbook.qmd` | The workbook. Blanks marked `___` are filled in during the session. |
| `data/squirrels.csv` | 2018 Central Park Squirrel Census |
| `data/restaurant_inspections.csv.gz` | NYC restaurant inspection results, compressed. The workbook unzips it the first time it runs. |
| `figures/` | Saved plots go here. |

The answer key will be posted after the session.

## Data sources

- **2018 Central Park Squirrel Census**: NYC Open Data.
- **DOHMH New York City Restaurant Inspection Results**: NYC Open Data, October 2019 snapshot distributed with the `p8105.datasets` R package.

## Contact

Steven Lawrence, PhD · itws.lawrence@gmail.com · [steven-lr.github.io](https://steven-lr.github.io)

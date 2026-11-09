---
title: "CREiGS Intro to R: Setup Before the Workshop"
---

# CREiGS Intro to R: Setup Before the Workshop

**Data Wrangling and Visualization** · Steven Lawrence, PhD · November 18, 2026

I'm Steven, and I'll be teaching the Intro to R session. Please work through these five steps before the workshop so that our time together goes to the material rather than to installing software. It takes about 45 minutes, and most of that is waiting on downloads.

If you get stuck at any point, email me at [itws.lawrence@gmail.com](mailto:itws.lawrence@gmail.com) so we can sort it out before the workshop.

## Step 1: Install R (version 4.6.1)

R is the language we'll be coding in. Install it **before** RStudio. If you do it the other way around, RStudio may not find R and you'll have to reconnect them.

Click the link for your computer. The installer downloads directly.

- **Windows:** [R-4.6.1-win.exe](https://cloud.r-project.org/bin/windows/base/old/4.6.1/R-4.6.1-win.exe)
- **Mac with Apple silicon (M1 or later):** [R-4.6.1-arm64.pkg](https://cloud.r-project.org/bin/macosx/big-sur-arm64/base/R-4.6.1-arm64.pkg)
- **Mac with an Intel processor:** [R-4.6.1-x86_64.pkg](https://cloud.r-project.org/bin/macosx/big-sur-x86_64/base/R-4.6.1-x86_64.pkg)

Not sure which Mac you have? Open the Apple menu and choose **About This Mac**. "Chip: Apple M1" (or M2, M3 and so on) means Apple silicon; "Processor: Intel" means Intel.

Open the downloaded file and accept the defaults.

We're all using the same version so the code behaves the same on everyone's laptop. If you already have R, type `R.version.string` in the R or RStudio console to check your version. If it's older, go ahead and install 4.6.1 anyway. Both can live side by side.

## Step 2: Install RStudio Desktop

RStudio is where you'll actually write and run your code.

Click the link for your computer. The installer downloads directly.

- **Windows:** [RStudio for Windows](https://rstudio.org/download/latest/stable/desktop/windows/RStudio-latest.exe)
- **Mac:** [RStudio for Mac](https://rstudio.org/download/latest/stable/desktop/mac/RStudio-latest.dmg)

On Windows, run the installer and accept the defaults. On a Mac, open the downloaded file and drag RStudio into the Applications folder.

**Already have RStudio? Update it anyway.** Older versions of RStudio can't display plots with R 4.6. Download and install the latest version from the link above; it replaces the old one.

Open **RStudio** (not R). You should see four panes, and the console in the bottom left shows your R version.

## Step 3: Download the course files

This grabs the workshop data and code, puts them in a folder, and opens it in RStudio. Paste this into the Console:

```r
install.packages(c("usethis", "renv"))
usethis::use_course("https://github.com/Steven-LR/creigs-intro-r/archive/refs/heads/main.zip")
```

When it asks you questions, type the number for **yes**. A new RStudio window will open with the project. Always open the workshop from this project, because that's how R knows where to find the data.

**Optional: rename the folder.** The project downloads into a folder called `creigs-intro-r-main`. To give it your own name:

1. In RStudio, choose **File › Close Project**.
2. In Finder (Mac) or File Explorer (Windows), rename the folder, and move it somewhere else if you like.
3. Double-click `creigs-intro-r.Rproj` inside the folder to reopen the project.

Everything keeps working after a rename, because the workbook finds its files relative to the project folder.

## Step 4: Install the packages

Packages are add-ons that give R new tools. The course folder includes a list of every package we use and the exact version of each, for both workshop sessions. In the project window that opened in Step 3, paste this into the **Console** (bottom left) and press Enter:

```r
renv::restore()
```

Type `y` when it asks whether to proceed. This installs about 230 packages, including Seurat for the single-cell session, and takes 20 to 30 minutes, so start it well before the workshop. You'll see a lot of red text scroll by, and that's normal. The only thing to worry about is a line that starts with **Error**.

## Step 5: Run the check

In the project window, paste this into the Console:

```r
pkgs <- c("tidyverse", "readxl", "janitor", "vroom", "data.table", "here",
          "skimr", "arsenal", "gtsummary", "patchwork", "ggrepel", "pheatmap",
          "usethis", "renv", "BiocManager", "remotes", "R.utils",
          "Seurat", "harmony", "DirichletReg", "multtest", "presto")
ok <- vapply(pkgs, requireNamespace, logical(1), quietly = TRUE)
cat("R version:", R.version.string, "\n\n")
for (p in pkgs) cat(if (ok[p]) "  OK      " else "  MISSING ", p, "\n")
if (all(ok)) cat("\nAll set! See you at the workshop.\n") else
  cat("\nMissing packages. Try the backup below,",
      "\nor arrive early and I will help.\n")
```

If every line says **OK** and the last line says *All set!*, you're done. See you there!

## If something goes wrong

| What you see | What to do |
|---|---|
| RStudio says it can't find R | Install R (Step 1) first, restart your computer, and reopen RStudio |
| A package shows **MISSING** after Step 4 | Run `install.packages("that_package")` on its own, and read the first line that starts with Error |
| A package fails with a compiler or "make" error | Install the developer tools (see the end of this page), restart RStudio, and run the install again |
| Lots of packages fail, or the errors don't make sense | Use the backup below |
| Your work laptop won't let you install anything | Ask your IT team for install rights, or bring a personal laptop |

**The backup plan.** If `renv::restore()` stops with an error, or the check in Step 5 shows missing packages, install the packages directly instead. In the project window, copy this into the **Console** (bottom left) and press Enter:

```r
# Intro to R
install.packages(c("tidyverse", "readxl", "janitor", "vroom", "data.table", "here",
                   "skimr", "arsenal", "gtsummary", "patchwork", "ggrepel",
                   "pheatmap", "usethis", "renv", "BiocManager", "remotes", "R.utils"))

# Single-cell session
install.packages("Seurat", repos = "https://packagemanager.posit.co/cran/2026-11-06")  # version 5.6.0
install.packages(c("harmony", "DirichletReg", "presto"))
BiocManager::install("multtest", update = FALSE, ask = FALSE)
```

This can take 5 to 15 minutes, so grab a coffee. You'll see a lot of red text scroll by, and that's normal. R writes its progress messages in red. The only thing to worry about is a line that starts with **Error**.

If R asks *"Do you want to install from sources the packages which need compilation?"*, type `no` and press Enter.

The second group of packages is for the single-cell session. Seurat is large, so that part takes the longest.

## If a package needs developer tools

You shouldn't need this. If an install fails with a compiler or "make" error, R is trying to build a package from its source code, which needs a free set of developer tools. Install them once, restart RStudio, and run the install again.

**Mac:** open the Terminal app (**Applications › Utilities › Terminal**), paste this line and press Enter:

```bash
xcode-select --install
```

In the window that appears, click **Install** and agree to the license. It takes about 10 minutes. If Terminal says the tools are already installed, you're all set.

**Windows:** download and run the Rtools installer for R 4.6 from [cran.r-project.org/bin/windows/Rtools/rtools46](https://cran.r-project.org/bin/windows/Rtools/rtools46/rtools.html). Accept the defaults. Rtools needs a few GB of disk space, so check that you have room first.

Still stuck? That's okay. Come 15 minutes early and I'll help you get set up.

## Workshop materials

- [Course repository on GitHub](https://github.com/Steven-LR/creigs-intro-r): the workbook, data and package list. Step 3 downloads all of it.
- The answer key and extra-time solutions will be posted here after the workshop.

Questions? Email [itws.lawrence@gmail.com](mailto:itws.lawrence@gmail.com) or visit [steven-lr.github.io](https://steven-lr.github.io).

# R examples

This repo was cloned from: https://github.com/bkmgit/r-examples/

I made some changes to `DataStructuresStart.R` and added the `data/` folder, so I decided to create a new branch before adding and committing my changes, 

## Create new branch

```bash
$ git checkout -b data-structures
# Switched to a new branch 'data-structures'
$ git add -A
$ git commit -m "data structures portion"
#[data-structures fe06b8e] data structures portion
# 4 files changed, 103 insertions(+), 3 deletions(-)
# create mode 100644 .gitignore
# create mode 100644 data/feline-data.csv
# create mode 100644 r-examples.Rproj
```

I went ahead and created my own repo on Github here: https://github.com/mjfrigaard/r-examples

In order to push to *my* repo, I need to change the origin url 

## Changing Git origin url

This takes the following command: 

```bash
$ git remote set-url origin https://github.com/mjfrigaard/r-examples.git
```

You won't see anything in the terminal telling us we're able to push. But we can test this by pushing the original (`main`) branch (without my changes). 

```bash
$ git push origin main
# Enumerating objects: 6, done.
# Counting objects: 100% (6/6), done.
# Delta compression using up to 12 threads
# Compressing objects: 100% (5/5), done.
# Writing objects: 100% (6/6), 1.16 KiB | 1.16 MiB/s, done.
# Total 6 (delta 0), reused 6 (delta 0), pack-reused 0
# To https://github.com/mjfrigaard/r-examples.git
# * [new branch]      main -> main
```

If I look in Github, I see the original repo I cloned from Benson: 

```bash
├── DataStructuresStart.R
├── README.md
├── help.R
└── intro.R
```

When I push from the `data-structure` branch, I see the following: 

```bash
$ git push origin data-structures
# Enumerating objects: 9, done.
# Counting objects: 100% (9/9), done.
# Delta compression using up to 12 threads
# Compressing objects: 100% (5/5), done.
# Writing objects: 100% (7/7), 1.77 KiB | 1.77 MiB/s, done.
# Total 7 (delta 0), reused 0 (delta 0), pack-reused 0
# remote: 
# remote: Create a pull request for 'data-structures' on GitHub by visiting:
# remote: https://github.com/mjfrigaard/r-examples/pull/new/data-structures
# remote: 
# To https://github.com/mjfrigaard/r-examples.git
#  * [new branch]      data-structures -> data-structures
```

I now have two branches on my repo, with data-structure having the following contents: 

```bash
├── DataStructuresStart.R
├── README.md
├── data
│   └── feline-data.csv
├── help.R
├── intro.R
└── r-examples.Rproj
```

I can compare the changes using `git diff <branch1> <branch2>` and merge the two branches. 

```bash
diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..5b6a065
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,4 @@
+.Rproj.user
+.Rhistory
+.RData
+.Ruserdata
diff --git a/DataStructuresStart.R b/DataStructuresStart.R
index a9ae896..2f27e9a 100644
--- a/DataStructuresStart.R
+++ b/DataStructuresStart.R
@@ -1,14 +1,17 @@
-# Reading in data
+# Reading in data ----
 # Different data types
 # Working with categorical data
-
+## create cats ----
 cats <- data.frame( coat = c("calico","black","tabby"),
                     weight = c(2.1,5.0,3.2),
                     likes_string = c(1,0,1))
+
 View(cats)
+
+## export cats ------------------------------------------
 write.csv(x=cats,file="data/feline-data.csv",
           row.names = FALSE)
-## Load our data
+## Load our data ----
 copy_cats <- read.csv(file="data/feline-data.csv",
                       stringsAsFactors=TRUE)
 View(copy_cats)
@@ -22,3 +25,79 @@ copy_cats$weight
 paste("My cats is",cats$coat)
 cats$weight + copy_cats$weight
 cats$weight + copy_cats$coat
+# investigate objects 
+typeof(copy_cats$coat)
+class(copy_cats$coat)
+unclass(copy_cats$coat)
+# for factors 
+levels(copy_cats$coat)
+str(copy_cats$coat)
+attr(x = copy_cats$coat, which = "class")
+dput(copy_cats$coat)
+# structure(c(2L, 1L, 3L), 
+#   .Label = c("black", "calico", "tabby"), 
+#   class = "factor")
+
+vec_logical <- vector(length = 3)
+vec_numeric <- vector(mode = "integer", length = 5)
+vec_char <- vector(mode = "character", length = 5)
+length(vec_char)
+
+
+### vector type coercion ---------------
+# class(`c`)
+# class(`<-`)
+vec_type_test <- c(vec_char, vec_logical)
+vec_logical
+c(FALSE, "B")
+
+vec_test_type2 <- as.numeric(vec_logical, vec_numeric)
+as.numeric(vec_logical)
+as.integer(vec_logical)
+as.numeric(vec_char)
+vec_numeric_chars <- c("3", "9", "39")
+str(vec_numeric_chars)
+vec_test_type3 <- as.numeric(vec_numeric_chars)
+
+vec_integer <- c(9L, 5L, 2L)
+# more precise 
+vec_numeric_decimal <- c(0.4, 1.4, 0.999999)
+vec_numeric_decimal
+as.integer(vec_numeric_decimal)
+# type coercion order ----
+# logical 
+# numbers (integer, numeric, complex) 
+# character
+
+# series ----------------------------------------------------
+vec_series <- 10:20
+str(vec_series)
+# seq -------------------------------------------------------
+vec_seq_series <- seq(10, 20, by = 0.5)
+vec_seq_series
+head(x = vec_seq_series, 10)
+tail(vec_seq_series, 10)
+
+names(vec_integer) <- c("bob", "sally", "herbert")
+names(vec_integer)
+# dput(vec_integer)
+vec_named <- c(bob = 9L, sally = 5L, herbert = 2L)
+names(copy_cats)
+
+# subsetting data.frames -------------------------------
+# brackets use a row, column index
+value_black_cat <- copy_cats[ 2, 3]
+str(value_black_cat)
+
+copy_cats[ 1:2, 2:3]
+
+# named column subsetting --------------------------
+copy_cats[ 2, "weight"]
+
+vec_factor <- factor(x = c("black", "calico", "tabby"), levels = c("black", "calico", "tabby", "Maine Coon"))
+vec_factor
+str(vec_factor)
+vec_factor_ordered <- factor(x = c("low", "med", "high"), 
+  levels = c("low", "med", "high"), ordered = TRUE)
+AlwaysSaveHistory: Default
+
+EnableCodeIndexing: Yes
+UseSpacesForTab: Yes
+NumSpacesForTab: 2
+Encoding: UTF-8
+
+RnwWeave: Sweave
+LaTeX: pdfLaTeX
```

This is easier with the Github interface, which I can access by following the link provided above: https://github.com/mjfrigaard/r-examples/pull/new/data-structures



```bash
$ git request-pull data-structures https://github.com/mjfrigaard/r-examples/ main
# The following changes since commit 00a1e1a0acd07d6ac582fa2644331dfa761d2a00:
# first commit (2021-07-07 22:13:02 +0300)
# are available in the Git repository at:
#  https://github.com/mjfrigaard/r-examples/ main
# for you to fetch changes up to 00a1e1a0acd07d6ac582fa2644331dfa761d2a00:
#  first commit (2021-07-07 22:13:02 +0300)
#----------------------------------------------------------------
```

We can merge these changes into main by switching branches to `main`

```bash
$ git checkout main
# Switched to branch 'main'
# Your branch is up to date with 'origin/main'.
```

And to merge, we use the following: 

```bash
$ git merge --no-ff data-structures
```

You will see vim, a text editor with some strange commands. Press the `"i"` key for "insert", then enter a message ("merge data structures"), 

```bash
"merge data structures"
# Please enter a commit message to explain why this merge is necessary,

```
Now press "esc" the escape key, then type `:wq` for "write & quit" and hit enter. 

```bash
# Merge made by the 'recursive' strategy.
#  .gitignore            |  4 +++
#  DataStructuresStart.R | 85 ++++++++++++++++++++++++++++++++++++++++++--
#  data/feline-data.csv  |  4 +++
#  r-examples.Rproj      | 13 +++++++
#  4 files changed, 103 insertions(+), 3 deletions(-)
#  create mode 100644 .gitignore
#  create mode 100644 data/feline-data.csv
#  create mode 100644 r-examples.Rproj
```

And finally, we push origin to main. 

```bash
$ git push origin main
# Enumerating objects: 1, done.
# Counting objects: 100% (1/1), done.
# Writing objects: 100% (1/1), 233 bytes | 233.00 KiB/s, done.
# Total 1 (delta 0), reused 0 (delta 0), pack-reused 0
# To https://github.com/mjfrigaard/r-examples.git
#    00a1e1a..7886ee2  main -> main
```







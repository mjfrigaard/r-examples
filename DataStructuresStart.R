# Reading in data ----
# Different data types
# Working with categorical data
## create cats ----
cats <- data.frame( coat = c("calico","black","tabby"),
                    weight = c(2.1,5.0,3.2),
                    likes_string = c(1,0,1))

View(cats)

## export cats ------------------------------------------
write.csv(x=cats,file="data/feline-data.csv",
          row.names = FALSE)
## Load our data ----
copy_cats <- read.csv(file="data/feline-data.csv",
                      stringsAsFactors=TRUE)
View(copy_cats)
## look at a single column
copy_cats$coat
copy_cats$weight
## operating on columns
copy_cats$weight + 2
copy_cats$weight <- copy_cats$weight + 3
copy_cats$weight
paste("My cats is",cats$coat)
cats$weight + copy_cats$weight
cats$weight + copy_cats$coat
# investigate objects 
typeof(copy_cats$coat)
class(copy_cats$coat)
unclass(copy_cats$coat)
# for factors 
levels(copy_cats$coat)
str(copy_cats$coat)
attr(x = copy_cats$coat, which = "class")
dput(copy_cats$coat)
# structure(c(2L, 1L, 3L), 
#   .Label = c("black", "calico", "tabby"), 
#   class = "factor")

vec_logical <- vector(length = 3)
vec_numeric <- vector(mode = "integer", length = 5)
vec_char <- vector(mode = "character", length = 5)
length(vec_char)


### vector type coercion ---------------
# class(`c`)
# class(`<-`)
vec_type_test <- c(vec_char, vec_logical)
vec_logical
c(FALSE, "B")

vec_test_type2 <- as.numeric(vec_logical, vec_numeric)
as.numeric(vec_logical)
as.integer(vec_logical)
as.numeric(vec_char)
vec_numeric_chars <- c("3", "9", "39")
str(vec_numeric_chars)
vec_test_type3 <- as.numeric(vec_numeric_chars)

vec_integer <- c(9L, 5L, 2L)
# more precise 
vec_numeric_decimal <- c(0.4, 1.4, 0.999999)
vec_numeric_decimal
as.integer(vec_numeric_decimal)
# type coercion order ----
# logical 
# numbers (integer, numeric, complex) 
# character

# series ----------------------------------------------------
vec_series <- 10:20
str(vec_series)
# seq -------------------------------------------------------
vec_seq_series <- seq(10, 20, by = 0.5)
vec_seq_series
head(x = vec_seq_series, 10)
tail(vec_seq_series, 10)

names(vec_integer) <- c("bob", "sally", "herbert")
names(vec_integer)
# dput(vec_integer)
vec_named <- c(bob = 9L, sally = 5L, herbert = 2L)
names(copy_cats)

# subsetting data.frames -------------------------------
# brackets use a row, column index
value_black_cat <- copy_cats[ 2, 3]
str(value_black_cat)

copy_cats[ 1:2, 2:3]

# named column subsetting --------------------------
copy_cats[ 2, "weight"]

vec_factor <- factor(x = c("black", "calico", "tabby"), levels = c("black", "calico", "tabby", "Maine Coon"))
vec_factor
str(vec_factor)
vec_factor_ordered <- factor(x = c("low", "med", "high"), 
  levels = c("low", "med", "high"), ordered = TRUE)
str(vec_factor_ordered)


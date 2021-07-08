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


# Day 3

# List

list_example <- list(1, "a", TRUE, 1+4i)
list_example

another_list <- list(title = "numbers", numbers = 1:10, data = TRUE)
another_list

typeof(cats)

typeof(cats[,1])
typeof(cats[,2])
typeof(cats[,3])

typeof(cats[1,])


# Matrices

matrix_example <- matrix(0, ncol=6, nrow=3)
matrix_example

class(matrix_example)
typeof(matrix_example)
dim(matrix_example)

nrow(matrix_example)
ncol(matrix_example)

length(matrix_example)



# Exploring Data Frames ----

age <- c(2, 3, 5)
cats

cbind(cats, age)

age <- c(2, 3, 5, 11)
cbind(cats, age)

age <- c(2,3)
cbind(cats,age)

age <- c(2,3,5)
cbind(cats,age)
cats
cats <- cbind(cats,age)
cats

new_row <- list("tortoiseshell", 3.3, TRUE, 9)
cats <- rbind(cats,new_row)
cats

cats[-2,]
cats[c(-2,-4),]

cats[,-3]

cats <- rbind(cats, cats)
cats

#cbind(), rbind(), nrow(), ncol(), length()


# Control flow ----

##if() ----

#if( condition is true ) {
#     perform action
#}

#if(condition is true ) {
#    perform action 1
#    perform action 2
#} else {
#    perform action
#}

x <- 8
x

if(x >= 10) {
  print("x is greater or equal to 10")
} else if (x > 5) {
  print("x is > 5, but < 10")
}else {
  print("x is less than 10")
}

#ifelse(condition, action1, action2)

y <- -3
ifelse(y<0, "y is a negative number", "y is positive or zero")

#any()
#all()


# Repeating operations ----
## for() ----

#for(iterator in set of values) {
  #do something with iterator
#}

for(i in 1:10) {
  print(i)
}

for(i in 1:5) {
  for(j in c('a', 'b', 'c', 'd', 'e')) {
    print(paste(i,j))
  }
}


# Vectorization ----

3^(1:6)

x <- 1:4
x*2

y <- 6:9
x+y

output_vector <- c()
for( i in 1:4) {
  output_vector[i] <- x[i] + y[i]
}
output_vector

x > 2
x

## any() ----
any(x>2)
## all() ----
all(x>2)

log(x)

m <- matrix(1:12, nrow=3, ncol=4)
m

m * -1

m %*% matrix(1, nrow=4, ncol=1)

m > c(0, 20)

### Challenge ----
# We’re interested in looking at the sum of the following sequence of fractions:
#  x = 1/(1^2) + 1/(2^2) + 1/(3^2) + ... + 1/(n^2)
#This would be tedious to type out, and impossible for high values of n. Use vectorisation to compute x when n=100.

sum(1/(1:100)^2)

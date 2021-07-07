# Reading in data
# Different data types
# Working with categorical data

cats <- data.frame( coat = c("calico","black","tabby"),
                    weight = c(2.1,5.0,3.2),
                    likes_string = c(1,0,1))
View(cats)
write.csv(x=cats,file="data/feline-data.csv",
          row.names = FALSE)
## Load our data
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

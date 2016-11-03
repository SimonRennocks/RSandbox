
weightmedian <- function(directory, day)  {
        files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
        
        dat <- data.frame()                             #creates an empty data frame
        for (i in 1:5) {                                
                #loops through the files, rbinding them together 
                dat <- rbind(dat, read.csv(files_list[i]))
        }
        
        dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
        median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
                                                        #while stripping out the NAs
}

weightmedian_better <- function(directory, day)  {
        files_list <- list.files(directory, full.names=TRUE)  
       
        tmp <- lapply(files_list, read.csv)
        dat <- do.call(rbind, tmp)
      
        dat_subset <- dat[which(dat[, "Day"] == day),]   #subsets the rows that match the 'day' argument
        median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
                                                        #while stripping out the NAs
}

dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")

weightmedian_better(directory = "diet_data", day = 20)
weightmedian_better("diet_data", 7)
weightmedian_better("diet_data", 17)


make.power <- function(n){
  pow <- function(x) {
    x^n
    
  }
  pow
}
# usage

# cube <-make.power(3)
# square <- make.power(2)

# cube(3)
# square(3)

ls(environment(cube))
# [1] "n"   "pow"
get("n",environment(cube))
# [1] 3

f <- function(x){
  y <- 2
  y^2 + g(x)
}

g <- function(x){
  x*y
}

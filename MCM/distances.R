#***************************************************************************
# DIStANCES FROM STARTING POINT
#***************************************************************************

# library required package
library(geosphere)

# function that finds mean of each year
split_mean <- function(column) {
  longitude <- numeric(100)
  latitude <- numeric(100)
  for(i in seq_len(100)) {
    xy <- str_split(column[i], " ")
    latitude[i] <- as.numeric(xy[[1]][1])
    longitude[i] <- as.numeric(xy[[1]][2])
  }
  mean_loc <- c(mean(longitude, na.rm = TRUE), mean(latitude, na.ram = TRUE))
  mean_loc
}

# function that finds the distance (in km) of current location from starting point
km_dist <- function(column, start_coor) {
  mean_coor <- split_mean(column=column)
  distm(start_coor, mean_coor, fun = distHaversine)/1000
}


# BEST CASE HERRING DISTANCES
bc_herr <- read_csv("bc_herring.csv", col_names = TRUE)
bc_herr <- bc_herr[,-1]

# port coordinates (start point)
start_loc <- c(-2.5, 56.5)

bch_dist <- data.frame(sapply(X=bc_herr, FUN=km_dist, start_coor=start_loc))
colnames(bch_dist) <- "Distance"
rownames(bch_dist) <- 2019:2069

write.csv(bch_dist, file = "bch_distances.csv")


# WORST CASE HERRING DISTANCES
wc_herr <- read_csv("wc_herring.csv", col_names = TRUE)
wc_herr <- wc_herr[,-1]

start_loc <- split_mean(wc_herr$X1_1)

wch_dist <- data.frame(sapply(X=wc_herr, FUN=km_dist, start_coor=start_loc))
colnames(wch_dist) <- "Distance"
rownames(wch_dist) <- 2019:2069

write.csv(wch_dist, file = "wch_distances.csv")


# BEST CASE MACKEREL DISTANCES
bc_mack <- read_csv("bc_mackerel.csv", col_names = TRUE)
bc_mack <- bc_mack[,-1]

start_loc <- split_mean(bc_mack$X1_1)

bcm_dist <- data.frame(sapply(X=bc_mack, FUN=km_dist, start_coor=start_loc))
colnames(bcm_dist) <- "Distance"
rownames(bcm_dist) <- 2019:2069

write.csv(bcm_dist, file = "bcm_distances.csv")


# WORST CASE MACKEREL DISTANCES
wc_mack <- read_csv("wc_mackerel.csv", col_names = TRUE)
wc_mack <- wc_mack[,-1]

start_loc <- split_mean(wc_mack$X1_1)

wcm_dist <- data.frame(sapply(X=wc_mack, FUN=km_dist, start_coor=start_loc))
colnames(wcm_dist) <- "Distance"
rownames(wcm_dist) <- 2019:2069

write.csv(wcm_dist, file = "wcm_distances.csv")

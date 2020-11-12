##########################
# Function to get calculate Hellinger distance (discrete)
#
# Author: Steven Mana'oakamai Johnson
# Date: 2020-11-11
#
##########################

##### Hellinger distance function #####
norm_vec <- function(x) sqrt(sum(x^2))

myhell <- function (p, q, from, to) {
  P <- density(p, kernel = "gaussian", from = from, to = to, n = 1000)
  p <- P$y
  p <- p / sum(p)
  Q <- density(q, kernel = "gaussian", from = from, to = to, n = 1000)
  q <- Q$y
  q <- q / sum(q)
  hd <- norm_vec(sqrt(p) - sqrt(q)) / sqrt(2)
  hd
}

bcm_years <- read_csv("bcm_years.csv")
bcm_years <- bcm_years[,2]
# histogram
ggplot(bcm_years, aes(x=x)) + 
  geom_histogram(aes(y=..count..), color="green", fill="white") +
  geom_density(alpha=.2, fill="#FF6666") +
  #xlim(c(48.5, 62.5)) +
  ggtitle("Years Histogram", "Best Case Mackerel")
ggsave("bcm_y_hist.png")

bcm_f <- factor(bcm_years[[1]])
table(bcm_f)

wcm_years <- read_csv("wcm_years.csv")
wcm_years <- wcm_years[,2]
ggplot(wcm_years, aes(x=x)) + 
  geom_histogram(aes(y=..count..), color="green", fill="white") +
  geom_density(alpha=.2, fill="#FF6666") +
  #xlim(c(48.5, 62.5)) +
  ggtitle("Years Histogram", "Worst Case Mackerel")
ggsave("wcm_y_hist.png")

wcm_f <- factor(wcm_years[[1]])
table(wcm_f)


bch_years <- read_csv("bch_years.csv")
bch_years <- bch_years[,2]
ggplot(bch_years, aes(x=x)) + 
  geom_histogram(aes(y=..count..), color="green", fill="white") +
  geom_density(alpha=.2, fill="#FF6666") +
  #xlim(c(48.5, 62.5)) +
  ggtitle("Years Histogram", "Best Case Herring")
ggsave("bch_y_hist.png")

bch_f <- factor(bch_years[[1]])
table(bch_f)

wch_years <- read_csv("wch_years.csv")
wch_years <- wch_years[,2]
ggplot(wch_years, aes(x=x)) + 
  geom_histogram(aes(y=..count..), color="green", fill="white") +
  geom_density(alpha=.2, fill="#FF6666") +
  #xlim(c(48.5, 62.5)) +
  ggtitle("Years Histogram", "Worst Case Herring")
ggsave("wch_y_hist.png")

wch_f <- factor(wch_years[[1]])
table(wch_f)
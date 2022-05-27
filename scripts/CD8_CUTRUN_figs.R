library(tidyverse)


T24hr_peaks <- data.frame(Treatment = factor(c("CTL", "CB839", "DON", "NoQ"), levels = c("CTL", "CB839", "DON", "NoQ")),
                          H3K27ac_peaks = c(5, 16, 5, 79),
                          H3K27me_peaks = c(2869, 9105, 917, 3508))
T24hr_peaks %>% pivot_longer(cols = 2:3, names_to = "peak_num") %>%
  ggplot(aes(x = peak_num, y = value, fill = Treatment)) +
  geom_bar(stat = "identity") +
  theme_classic() +
  coord_flip() + theme(text = element_text(size = 20))

T48hr_peaks <- data.frame(Treatment = factor(c("CTL", "CB839", "DON", "NoQ"), levels = c("CTL", "CB839", "DON", "NoQ")),
                          H3K27ac_peaks = c(9681, 116, 33, 6687),
                          H3K27me_peaks = c(13547, 12410, 3529, 8787),
                          ac_me_overlap = c(63, 0, 0, 4))


T48hr_peaks %>% pivot_longer(cols = 2:3, names_to = "peak_num") %>%
  ggplot(aes(x = peak_num, y = value, fill = Treatment)) + 
  geom_bar(stat = "identity") +
  theme_classic() + 
  coord_flip() + theme(text = element_text(size = 20))

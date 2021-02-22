### in class lesson 
### 2/22/2021

# load tidyverse packages
library("tidyverse")

# grab the penguins data
install.packages("palmerpenguins")

# load the penguin data
library("palmerpenguins")

# prelim data exploration
head(penguins)
sumary(penguins)
dim(penguins)
glimpse(penguins) #tidyverse version of "head"

# intro into dplyer 
ladies = filter(penguins, sex=="female")
summary(ladies)

gentoo_ladies = filter(penguins, sex=="female", species=="Gentoo")
summary(gentoo_ladies)

# the pipe %>% = "then" 
gentoo_ladies = penguins %>% filter(sex=="female", species=="Gentoo")

# spacing 
# general style of coding is to enter after a pipe symbol
# windows shortcut for pipe symbol is Ctrl + Shift + M
gentoo_ladies = penguins %>% 
  filter(sex=="female", #you'll often see several rules in different lines as well 
         species=="Gentoo") %>%
  summarize(mean_body_mass_g=mean(body_mass_g))
 
### exercise 1.1
chinstrap = penguins %>% 
  filter(species=="Chinstrap")

summary(chinstrap)

# sex ratio in chinstrap is 34:34 = 1:1 (female:male) 

chinstrap_200mflipper = chinstrap %>% 
  filter(flipper_length_mm >= 200)

summary(chinstrap_200mflipper)

# sex ratio of chinstraps with flippers > 200 mm is 2:18 = 1:9 (female:male)
# given this analysis, males seem to have longer flippers than females

# add in group_by 

penguins_masses = penguins %>% 
  filter(!is.na(sex)) %>% # remove NAs from data
  group_by(species, sex) %>% 
  summarize(mean_body_mass_g = mean(body_mass_g, na.rm=TRUE)) %>% 
  print() # so you don't have to call for the variable later 

# write.csv() # base R 
write_csv(penguins_masses, 'data/processed/penguins_masses_LGF.csv') # tidyverse 

penguins_masses

## more dplyr functions 
penguins %>% 
  group_by(species) %>% 
  summarize(n())

species_by_island = penguins %>% 
  group_by(species, island) %>% 
  summarize(n()) %>% 
  print()

# mutate 
penguins_for_america = penguins %>% 
  mutate(body_mass_lbs = body_mass_g * 0.0022) # 0.0022 lb/g 

glimpse(penguins_for_america)
 
# distinct() 
penguins %>% 
  distinct(island)

penguins %>% 
  distinct() # removes any duplicates 

# select() 
penguins %>% 
  select(species, sex)

penguins %>% 
  select(-bill_length_mm, -bill_depth_mm)
  # removes those columbs 

# arrange()
penguins %>% 
  arrange(body_mass_g) # smallest to largest 

penguins %>% 
  arrange(rev(body_mass_g)) # largest to smallest 





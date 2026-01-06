install.packages(c("readr", "ggplot2", "corrplot", "psych"))
library(readr)
library(dplyr)
library(ggplot2)
library(corrplot)
library(psych)


st_data <- read.csv("student-por.csv", sep = ";")

head(st_data)
str(st_data)

cat("Rows:", nrow(st_data), "\n")
cat("Columns:", ncol(st_data), "\n")

summary(st_data)

# Check for missing values
sum(is.na(st_data))  # clean dataset

# Renaming grade columns for clarity
st_data <- st_data %>%
  rename(Grade1 = G1, Grade2 = G2, FinalGrade = G3)

# Convert character columns to factors
st_data <- st_data %>%
  mutate_if(is.character, as.factor)

# Normalize absences and final grade
st_data$absences_z <- scale(st_data$absences)
st_data$FinalGrade_z <- scale(st_data$FinalGrade)

# Histogram of final grades
ggplot(st_data, aes(x = FinalGrade)) +
  geom_histogram(binwidth = 1, fill = "steelblue") +
  labs(title = "Distribution of Final Grades", x = "Final Grade", y = "Count")

# Boxplot by Study Time
ggplot(st_data, aes(x = as.factor(studytime), y = FinalGrade)) +
  geom_boxplot(fill = "tomato") +
  labs(title = "Final Grade vs. Study Time", x = "Study Time (factor)", y = "Final Grade")

# Average grade by school
st_data %>%
  group_by(school) %>%
  summarise(mean_grade = mean(FinalGrade))

# Students with more than 15 absences
st_data %>%
  filter(absences > 15) %>%
  select(school, sex, absences, FinalGrade)

# Descriptive Statistics
describe(st_data[, c("Grade1", "Grade2", "FinalGrade", "absences")])

# Frequency Count
table(st_data$studytime)

# T-Test: Final Grade by Gender
t.test(FinalGrade ~ sex, data = st_data)

# Select only numeric columns
num_data <- select_if(st_data, is.numeric)

# Correlation matrix
cor_matrix <- cor(num_data)

# Correlation plot
corrplot(cor_matrix, method = "color", type = "upper", tl.cex = 0.7)


# Scatter Plot: Grade1 vs FinalGrade
ggplot(st_data, aes(x = Grade1, y = FinalGrade)) +
  geom_point(color = "darkgreen") +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Relationship Between First and Final Grade", x = "Grade1", y = "Final Grade")

# Boxplot: Final Grade by Internet Access
ggplot(st_data, aes(x = internet, y = FinalGrade)) +
  geom_boxplot(fill = "purple") +
  labs(title = "Final Grade by Internet Access", x = "Internet Access", y = "Final Grade")


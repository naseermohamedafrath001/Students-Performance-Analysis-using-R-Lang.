# Student Performance Data Analysis

An R-based exploratory data analysis (EDA) project for analyzing student academic performance.

## Overview

This project analyzes student performance data to uncover patterns and relationships between various factors (study time, absences, internet access, gender) and final grades.

## Dataset

- **File**: `student-por.csv`
- **Source**: UCI Machine Learning Repository - Student Performance Dataset - https://archive.ics.uci.edu/dataset/320/student+performance
- **Subject**: Portuguese language course

## Requirements

### R Packages
```r
install.packages(c("readr", "dplyr", "ggplot2", "corrplot", "psych"))
```

| Package   | Purpose                          |
|-----------|----------------------------------|
| readr     | Data import                      |
| dplyr     | Data manipulation                |
| ggplot2   | Data visualization               |
| corrplot  | Correlation matrix visualization |
| psych     | Descriptive statistics           |

## Features

### Data Cleaning
- Missing value detection
- Column renaming for clarity (`G1` → `Grade1`, `G2` → `Grade2`, `G3` → `FinalGrade`)
- Factor conversion for categorical variables
- Z-score normalization for absences and final grades

### Visualizations
- **Histogram**: Distribution of final grades
- **Boxplots**: Final grade by study time and internet access
- **Scatter plot**: Relationship between first and final grade
- **Correlation heatmap**: Numeric variable relationships

<img width="743" height="467" alt="Image" src="https://github.com/user-attachments/assets/3b5b0f04-fb72-45d4-9bf6-51089d634ba9" />

<img width="743" height="467" alt="Image" src="https://github.com/user-attachments/assets/132ee934-a6af-4d97-b343-26c15c1f77e0" />

<img width="743" height="467" alt="Image" src="https://github.com/user-attachments/assets/91e6b1df-974f-44c8-94e8-886c9e205ab1" />

<img width="743" height="467" alt="Image" src="https://github.com/user-attachments/assets/6a57539a-ff60-4aff-8b0b-4934cc1420fb" />

### Statistical Analysis
- Descriptive statistics (mean, SD, skewness, kurtosis)
- Frequency tables for study time
- T-test comparing final grades by gender
- Correlation analysis

## Usage

1. Place `student-por.csv` in the project directory
2. Open `student-data-analysis.R` in RStudio
3. Run the script to generate analysis and visualizations

## Key Variables

| Variable    | Description                              |
|-------------|------------------------------------------|
| school      | Student's school (GP or MS)              |
| sex         | Student's gender (F or M)                |
| studytime   | Weekly study time (1-4 scale)            |
| absences    | Number of school absences                |
| internet    | Internet access at home (yes/no)         |
| Grade1 (G1) | First period grade (0-20)                |
| Grade2 (G2) | Second period grade (0-20)               |
| FinalGrade (G3) | Final grade (0-20)                   |

## Output

The script produces:
- Summary statistics of the dataset
- Multiple visualizations
- T-test results for gender comparison
- Correlation matrix of numeric variables

## Author

Anshath Ahamed - anshath7@gmail.com

## License

This project is for educational purposes.

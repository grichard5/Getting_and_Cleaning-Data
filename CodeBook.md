Script run_analysis.R performs the following steps to the input data and writes out a cleaned data set:


Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Additional information about where the data was obtained:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Program Assumptions

• This program assumes the necessary files have been downloaded to local working directory and uncompressed 
• Program assumes that the 'reshape2' package has been installed



• 1.  Reads the ./features.txt file of all measurements.  Features contains the 561 features or measurements that will be used to apply names to the the training and test X data sets. 

• 2.  Read the ./activity_labels.txt file of activity ids and activity descriptions.  Activity names will be used to populate the cleaned dataset with descriptive names
          Activity_ID          Activity_Name
          1                    WALKING
          2                    WALKING_UPSTAIRS
          3                    WALKING_DOWNSTAIRS
          4                    SITTING
          5                    STANDING
          6                    LAYING

• 3.  Read the ./train/X_train.txt file, the ./test/X_test.txt file, and merge them together resulting in a merged dataset of 10299 rows and 561 columns of measures. The column names are derived from the features data set which contains the 561 measures. 

• 4.  Read the ./train/y_train.txt file, the ./test/y_test.txt file, and merge them together resulting in a merged dataset of 10299 rows and 1 column of activities.  Sample output

          Activity_Name
          5
          5
          5

• 5.  Read the ./train/subject_train.tex file, the ./test/subject_test.txt 
      file, and merge them together resulting in a merged dataset of 10299
      rows and 1 column of subject ids.  Sample output:

          Subject
          1
          1
          1

• 6.  Subset the features data frame and extract those features of mean 
      and standard deviation

• 7.  Use the subset of features (step 6) to select only those features 
      from the      merged dataset of measures (step 3) creating a data 
      frame of 10299 rows and 66 columns

• 8.  Updated the activity labels on the merged file of activities (step
      4) to meaningful names

• 9.  Merge the subsetted dataset of measures (step 7) with the merged set
      of subjects and activities.  Data frame contains column Subject,
      Activity Names and 66 columns of mean and standard deviation
      Measures

• 10. Melts the dataset from step 9 into individual measure observations 

• 11. Recasts the data "wide" using dcast, applying the mean function to 
      all 66 measurement variables

• 12. Writes out the data set from step 11 as a tab separated text file.


---
title: "Tidy Data for Human Activity Recognization Using Smartphones"
author: "Ken Lee"
date: "October 24, 2015"
output: html_document
---

#Study Design#
For this tidy data, we have selected all features containing mean() and std(). Each row represents a unique combination of subject and an activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and the average for each features. Below is a list of the variables.


#Cookbook

Features 1 and 2:

1. **subject.id**       subject unique identifier.
2. **activity.name**    name of the activity the subject is performing. 

Features 3 to 60, each variable below has a corresponding y and z components in additional to x:

3. **tBodyAcc.mean.x**  mean total body acceleration on the x dimension
4. **tBodyAcc.std.x**   standard deviation body acceleration on the x dimension
5. **tGravityAcc.mean.x** mean total gravity acceleration on the x dimension
6. **tGravityAcc.std.x**        standard deviation gravity acceleration on the x dimension
7. **tBodyAccJerk.mean.x** mean total body acceleration jerk on the x dimension
8. **tBodyAccJerk.std.x**       standard deviation body acceleration jerk on the x dimension
9. **tBodyGyro.mean.x** mean total body gyro on the x dimension
10. **tBodyGyro.std.x** standard deivation body gyro on the x dimesion
11. **tBodyGyroJerk.mean.x**    mean total body Gyro Jerk on the x dimension
12. **tBodyGyroJerk.std.x**     standard deviation body Gyro Jerk on the x dimension

Features 33 to 42:

13. **tBobyAccMag.mean**        mean total body acceleration magnitude
14. **tBodyAccMag.std**         standard deiviation total body acceleration magitude.
15. **tGravityAccMag.mean**     mean total gravity acceleration magnitude
16. **tGravityAccMag.std**      standard deviation total body gravity acceleration magitude
17. **tBodyAccJerkMag.mean**    mean total body acceleration jerk magnitude
18. **tBodyAccJerkMag.std**     standard deviation total body acceleration jerk magitude
19. **tBodyGyroMag.mean**       mean total body Gyro magitude
20. **tBodyGyroMag.std**        standard deviation total body Gyro magitude
21. **tBodyGyroJerkMag.mean**   mean total body Gyro Jerk magitude
22. **tBodyGyroJerkMag.std**    standard deviation total body Gyro Jerk magitud

Features 43 to 60, each variable below has a corresponding y and z components in additional to x:

23. **fBodyAcc.mean.x**         same as total but f denotes frequency
24. **fBodyAcc.std.x**          same as total but f denotes frequency
25. **fBodyAccJerk.mean.x**     same as total but f denotes frequency
26. **fBodyAccJerk.std.x**      same as total but f denotes frequency
27. **fBodyGyro.mean.x**        same as total but f denotes frequency
28. **fBodyGyro.std.x**         same as total but f denotes frequency

Features 61 to 68:

29. **fBodyAccMag.mean**        same as total but f denotes frequency
30. **fBodyAccMag.std**         same as total but f denotes frequency
31. **fBodyAccJerkMag.mean**    same as total but f denotes frequency
32. **fBodyAccJerkMag.std**     same as total but f denotes frequency
33. **fBodyGyroMag.mean**       same as total but f denotes frequency
34. **fBodyGyroMag.std**        same as total but f denotes frequency
35. **fBodyGyroJerkMag.mean**   same as total but f denotes frequency
36. **fBodyGyroJerkMag.std**    same as total but f denotes frequency



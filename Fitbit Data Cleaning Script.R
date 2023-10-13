daily_activity <- read.csv("Excel Files/dailyActivity_merged.csv")
daily_sleep <- read.csv("Excel Files/sleepDay_merged.csv")
weight_log <- read_csv("Excel Files/weightLogInfo_merged.csv")

#seeing what I am dealing with
str(daily_activity)
str(daily_sleep)
str(weight_log)

#cleaning column names
daily_activity <- clean_names(daily_activity)
daily_sleep <- clean_names(daily_sleep)
weight_log <- clean_names(weight_log)

#changing format of data
daily_activity$activity_date <- as.Date(daily_activity$activity_date, '%m/%d/%y')
daily_sleep$sleep_day <- as.Date(daily_sleep$sleep_day, '%m/%d/%y')
weight_log$date <- parse_date_time(weight_log$date, '%m/%d/%y %H:%M:%S %p')
weight_log$is_manual_report <- as.logical(weight_log$is_manual_report)


#checking everything is correct
str(daily_activity)
str(daily_sleep)
str(weight_log)

#cleaning daily_activity
daily_activity <- daily_activity[!(daily_activity$calories<=0),]
daily_activity <- daily_activity[!(daily_activity$total_steps<=0),]
daily_activity <- daily_activity %>%
  +     select(-c(tracker_distance))
names(daily_activity)[names(daily_activity) == "total_distance"] <- "distance_mi"
daily_activity$week_day <- wday(daily_activity_cln$activity_date, label = T, abbr = T)
daily_activity_cln <- daily_activity

#cleaning daily_sleep
daily_sleep$hours_asleep = round((daily_sleep$total_minutes_asleep)/60)
daily_sleep$week_day <- wday(daily_sleep$sleep_day, label = T, abbr = T)

#cleaning weight_log 
weight_log <- weight_log %>%
  +          select(-c(fat))







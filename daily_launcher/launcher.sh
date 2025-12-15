#!/bin/bash

today=$(date +%Y-%m-%d)
last_run=$(cat /home/acktone/ritah/coding_routine/daily_launcher/last_run.txt)

if [ "$today" = "$last_run" ]; then
    exit 0
fi

mkdir -p /home/acktone/ritah/coding_routine/daily_tasks/$today

counter=$(cat /home/acktone/ritah/coding_routine/daily_launcher/assignment_counter.txt)

assignment_file=/home/acktone/ritah/coding_routine/assignments/day${counter}.txt

if [ -f "$assignment_file" ]; then
    cp "$assignment_file"  /home/acktone/ritah/coding_routine/daily_tasks/$today/assignment.txt
    echo "Today"s assignment:
    cat "$assignment_file"
    next=$((counter + 1))
    echo "$next" > /home/acktone/ritah/coding_routine/daily_launcher/assignment_counter.txt
else
    echo "No assignments file found for day $counter."
    echo "Please add more assignments to  /home/acktone/ritah/coding_routine/assignments/"
fi

echo "Good morning Ritah - here is your daily coding assignment!"

echo "$today - Daily routine started" >> /home/acktone/ritah/coding_routine/daily_launcher/log.txt

echo "$today" >  /home/acktone/ritah/coding_routine/daily_launcher/last_run.txt

cd  /home/acktone/ritah/coding_routine/daily_tasks/$today


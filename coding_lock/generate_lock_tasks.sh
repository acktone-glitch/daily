#!/bin/bash

TASK_DIR="coding_lock/lock_tasks"
mkdir -p "$TASK_DIR"

# Array of 30 mixed Python + Bash tasks
tasks=(
"Write a Python function that returns the reverse of a string."
"Write a Python script that prints numbers 1–20 using a loop."
"Create a Python dictionary of 3 fruits and their colors, then print each pair."
"Write a Python function that checks if a number is even or odd."
"Write a Python script that reads a text file and prints the number of lines."
"Create a Python list of 5 names and print only those starting with 'A'."
"Write a Python function that returns the sum of all numbers in a list."
"Write a Python script that asks for user input and prints it in uppercase."
"Create a nested Python dictionary and access a deeply nested value."
"Write a Python function that counts vowels in a string."
"Write a Python script that prints the first 10 Fibonacci numbers."
"Write a Python function that removes duplicates from a list."
"Write a Python script that sorts a list of integers without using sort()."
"Write a Python function that checks if a word is a palindrome."
"Write a Python script that prints a multiplication table for numbers 1–5."

"Write a Bash script that prints the current date and time."
"Create a Bash loop that prints numbers 1–15."
"Write a Bash script that checks if a file exists."
"Write a Bash script that counts the number of lines in a file."
"Write a Bash script that echoes 'Hello Ritah' 5 times."
"Write a Bash script that lists all .txt files in a directory."
"Write a Bash script that takes a name as an argument and greets them."
"Write a Bash script that prints the size of every file in the current directory."
"Write a Bash script that renames all .txt files to .bak."
"Write a Bash script that prints the first 3 lines of any file passed as an argument."
"Write a Bash script that checks if a directory exists, and creates it if not."
"Write a Bash script that prints the number of running processes."
"Write a Bash script that appends a timestamp to a log file."
"Write a Bash script that prints your system’s hostname."
"Write a Bash script that loops through all files and prints their permissions."
)

# Write each task into its own file
count=1
for task in "${tasks[@]}"; do
    echo "$task" > "$TASK_DIR/task${count}.txt"
    echo "Created task${count}.txt"
    count=$((count+1))
done

echo "All 30 lock tasks generated successfully!"

#!/bin/bash

LOCK_DIR="$home/acktone/ritah/coding_routine/coding_lock"
TASK_DIR="$LOCK_DIR/lock_tasks"
LOG_DIR="$LOCK_DIR/lock_logs"
QUOTE_FILE="$LOCK_DIR/quotes/quotes.txt"

mkdir -p "$LOG_DIR"

TIME_LOG="$LOG_DIR/time_log.txt"
COMP_LOG="$LOG_DIR/completion_log.txt"

# Pick a random task file
TASK_FILE=$(ls "$TASK_DIR" | shuf -n 1)
TASK_PATH="$TASK_DIR/$TASK_FILE"

# Pick a random quote
QUOTE=$(shuf -n 1 "$QUOTE_FILE")

clear
echo "===================================================="
echo "              RITAH'S CODING LOCK SCREEN"
echo "===================================================="
echo ""
echo "Today's Lock Task: $TASK_FILE"
echo "----------------------------------------------------"
cat "$TASK_PATH"
echo "----------------------------------------------------"
echo ""
echo "Motivation for today:"
echo "\"$QUOTE\""
echo ""
echo "Type 'done' when you have completed this task."
echo ""

# Start timer
START_TIME=$(date +%s)

while true; do
    read -p "> " INPUT
    if [ "$INPUT" = "done" ]; then
        END_TIME=$(date +%s)
        ELAPSED=$(( (END_TIME - START_TIME) / 60 ))

        echo "$(date): Completed $TASK_FILE in $ELAPSED minutes" >> "$TIME_LOG"
        echo "$(date): $TASK_FILE" >> "$COMP_LOG"

        # Auto GitHub push
        cd "$LOCK_DIR"
        git add .
        git commit -m "Completed lock task: $TASK_FILE"
        git push

        echo ""
        echo "Great work, Ritah. Session unlocked."
        echo "Time spent: $ELAPSED minutes"
        echo ""
        break
    else
        echo "Not yet. Type 'done' when finished."
    fi
done

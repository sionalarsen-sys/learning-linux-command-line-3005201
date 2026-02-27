#!/bin/bash

# Clear the screen to make it look professional
clear

# Define the file name in a variable so it's easy to change later
TIPS_FILE="tips.txt"
DIARY="writing_diary.txt"
# Loop begins here
while true; do
    echo "----------------------------------------------------"

echo "--- WRITER'S BLOCK ASSISTANT ---"

# This captures the user's input into the variable 'BLOCK'
read -p "What's stalling your story? (Vent & press Enter; or type 'quit' to exit): " BLOCK

# Check if the user wants to exit
    if [[ "$BLOCK" == "quit" ]]; then
        echo "Good luck with the writing! Goodbye."
        break
    fi

    # Wit Check: Did they type nothing?
    if [[ -z "$BLOCK" ]]; then
        echo "You didn't type anything! Are you staring at a blank page again?"
        continue # This skips the rest of the loop and starts over at the top
    fi

echo -n "."
sleep 0.5
echo -n "."
sleep 0.5
echo -n "."
sleep 0.5
echo ""

# Pull the random response
    if [[ -f "$TIPS_FILE" ]]; then
        RESPONSE=$(shuf -n 1 "$TIPS_FILE")

#  Generate the Timestamp
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
# 1. Show it to the user
        echo ">>> $RESPONSE"

# 2. Save it to the diary (The 'Variable' way makes this possible!)
        echo "[$TIMESTAMP] Input: $BLOCK | Muse: $RESPONSE" >> writing_diary.txt
    else
        echo "Error: $TIPS_FILE not found."
        break
    fi
done

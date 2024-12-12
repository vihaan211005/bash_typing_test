#!/bin/bash

# Function to measure time
function typing_test() {
    # List of sentences to choose from
    local sentences=(
        "The quick brown fox jumps over the lazy dog."
        "Hello, world! This is a typing speed test."
        "Bash scripting is fun and powerful."
        "Typing fast can help increase productivity."
        "Speed is not everything, accuracy is important too."
    )

    # Choose a random sentence
    local sentence="${sentences[$RANDOM % ${#sentences[@]}]}"

    echo "Type the following sentence:"
    echo
    echo "$sentence"
    echo
    echo "Press [Enter] when you're ready to start..."

    # Wait for the user to press Enter
    read -p ""

    # Start timer
    start_time=$(date +%s)

    # Prompt user to type the sentence
    echo "Start typing..."
    read -r user_input

    # End timer
    end_time=$(date +%s)

    # Calculate time taken
    time_taken=$((end_time - start_time))

    # Calculate word count
    word_count=$(echo "$user_input" | wc -w)

    # Calculate words per minute (WPM)
    if [ $((time_taken)) == 0 ]; then
        wpm=∞
    else
        wpm=$((word_count * 60 / time_taken))
    fi

    # Check if the user typed the sentence correctly
    if [ "$user_input" == "$sentence" ]; then
        echo "Great job!"
    else
        echo "Oops! You made some mistakes."
    fi

    echo "Time taken: $time_taken seconds"
    echo "Words per minute: $wpm WPM"
}

# Run the typing test
typing_test

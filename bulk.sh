#!/bin/bash

# Path to your whisper model
MODEL_PATH="models/ggml-base.en.bin"

# Path to your samples folder
SAMPLES_DIR="./samples"
OUTPUT_DIR="$SAMPLES_DIR/output"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through all .wav files in the samples directory
for audio_file in "$SAMPLES_DIR"/*.wav; do
    # Get the base name of the audio file (without the extension)
    base_name=$(basename "$audio_file" .wav)
    
    # Output text file path
    output_file="$OUTPUT_DIR/$base_name.txt"

    # Run whisper.cpp for each audio file and save the output to the corresponding text file
    ./main -m "$MODEL_PATH" -f "$audio_file" -otxt -of "$OUTPUT_DIR/$base_name"

    echo "Transcription saved to $output_file"
done

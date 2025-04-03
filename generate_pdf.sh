#!/bin/bash

LOG_FILE="./pdf_generation.log"
CONVERTED_DIR="$(mktemp -d)"
TOTAL_DIRS=0
TOTAL_IMAGES=0
TOTAL_PDFS=0
ERRORS=0
START_TIME=$(date +%s)

# Function to log messages with a timestamp
log_message() {
	local message="$1"
	echo "$(date +'%Y-%m-%d %H:%M:%S') - $message" | tee -a "$LOG_FILE"
}

# Check if img2pdf is installed
if ! command -v img2pdf &>/dev/null; then
	log_message "🛠 img2pdf not found. Installing..."
	if sudo apt-get update && sudo apt-get install -y img2pdf; then
		log_message "✅ img2pdf installed successfully."
	else
		log_message " Error installing img2pdf"
		exit 1
	fi
fi
log_message "✅ img2pdf is installed."

# Check if ImageMagick is installed (for conversion)
if ! command -v convert &>/dev/null; then
	log_message "🛠 ImageMagick not found. Installing..."
	if sudo apt-get update && sudo apt-get install -y imagemagick; then
		log_message "✅ ImageMagick installed successfully."
	else
		log_message "❌ Error installing ImageMagick"
		exit 1
	fi
fi
log_message "✅ ImageMagick is installed."

# Image formats compatible with img2pdf
COMPATIBLE_EXT="jpg jpeg png tiff" # Do NOT change this
# Formats requiring prior conversion
INCOMPATIBLE_EXT="bmp webp gif svg"

# Create a directory for converted images if it does not exist
mkdir -p "$CONVERTED_DIR"

# Function to process directories without subdirectories
process_directory() {
	local dir="$1"
	local output_pdf
	output_pdf="$dir/$(basename "$dir").pdf"

	log_message "📂 Processing directory: $dir"
	((TOTAL_DIRS++))

	# Find compatible images and convert incompatible ones
	images=()
	while IFS= read -r file; do
		ext="${file##*.}"
		ext="${ext,,}" # Convert extension to lowercase

		if [[ " $COMPATIBLE_EXT " =~ $ext ]]; then
			# Compatible image, use directly
			images+=("$file")
		elif [[ " $INCOMPATIBLE_EXT " =~ $ext ]]; then
			# Incompatible image, convert to PNG
			converted_file="$CONVERTED_DIR/$(basename "$file").png"
			log_message "🔄 Converting $file → $converted_file"
			if convert "$file" "$converted_file"; then
				images+=("$converted_file")
				log_message "✅ Successfully converted: $converted_file"
			else
				log_message "❌ Error converting $file"
				((ERRORS++))
			fi
		fi
	done < <(find "$dir" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.tiff" -o -iname "*.bmp" -o -iname "*.webp" -o -iname "*.gif" -o -iname "*.svg" \) | sort)

	# If images are found, generate the PDF
	if [ ${#images[@]} -gt 0 ]; then
		log_message "📸 Found ${#images[@]} images in $dir."
		((TOTAL_IMAGES += ${#images[@]}))
		log_message "📄 Creating PDF: $output_pdf"

		if img2pdf "${images[@]}" -o "$output_pdf"; then
			log_message "✅ PDF successfully created: $output_pdf"
			((TOTAL_PDFS++))
		else
			log_message "❌ Error generating PDF in $dir"
			((ERRORS++))
		fi
	else
		log_message "⚠️ No images found in $dir. Skipping..."
	fi
}

log_message "📂 Converted images directory: $CONVERTED_DIR"

# Iterate through all subdirectories
log_message "🔍 Searching for directories without subdirectories..."
while IFS= read -r -d '' dir; do
	if [[ "$dir" == "." || "$dir" == ".." ]]; then
		continue
	fi
	process_directory "$dir"
done < <(find . -type d -print0)

# Remove the temporary converted images directory upon completion
if [ -d "$CONVERTED_DIR" ]; then
	log_message "🗑️ Removing temporary converted images..."
	rm -rf "$CONVERTED_DIR"
	log_message "✅ Converted images directory removed."
fi

END_TIME=$(date +%s)
EXECUTION_TIME=$((END_TIME - START_TIME))

# Display final summary
log_message "========================================="
log_message "📊 FINAL SUMMARY:"
log_message "📂 Directories processed: $TOTAL_DIRS"
log_message "📸 Images converted: $TOTAL_IMAGES"
log_message "📄 PDFs generated: $TOTAL_PDFS"
log_message "❌ Errors: $ERRORS"
log_message "⏳ Execution Time: $(date -u -d @$EXECUTION_TIME +'%H:%M:%S')"
log_message "✅ Process completed. Check the log: $LOG_FILE"
log_message "========================================="

#!/bin/bash

# Function to check and install dependencies on macOS
function check_dependencies() {
    # Check if g++ is installed
    if ! command -v g++ &> /dev/null; then
        echo "g++ not found, installing with Homebrew..."
        brew install gcc
    fi

    # Check if screencapture command is available
    if ! command -v screencapture &> /dev/null; then
        echo "'screencapture' command is missing. This is built-in to macOS, so please check your macOS installation."
        exit 1
    fi

    # Check for python-docx installation
    if ! python3 -c "import docx" &> /dev/null; then
        echo "Installing python-docx..."
        pip3 install --user python-docx
    fi

    # Check for zip installation (default in macOS)
    if ! command -v zip &> /dev/null; then
        echo "zip command not found. Please install it."
        exit 1
    fi
}

# Run dependency checks
check_dependencies

# Path to Desktop
DESKTOP="${HOME}/Desktop"

# Check if the codes directory exists
if [ ! -d "${DESKTOP}/ass_test/codes" ]; then
    echo "Error: The directory '${DESKTOP}/ass_test/codes' does not exist."
    exit 1
fi

echo "Your roll no: "
read roll_no
echo "Your name: "
read name

count=$(find "${DESKTOP}/ass_test/codes" -type f -name "*.cpp" | wc -l)
echo "Number of C++ files found: $count"

mkdir -p "${DESKTOP}/ass_test/outputs"
FOLDER="${DESKTOP}/ass_test/outputs"

# Compile and execute each C++ file, taking screenshots of the output
for (( i=1; i<=$count; i++ ))
do
    g++ "${DESKTOP}/ass_test/codes/q$i.cpp" -o "${DESKTOP}/ass_test/codes/a.out"
    if [ $? -eq 0 ]; then
        "${DESKTOP}/ass_test/codes/a.out" > "${FOLDER}/OUTPUT_$i.txt"
        FILENAME="OUTPUT_$i.png"
        sleep 1
        screencapture -x "$FOLDER/$FILENAME"
        echo "Screenshot saved as $FOLDER/$FILENAME"
    else
        echo "Compilation failed for q$i.cpp"
    fi
done

# Move and rename directory
mv "${DESKTOP}/ass_test" "${DESKTOP}/24mcf1r19_kartik" || { echo "Error moving directory"; exit 1; }
mkdir -p "${DESKTOP}/ass_test"
cp -rv "${DESKTOP}/24mcf1r19_kartik/codes" "${DESKTOP}/ass_test"

# Run the Python script to generate the docx file
python3 ${HOME}/automation/generate_doc.py || { echo "Python script failed"; exit 1; }

# Validate the generated file before moving it
if [ ! -f "Code_and_Output_Document.docx" ]; then
    echo "Error: Code_and_Output_Document.docx not generated."
    exit 1
fi

cd "$DESKTOP"
mv "${DESKTOP}/24mcf1r19_kartik" "${DESKTOP}/24mcf1r${roll_no}_${name}"
zip -r "24mcf1r${roll_no}_${name}.zip" "24mcf1r${roll_no}_${name}"
mv "Code_and_Output_Document.docx" "24mcf1r${roll_no}_${name}.docx"

echo "Task completed successfully!"

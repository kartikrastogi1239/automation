
# mkcpp

## Overview
This project automates the compilation of C++ code, takes screenshots of the outputs, and generates a DOCX file containing the results. It is designed to make it easy for MCA students at NIT Warangal (NITW) to run multiple C++ programs and document their outputs efficiently.

## For My Friends at NITW
"MCA life here is a battlefield, and in this warzone, consider me your divine ally, sent to save you precious time and keep your chariot charging forward."

## Features
- **Automated Compilation:** Compiles multiple C++ source files in a given directory.
- **Output Capture:** Takes screenshots of program outputs automatically.
- **Report Generation:** Creates a DOCX report that includes all the results and output screenshots.
- **File Compression:** Packages all relevant files and results into a zip archive.

## Prerequisites
Before using this project, ensure that your system meets the following requirements:
- **Operating System:** A Unix-like operating system (Linux or macOS).
- **Python Version:** Python 3.6 or higher.
- **C++ Compiler:** `g++` (GNU C++ Compiler).
- **Screenshot Tool:** `scrot` (Linux) or `screencapture` (macOS).
- **Python Library:** `python-docx` (used for generating DOCX files).
- **File Compression Utility:** `zip` (used for compressing files).

## Installation

### Linux

1. **Download the Project:**
   Use the following `curl` command to download the project directly from GitHub:

   ```bash
   curl -L https://github.com/kartikrastogi1239/automation/archive/refs/heads/main.zip -o automation.zip
   unzip automation.zip
   ```

2. **Install Required Dependencies:**
   ```bash
   sudo apt-get install g++ scrot zip -y
   pip3 install --user python-docx
   ```

### macOS

1. **Download the Project:**
   Use the following `curl` command to download the project directly from GitHub:

   ```bash
   curl -L https://github.com/kartikrastogi1239/automation/archive/refs/heads/main.zip -o automation.zip
   unzip automation.zip
   ```

2. **Install Required Dependencies using Homebrew:**
   ```bash
   brew install gcc zip
   pip3 install --user python-docx
   ```

3. macOS comes with a built-in tool for screenshots, so there is no need to install `scrot`. The script uses the `screencapture` command instead.

## Usage

1. **Navigate to the Project Directory:**
   ```bash
   cd automation-main  # Change directory to the unzipped folder
   ```

2. **Make the Script Executable:**
   ```bash
   chmod +x mkcpp.sh
   ```

3. **Run the Script:**
   ```bash
   ./mkcpp.sh
   ```

   The script will prompt you to enter your roll number and name. It will then compile all the C++ files in the specified directory, take screenshots of the program outputs, generate a DOCX file, and create a compressed zip archive containing all the files.

## Additional Information
- Ensure that the C++ source files you want to compile are located in the `Desktop/ass_test/codes` directory.
- The script is designed to handle multiple C++ files named sequentially as `q1.cpp`, `q2.cpp`, etc.
- Screenshots of each compiled program’s output will be saved in the `outputs` directory.
- The generated DOCX file and all related files will be packaged into a zip archive for easy sharing.

## Troubleshooting
If you encounter any issues or errors, consider the following:
- Ensure all required packages and dependencies are installed (`g++`, `scrot` (for Linux), `screencapture` (for macOS), `python-docx`, `zip`).
- Verify that the correct permissions are set for the script (`chmod +x mkcpp.sh`).
- Make sure the C++ source files are properly named and located in the expected directory.

## Contributions
If you’d like to contribute to this project, feel free to submit a pull request or report issues on GitHub. All contributions are welcome!

### BUY ME A COFFEE IF THIS WORKED OUT AND SAVED YOU FROM CREATING DUMBASS DOC FILES, RENUMBERING SCREENSHOTS, AND WASTING YOUR TIME ON THIS CHAOTIC HUSTLE

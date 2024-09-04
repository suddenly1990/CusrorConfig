# CursorConfig

CursorConfig is a simple tool for automatically configuring Cursor AI editor rule files to enhance your coding efficiency.

## Background

Cursor AI editor has recently gained popularity due to its powerful AI-assisted features. To better utilize Cursor, this project provides an automated script for setting up custom rules and daily work summaries.

Key features:

1. Automatically create and configure `.cursorrules` files, based on suggestions from [cursor.directory](https://cursor.directory).
2. Integrate daily work summary functionality, inspired by [this GitHub Gist](https://gist.github.com/zbeyens/7c6ae2fc70c82a39cb5098c633b299f9).

Currently supports configuration for Swift and Solidity languages.

## Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/CursorConfig.git
   ```
2. Navigate to the project directory:
   ```
   cd CursorConfig
   ```
3. Give the script execution permissions:
   ```
   chmod a+x setup_ai_rules.sh
   ```

## Usage

1. Run the script:
   ```
   ./setup_ai_rules.sh
   ```
2. Follow the prompts to enter your project's root directory path.
3. Select the language you want to configure (Swift or Solidity).

The script will automatically copy the appropriate `.cursorrules` file and `.ai` folder to your specified project directory.

## Customization

If you need to add support for other languages, you can modify the `setup_ai_rules.sh` script and add corresponding `.cursorrules` files.

## Contributing

Pull requests are welcome to improve this project. If you have any suggestions or find a bug, please create an Issue.

## License

[MIT License](LICENSE)

## Acknowledgements

- [cursor.directory](https://cursor.directory) for Cursor rule suggestions.
- [zbeyens](https://gist.github.com/zbeyens) for the daily work summary method.

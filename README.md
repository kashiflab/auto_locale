# AutoLocale

**AutoLocale** is a Dart package that automates the localization process for Flutter applications. It translates JSON localization files into multiple languages using the Google Translate API and generates necessary localization files automatically.

## Features
- Automatically fetches and translates localization strings.
- Supports multiple target languages at once.
- Generates JSON localization files in the appropriate directories.
- Works as a command-line tool—just install and run!

## Installation

Add AutoLocale to your **pubspec.yaml**:
```yaml
  auto_locale:
    path: ../../auto_locale  # Use actual package path or add from pub.dev when available
```

Then run:
```sh
dart pub get
```

## Usage
Once installed, navigate to your project root and run:
```sh
dart run auto_locale
```

### Steps:
1. It will prompt you to enter the **path of your localization JSON file** (e.g., `assets/lang/en.json`).
2. Enter the **source language code** (e.g., `en`).
3. Enter the **target languages** as a comma-separated list (e.g., `fr,de,es`).
4. AutoLocale will generate translated JSON files for each target language.

### Example Input
```
Enter the path of your localization JSON file: assets/lang/en.json
Enter the source language (e.g., en): en
Enter target languages (comma-separated, e.g., fr,de,es): fr,de,es
```

### Example Output
After execution, your project will contain:
```
assets/lang/
  ├── en.json
  ├── fr.json
  ├── de.json
  ├── es.json
```
Each file contains the translated localization keys.

## Example JSON Format
Your source `en.json` file should look like this:
```json
{
  "hello": "Hello",
  "welcome": "Welcome",
  "goodbye": "Goodbye"
}
```

Generated `fr.json` file (translated):
```json
{
  "hello": "Bonjour",
  "welcome": "Bienvenue",
  "goodbye": "Au revoir"
}
```

## Error Handling
- If the source file is not found, it throws an error.
- If translation fails, it logs an appropriate message.

## Roadmap
- Support for ARB file format.
- Add YAML format support.
- Improve caching mechanism for repeated translations.

## License
MIT License. Free to use and modify.


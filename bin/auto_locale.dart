import 'dart:io';
import 'package:auto_locale/auto_locale.dart';

void main(List<String> arguments) async {
  print("🔹 AutoLocale - Automate Localization in Flutter");

  stdout.write("Enter the path of your localization JSON file: ");
  String? filePath = stdin.readLineSync();

  stdout.write("Enter the source language (e.g., en): ");
  String? sourceLang = stdin.readLineSync();

  stdout.write("Enter target languages (comma-separated, e.g., fr,de,es): ");
  String? targetLangs = stdin.readLineSync();

  if (filePath == null ||
      sourceLang == null ||
      targetLangs == null ||
      filePath.isEmpty ||
      sourceLang.isEmpty ||
      targetLangs.isEmpty) {
    print("❌ Error: All fields are required!");
    return;
  }

  List<String> targetLanguages =
      targetLangs.split(',').map((e) => e.trim()).toList();

  try {
    TranslationApi api = TranslationApi();
    TranslationRepository repository =
        TranslationRepository(api, LocaleStorage());
    await repository.translateAndStore(filePath, sourceLang, targetLanguages);
    print("✅ All locale files generated successfully!");
  } catch (e) {
    print("❌ Error: $e");
  }
}

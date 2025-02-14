import 'dart:io';
import 'package:auto_locale/src/api/translation_api.dart';
import 'package:auto_locale/src/data/translation_repository.dart';
import 'package:auto_locale/src/storage/locale_storage.dart';

void main() async {
  final api = TranslationApi();
  final storage = LocaleStorage();
  final repo = TranslationRepository(api, storage);

  print("Enter the path of the locale file (e.g., assets/locales/en.json): ");
  String? filePath = stdin.readLineSync();

  String? sourceLang;
  if (filePath != null) {
    final fileName = filePath.split('/').last;
    sourceLang = fileName.split('.').first;
    print("Detected source language code: $sourceLang");
  } else {
    print("Invalid file path!");
  }

  print("Enter the target language code (e.g., ar, de, fr): ");
  String? targetLang = stdin.readLineSync();

  if (filePath != null && sourceLang != null && targetLang != null) {
    try {
      await repo.translateAndStore(filePath, sourceLang, [targetLang]);
      print("Translation completed! Check the generated file.");
    } catch (e) {
      print("Error: $e");
    }
  } else {
    print("Invalid input! Please enter valid values.");
  }
}

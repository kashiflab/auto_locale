import 'dart:io';

class FileFactory {
  static File createFile(String filePath, String locale) {
    final dir = Directory(filePath.substring(0, filePath.lastIndexOf('/')));
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    return File('${dir.path}/${locale}.json');
  }
}

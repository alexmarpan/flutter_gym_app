import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void createFile(Map<String, dynamic> content, Directory dir, String fileName) {
  File file = File('${dir.path}/$fileName');
  file.createSync();
  file.writeAsStringSync(json.encode(content));
}

void writeToFile(String fileName, Map<String, dynamic> content) {
  getApplicationDocumentsDirectory().then((Directory directory) {
    createFile(content, directory, fileName);
  });
}

import 'dart:io';
import 'package:process_run/shell.dart';

void pushToGitHub() async {
  var shell = Shell();

  try {
    await shell.run('''
      git init
      git remote add origin https://github.com/AdelMagdy22/Sneakers-Shop.git
      git add .
      git commit -m "Initial commit"
      git push -u origin master
    ''');
  } catch (e) {
    print('Error: $e');
  }
}
import 'package:flutter/material.dart';
import 'package:inggris_untuk_anak/data/alphabet.dart';
import 'package:inggris_untuk_anak/data/animal.dart';
import 'package:inggris_untuk_anak/data/fruit.dart';
import 'package:inggris_untuk_anak/data/number.dart';
// import 'package:inggris_untuk_anak/models/alphabets.dart';

class SoalModel extends ChangeNotifier {
  // final List alphabet = Alphabets().alphabets;
  final List alphabet = alphabetData;
  final List animal = animalsData;
  final List number = numbersData;
  final List fruit = fruitsData;
  static List total = alphabetData + animalsData + numbersData + fruitsData;
  int count = 0;
  static int countProgress = 1;

  void next() {
    count += 1;
    notifyListeners(); // Beritahu konsumen bahwa state telah diperbarui
  }

  double nextProgress(int lengths) {
    countProgress += 1;
    if(countProgress >= lengths){
      countProgress = lengths;
    }
    return countProgress/lengths * 100;
  }

  void back() {
    count -= 1;
    if(count == -1){
      count = alphabet.length;
    }
    notifyListeners(); // Beritahu konsumen bahwa state telah diperbarui
  }

  void reset() {
    count = 0;
    notifyListeners(); // Beritahu konsumen bahwa state telah diperbarui
  }

  void printProgress() {
    // double countProgressPercent = countProgress/total.length * 100;
    // return countProgressPercent;
  }
}

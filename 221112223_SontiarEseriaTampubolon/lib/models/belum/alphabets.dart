import 'package:english_for_kids/models/belum/alphabet.dart';
import 'package:english_for_kids/data/alphabet.dart';

class Alphabets {
  late List<Alphabet> _alphabet;

  List<Alphabet> get alphabets => _alphabet;

  Alphabets() {
    _alphabet = [
      ...alphabetData.map((e) =>
          Alphabet(nama: e["nama"], lafal: e["lafal"], gambar: e["gambar"]))
    ];
  }
}

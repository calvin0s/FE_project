import 'package:inggris_untuk_anak/models/belum/alphabet.dart';
import 'package:inggris_untuk_anak/data/alphabet.dart';

class Alphabets {
  late List<Alphabet> _alphabet;
  
  List<Alphabet> get alphabets => _alphabet;

  Alphabets() {
    _alphabet = [
      ...alphabetData.map(
        (e)=>Alphabet(
          nama: e["nama"],
          lafal: e["lafal"],
          gambar: e["gambar"]
        )
      )
    ];
  }
}
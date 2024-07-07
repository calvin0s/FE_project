import 'package:flutter/material.dart';
import 'package:inggris_untuk_anak/models/soal_model.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
        body: Consumer<SoalModel>(
        builder: (context, soalModel, child) {
        return Text("${SoalModel.countProgress / SoalModel.total.length}%");
      })
    );
  }
}

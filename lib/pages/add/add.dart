import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rombak_files/bloc/export.dart';
import 'package:rombak_files/models/models.dart';

// ignore: must_be_immutable
class AddPages extends StatelessWidget {
  AddPages({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text('Nama')),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: descriptionsController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text('Descripsi')),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<UserBloc>().add(AddUser(
                    userModel: UserModel(
                        id: Random().nextInt(100),
                        name: nameController.text,
                        descriptions: descriptionsController.text)));
                        Navigator.pop(context);
              },
              child: const Text('Submit'))
        ],
      ),
    );
  }
}

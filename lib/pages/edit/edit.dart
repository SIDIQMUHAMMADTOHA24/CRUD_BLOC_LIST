import 'package:flutter/material.dart';
import 'package:rombak_files/bloc/export.dart';
import 'package:rombak_files/models/models.dart';

class EditPages extends StatelessWidget {
  EditPages({super.key, required this.userModel});

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionsController = TextEditingController();
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    nameController.text = userModel.name;
    descriptionsController.text = userModel.descriptions;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Data'),
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
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text('Descripsi')),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<UserBloc>().add(EditUser(
                    userModel: UserModel(
                        id: userModel.id,
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

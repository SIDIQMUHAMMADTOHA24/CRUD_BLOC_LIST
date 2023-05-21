import 'package:flutter/material.dart';
import 'package:rombak_files/bloc/export.dart';
import 'package:rombak_files/pages/add/add.dart';
import '../edit/edit.dart';

class MyHomePages extends StatelessWidget {
  const MyHomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.allUser.isEmpty) {
            return const Center(
              child: Text('Tidak ada user'),
            );
          }
          return ListView.builder(
            itemCount: state.allUser.length,
            itemBuilder: (context, index) {
              var data = state.allUser[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPages(userModel: data),
                    )),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${data.id}'),
                  ),
                  title: Text('Name : ${data.name} '),
                  subtitle: Text('${data.descriptions}'),
                  trailing: IconButton(
                      onPressed: () {
                        context
                            .read<UserBloc>()
                            .add(DeleteUser(userModel: data));
                      },
                      icon: const Icon(Icons.delete)),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPages(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/notesdetails_screen.dart';

class NotesListScreen extends StatefulWidget {
  const NotesListScreen({Key? key}) : super(key: key);

  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Container(
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  shadowColor: Colors.amber,
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 3, bottom: 2),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.access_alarm_rounded),
                    ),
                    title: Text(
                      "NotesList $index",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      '12 Feb 2022',
                      style:
                          TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                    trailing: const Icon(Icons.delete_forever_rounded),
                    onTap: () {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'List item $index deleted..',
                        ),
                        duration: const Duration(microseconds: 1000),
                      ));
                    },
                  ),
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const NotesDetailsScreen())));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

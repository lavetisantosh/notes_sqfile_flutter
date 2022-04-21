import 'package:flutter/material.dart';

class NotesDetailsScreen extends StatefulWidget {
  const NotesDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NotesDetailsScreen> createState() => _NotesDetailsScreenState();
}

class _NotesDetailsScreenState extends State<NotesDetailsScreen> {
  final _priorites_list = ['Low', 'Medium', 'High'];
  String? dropDownValue = 'Low';
  TextEditingController _titelController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes Details',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                DropdownButton(
                    value: dropDownValue,
                    items: _priorites_list.map((items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        dropDownValue = value;
                      });
                    }),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: _titelController,
                  style: const TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: Colors.black45),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      labelText: 'Enter Title',
                      labelStyle:
                          const TextStyle(fontSize: 12, color: Colors.blueGrey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: _descriptionController,
                  style: const TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey),
                  decoration: InputDecoration(
                      labelText: 'Enter Description',
                      labelStyle:
                          const TextStyle(fontSize: 12, color: Colors.blueGrey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: const Text("Save"),
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.amber,
                            primary: Colors.blueAccent,
                            textStyle: const TextStyle(
                                fontSize: 16, color: Colors.white)),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black26,
                          primary: Colors.redAccent,
                          textStyle: const TextStyle(
                              fontSize: 16, color: Colors.white)),
                      child: const Text('Delete'),
                      onPressed: () {},
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:passing_data/names.dart';

class Listnames extends StatefulWidget {
  const Listnames({super.key});

  @override
  State<Listnames> createState() => _ListnamesState();
}

class _ListnamesState extends State<Listnames> {
  TextEditingController nameController = TextEditingController();
  TextEditingController indexController = TextEditingController();

  FocusNode fieldOne = FocusNode();
  FocusNode fieldTwo = FocusNode();
  FocusNode fieldThree = FocusNode();
  List<Names> names = List<Names>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    // Initialize the list with five default items
    names.addAll([
      Names(name: 'Alan Walker'),
      Names(name: 'Mash'),
      Names(name: 'Justin'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Names'),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(
              focusNode: fieldOne,
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onFieldSubmitted: (value) {
                fieldTwo.requestFocus();
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              focusNode: fieldTwo,
              controller: indexController,
              decoration: InputDecoration(
                hintText: 'Enter the index',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onFieldSubmitted: (value) {
                fieldThree.requestFocus();
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              focusNode: fieldThree,
              onPressed: () {
                String name = nameController.text.trim();
                int? index = int.tryParse(indexController.text.trim());

                if (name.isNotEmpty && index != null && index <= names.length) {
                  setState(() {
                    nameController.text = '';
                    indexController.text = '';
                    names.insert(index, Names(name: name));
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Invalid Index',
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    behavior: SnackBarBehavior.floating,
                  ));
                }
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[300],
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            names.isEmpty
                ? Text(
                    'Not Yet...',
                    style: TextStyle(fontSize: 20),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: names.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return ListTile(
      title: Text(names[index].name),
      tileColor: Colors.amber[100],
    );
  }
}

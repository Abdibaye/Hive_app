import 'package:flutter/material.dart';
import 'package:hive_app/boxes.dart';
import 'package:hive_app/person.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Home Page')),
      body: Center(
        child: Container(
          color: Colors.blue,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Name",
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Age",
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            boxperson.put(
                                "key_${_nameController.text}",
                                Person(
                                    name: _nameController.text,
                                    age: int.parse(_ageController.text)));
                          });
                        },
                        child: Text("Add"),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Card(
                    child: ListView.builder(
                  itemCount: boxperson.length,
                  itemBuilder: (context, index) {
                    Person person = boxperson.getAt(index);
                    return ListTile(
                        leading: IconButton(
                            onPressed: () {}, icon: Icon(Icons.remove)),
                        title: Text(person.name),
                        subtitle: const Text("Name"),
                        trailing: Text("age:  ${person.age.toString()}"));
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

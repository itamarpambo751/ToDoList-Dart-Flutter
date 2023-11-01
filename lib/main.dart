import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Lista de tarefas",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _task = TextEditingController();
  final List _toDoList = [];

  void _addToDo() {
    setState(() {
      Map<String, dynamic> newTask = Map();
      newTask["title"] = _task.text;
      newTask["ok"] = false;
      _task.text = "";
      _toDoList.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(child: TextField(
                  controller: _task,
                  decoration: const InputDecoration(
                    labelText: "Nova tarefa",
                    labelStyle: TextStyle(color: Colors.blue)
                  ),
                )),
                SizedBox(
                  height: 40.0,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
                    ),
                    onPressed: _addToDo, 
                    child: const Text("ADD")
                  ),
                )
              ],
            ),
          ),
          Expanded(child: ListView.builder(
            padding: const EdgeInsets.only(top: 20.0),
            itemCount: _toDoList.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(_toDoList[index]["title"]),
                value: _toDoList[index]["ok"],
                secondary: CircleAvatar(
                  child: Icon(_toDoList[index]["ok"] ? Icons.check : Icons.error),
                ),
                onChanged: (e) {
                  setState(() {
                    _toDoList[index]["ok"] = e;
                  });
                },
              );
            },
          ))
        ],
      ),
    );
  }
}


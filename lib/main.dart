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

  final List _items = [
    "Floriana Diogo João",
    "Nadina Neto",
    "Cristina Nvemba",
    "Alcina Paquete",
    "Miriam Peliganga"
  ];

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
                const Expanded(child: TextField(
                  decoration: InputDecoration(
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
                    onPressed: () {}, 
                    child: const Text("ADD")
                  ),
                )
              ],
            ),
          ),
          Expanded(child: ListView.builder(
            padding: const EdgeInsets.only(top: 20.0),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_items[index]),
              );
            },
          ))
        ],
      ),
    );
  }
}


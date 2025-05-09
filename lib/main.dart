import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: MyHomePage()
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String displayText = "No Text Data";

  TextEditingController textController = TextEditingController();

  List<String> tasksList = [
    "Task 1",
    "Task 2",
    "Task 3",
    "Task 4",
    "Task 5",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: false,
        title: Text("Todo App",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white ),),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Enter a task")
                  ),
                ),
              ),),

              Container(
                padding: EdgeInsets.all(10.0),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      if (textController.text.isEmpty) {
                        return;
                      }
                      tasksList.add(textController.text);
                      textController.clear();
                    });
                  },
                  color: Colors.white,
                  height: 50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Text("Add"),
                ),
              ),
            ],
          ),



          Flexible(
            child: ListView.builder(
              itemCount: tasksList.length,
                itemBuilder: (context,index){
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text("${tasksList[index]}")
                    ),
                  ),
                  MaterialButton(
                      child: Icon(Icons.delete, color: Colors.red,),
                      onPressed: () {
                        setState(() {
                          tasksList.removeAt(index);
                        });
                      }
                  ),
                ],
              );
            }),
          ),

        ],
      ),
    );
  }
}


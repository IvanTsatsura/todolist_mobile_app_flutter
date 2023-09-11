import 'package:flutter/material.dart';
/*import 'package:todolist_mobile_app/models/Task.dart';

List<Task> list = [];*/

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List tasksList = [];

  @override
  void initState() {
    super.initState();
    tasksList.addAll(['Wash the dishes', 'Solve task', 'Buy potato', 'Do sport', 'Eat vegetables']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB39DDB),
        title: const Text("Tasks list", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (BuildContext context, int index){
          return Dismissible(
              key: Key(tasksList[index]),
              child: buildTaskView(index),
              onDismissed: (direction){
                if (direction == DismissDirection.endToStart){
                  setState(() {
                    tasksList.removeAt(index);
                  });}
                else if (direction == DismissDirection.startToEnd){
                  //pass task to completed
                }
              },
          );
        }
      )
    );
  }

  Container buildTaskView(int index){
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 3),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(
          width: 2,
          color: const Color(0xFFB39DDB)
        )
      ),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(tasksList[index]),
              ) ,
              Row(
                children: <Widget>[
                  IconButton(
                    color: Colors.green,
                    icon: const Icon(Icons.done_sharp),
                    onPressed: (){
                      //pass task to completed
                    },
                  ),
                  IconButton(
                    color: Colors.redAccent,
                    icon: const Icon(Icons.delete_sharp),
                    onPressed: (){
                      setState(() {
                        tasksList.removeAt(index);
                      });
                    },
                  )
                ],
              )
            ],
          ),
    );
  }
}

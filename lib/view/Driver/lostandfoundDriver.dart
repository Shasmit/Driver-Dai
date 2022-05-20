import 'package:driver_dai_test/controller/DriverController.dart';
import 'package:driver_dai_test/utils/lostFoundInside.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:driver_dai_test/model/task_model.dart';
import '../../utils/wrapMe.dart';
import 'package:driver_dai_test/view/Driver/Driver_navigation.dart';

class lost1 extends StatefulWidget {
  const lost1({Key? key}) : super(key: key);

  @override
  _lost1State createState() => _lost1State();
}

class _lost1State extends State<lost1> {
  //get floatingActionButton => null;

  late List _tasks;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tasks = TasksModel1.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    String item = '';
    String description='';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(left: 10,top: 15),
              child: Text("Items..",style: TextStyle(fontFamily: "Dongle",fontSize: 45, color: Colors.black)),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            backgroundColor: Color(0xFFA2D2FF),
            iconTheme: IconThemeData(color: Colors.black),
            // leading: Icon(Icons.menu),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0,top: 8),
                child: IconButton(
                    icon: Icon(CupertinoIcons.add_circled, size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () =>

                        showDialog<String>
                          (context: context,
                            builder: (BuildContext context) =>
                                AlertDialog(
                                    alignment: Alignment.center,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18)
                                    ),
                                    backgroundColor: Colors.white,
                                    content: Container(height: 90,
                                      child: Column(
                                        children: [
                                          Container(height: 30,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                hintText: 'Item',
                                                border: InputBorder.none,

                                              ),
                                              onChanged: (value){
                                                item = value;

                                              },

                                              cursorColor: Colors.white,
                                            ),
                                          ),

                                          Container(height: 30,
                                            child:  TextField(
                                              decoration: InputDecoration(
                                                hintText: 'Description of item',
                                                border: InputBorder.none,
                                              ),
                                              onChanged: (value){

                                                description = value;
                                              },
                                              cursorColor: Colors.white,
                                            ),
                                          ),
                                          // ),

                                        ],
                                      ),
                                    ),
                                    contentTextStyle: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                    actions: <Widget>[
                                      Divider(color: Colors.black),
                                      Center(
                                          child: SizedBox(
                                            child: TextButton(
                                                onPressed: () {
                                                  DriverController().sendLostFound(User().getPhone(), item, description);

                                                  LostFoundInside input = LostFoundInside();

                                                  input.setItem(item);
                                                  input.setDescp(description);

                                                  // this.buildExpansionTile(2);
                                                  // runApp(lost());
                                                  // void main() => runApp(lost());

                                                  Navigator.pop(context, 'Add');
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => fare2() )
                                                  );
                                                  print("vayo");

                                                },
                                                child: Text('Add'),
                                                style: TextButton.styleFrom(
                                                    padding: EdgeInsets.all(5),
                                                    alignment: Alignment.center,
                                                    textStyle: const TextStyle(
                                                      color: Colors.red,
                                                      //font
                                                      fontSize: 18,
                                                    )
                                                )
                                            ),

                                          )
                                      )
                                    ]
                                )
                        )
                ),
              ),
            ]
        ),
      ),
      // ),
      extendBodyBehindAppBar: false,

      // body: RefreshIndicator(
      //   onRefresh: ,
      body: Container(
        color: Color(0xFFFFEDDB),
        child: ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),

              background: Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                color: Colors.red,
                child: Text("Delete", style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Colors.white),
                ),
              ),
              secondaryBackground: Container(
                padding: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: Text("Delete", style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Colors.white),
                ),
              ),
              child: buildExpansionTile(index),
              onDismissed: (DismissDirection direction) {
                String action = direction == DismissDirection.startToEnd
                    ? "Delete"
                    : "Delete";
                print(action);
                var item = _tasks.removeAt(index);
                setState(() {});
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    margin: const EdgeInsets.only(bottom: 80.0, top: 80.0),
                    //alignment: FractionalOffset.topCenter,
                    backgroundColor: Colors.blue,
                    behavior: SnackBarBehavior.floating,
                    content: Text("Task $action",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.white),
                    ),
                    action: SnackBarAction(label: "Undo",
                        textColor: Colors.white,
                        onPressed: () {
                          _tasks.insert(index, item);
                          setState(() {

                          });
                        }),
                  ),
                );
              },
            );
          },
        ),
      ),
      //),
    );
  }

  Widget buildExpansionTile(int index) {
    return
      Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: ExpansionTile(
            //collapsedBackgroundColor: Colors.white,
            childrenPadding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
            title: Text(_tasks[index]["title"]),

            //description
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: 200,
                  width: 500,
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 45.0),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  //alignment: Alignment.centerLeft,
                  child: Text(_tasks[index]["desc"],),),
              ),
              SizedBox(
                height: 10,
              )
            ],
          )
      );
    //);
  }
}

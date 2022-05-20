import 'package:driver_dai_test/utils/lostFoundInside.dart';
import 'package:driver_dai_test/utils/lostFoundSyncData.dart';
import 'package:driver_dai_test/controller/userLostFound.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readmore/readmore.dart';

class fare1 extends StatefulWidget {
  const fare1({Key? key}) : super(key: key);

  @override
  _fare1State createState() => _fare1State();
}

class _fare1State extends State<fare1> {
  LostFoundSyncData data = LostFoundSyncData();

  List<Widget> getTasks(){

    List<Widget> tasksItems = [SizedBox(height: 20,)];
    for(int i = 0; i< data.getData().length; i++){
      if(data.getData()[i]['lFound_item'] != null){
        String items= data.getData()[i]['lFound_item'];
        String bus = data.getData()[i]['bus_no'];
        String phone = data.getData()[i]['phone_no'];
        String details = data.getData()[i]['lFound_detail'];


        var newItem = Container(
          width: 450,
          margin: EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 45.0),
          //child: Padding( //not using ListTile widget
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ReadMoreText(
            "Lost Item : ${items} \nBus no: ${bus} \nPhone no : ${phone} \nDetails : ${details} ",
            trimLines: 7,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: " Show More ",
            trimExpandedText: " Show Less ",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
            ),
            style: TextStyle(
              fontFamily: 'Dongle',
              // fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
          //value: tasks,
        );

        tasksItems.add(newItem);
        SizedBox(
          height: 80,
        );
      }
    }
    return tasksItems;
  }

  @override
  Widget build(BuildContext context) {

    print(data.getData());
    SystemChrome.setEnabledSystemUIOverlays ([]);
    // getTasks();
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(
            extendBody: true,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(65.0),
              child: AppBar(
                centerTitle: false,
                title: Padding(
                  padding: const EdgeInsets.only(left: 10,top: 15),
                  child: Text("Items...",style: TextStyle(fontFamily: "Dongle",fontSize: 45, color: Colors.black)),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                ),
                backgroundColor: Color(0xFFA2D2FF),
              ),
            ),
            extendBodyBehindAppBar: false,
            backgroundColor: Color(0xFFFFEDDB),


            body: Container(
              //padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 0),
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    color: Color(0xFFFFEDDB)
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,

                  //controller: _bcontroller,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: getTasks(),
                    // SizedBox(
                    //   height: 20,
                    //   width: 450,
                    // ),

                    // SizedBox(
                    //   height: 80,
                    // )

                    //  ]
                  ),
                )
            )
        )
    );
  }
}



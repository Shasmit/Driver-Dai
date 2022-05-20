import 'package:driver_dai_test/utils/calculateDistanceSyncData.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/services.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:driver_dai_test/controller/calculateDistance.dart';


class FarePage extends StatefulWidget {
  const FarePage({Key? key}) : super(key: key);

  @override
  _FarePageState createState() => _FarePageState();
}

class _FarePageState extends State<FarePage> {


  final items1 = ["Machhegaun","Kirtipur","Balkhu","Kuleshwor","Kalimati","Teku","Tripureshwor","Ratnapark"];

  final items2 = ["Machhegaun","Kirtipur","Balkhu","Kuleshwor","Kalimati","Teku","Tripureshwor","Ratnapark"];

  final items = ["Machhegaun-Ratnapark"];




  @override
  Widget build(BuildContext context) {

    CalculateDistance data = CalculateDistance();
    bool _lights = false;
    double km = 0 ;
    String pos1 = '';
    String pos2 = '';

    bool sec = false;
    final img = 'images/bg1.jpg';
    SystemChrome.setEnabledSystemUIOverlays ([]);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10,top: 25),
            child: Text("Fare Calculation...",style: TextStyle(fontFamily: "Dongle",fontSize: 45, color: Colors.black)),
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
      extendBody: true,
      backgroundColor: Color(0xFFFFEDDB),
      body: Center(
        child: Container(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              const SizedBox(
                height: 75,
              ),

              // Image.asset(
              //   'images/bus_logo.png',
              //   width: 300,
              //   height: 90,
              //   fit: BoxFit.fitWidth,
              // ),
              // Image.asset('images/Driver Dai-logos_black.png'),
              // SizedBox(
              //   height: 5.0,
              // ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: <Widget>[
              //     Image.asset('images/Driver Dai-logos_black.png'),
              //   ],
              // ),

              // const SizedBox(
              //   height: 10,
              // ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(25),
                  width: 500,
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage(img),
                    //   fit: BoxFit.cover,
                    // ),
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius:2,
                          offset: const Offset(0, 3),
                        )
                      ]),

                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        DropdownSearch<String>(
                          dropdownSearchBaseStyle: TextStyle(
                            fontFamily: 'Dongle',fontSize: 28
                          ),
                          mode: Mode.MENU,
                          popupBackgroundColor: Colors.white,
                          //to show search box
                          showSearchBox: true,
                          showSelectedItems: true,
                          //list of dropdown items
                          items: items,
                          label: "Select Your Route",
                          hint: "Select Route",
                          onChanged: print,
                          selectedItem: items[0],
                          //show selected item
                        ),

                        const SizedBox(
                          height: 25.0,
                        ),

                        DropdownSearch<String>(
                          dropdownSearchBaseStyle: TextStyle(
                              fontFamily: 'Dongle',fontSize: 25
                          ),
                          mode: Mode.MENU,
                          popupBackgroundColor: Colors.white,
                          //to show search box
                          showSearchBox: true,
                          showSelectedItems: true,
                          //list of dropdown items
                          items: items1,
                          label: "Select Initial Location",
                          hint: "Select Initial Location",
                          onChanged: (value){
                            pos1 = value.toString();
                            print(value);
                          },
                          // //show selected item
                          // selectedItem: items1[0],
                        ),

                        const SizedBox(
                          height: 25.0,
                        ),

                        DropdownSearch<String>(
                          dropdownSearchBaseStyle: TextStyle(
                              fontFamily: 'Dongle',fontSize: 25
                          ),
                          mode: Mode.MENU,
                          popupBackgroundColor: Colors.white,
                          //to show search box
                          showSearchBox: true,
                          showSelectedItems: true,
                          //list of dropdown items
                          items: items1,
                          label: "Select Final Location",
                          hint: "Select Final Location",
                          onChanged: (value){
                            pos2 = value.toString();
                          },
                          // //show selected item
                          // selectedItem: items1[0],
                        ),

                        const SizedBox(
                          height: 25.0,
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: SwitchListTile(
                        //     title: const Text('Student?'),
                        //     value: _lights,
                        //     onChanged: (bool newValue) {
                        //       setState(() {
                        //         _lights = newValue;
                        //         print(newValue);
                        //         print(_lights);
                        //       });
                        //     },
                        //   ),
                        // ),


                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text("Are You A Student ?",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Dongle',
                                    color: Colors.black,
                                    fontSize: 30,
                                    // letterSpacing: 1,
                                    // fontWeight: FontWeight.bold,
                                  ),),
                              ),

                              const SizedBox(
                                width: 7,
                              ),

                              ToggleSwitch(
                                minWidth: 25.0,
                                minHeight: 25.0,
                                cornerRadius: 20.0,
                                activeFgColor: Colors.white,
                                inactiveBgColor: Colors.grey,
                                inactiveFgColor: Colors.white,
                                totalSwitches: 2,
                                labels: ['N', 'Y'],
                                activeBgColors: [[Colors.redAccent],[Colors.green]],
                                radiusStyle: true,
                                onToggle: (index){
                                  if (index == 1){
                                    sec = true;
                                  }
                                  else{
                                    sec = false;
                                  }
                                  print("HEHE");
                                  print(sec);
                                },
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 15.0,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {

                                CalculateDistanceSyncData data = CalculateDistanceSyncData();

                                double initial = -1;
                                double end = -1;
                                String startpos = pos1;
                                String endPos = pos2;

                                int index = 0;

                                while(true){

                                  if(data.getData()[index]['sub_route']==startpos){
                                     initial = data.getData()[index]['distance'].toDouble();
                                      print(data.getData()[index]['distance']);

                                    if(end.toInt()!= -1){
                                      index = 0;
                                      break;
                                    }

                                  }else if(data.getData()[index]['sub_route'] == endPos){

                                    end = data.getData()[index]['distance'].toDouble();
                                    print(end);

                                    if(initial.toInt()!= -1){
                                      index = 0;
                                      break;
                                    }
                                  }
                                  index++;
                                }
                                double diff = initial-end;
                                km = diff.abs().toDouble();
                                print(km);

                                if (sec == true){
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          alignment: Alignment.center,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(18)
                                          ),
                                          backgroundColor: Colors.blueGrey[100],
                                          title: const Text(
                                              'Student Fare!!!',
                                              textAlign: TextAlign.center),
                                          titleTextStyle: const TextStyle(
                                              fontFamily: 'Dongle',
                                              color: Colors.black,
                                              fontSize: 35.0),
                                          content: Text(
                                              "The total fare is ${(km  * 3)*0.55}",
                                              textAlign: TextAlign.center),
                                          contentTextStyle: const TextStyle(
                                            fontFamily: 'Source Sans Pro',
                                            fontStyle: FontStyle.italic,
                                            color: Colors.black,
                                            fontSize: 20.0,
                                          ),
                                          // actions: <Widget>[
                                          //   Divider(color: Colors.black),
                                          //   Center(
                                          //     child: SizedBox(
                                          //       height: 38,
                                          //       width: 70,
                                          //       child: ElevatedButton(
                                          //         onPressed: () => Navigator.pop(context, 'OK'),
                                          //         child: Text('OK'),
                                          //         style: ElevatedButton.styleFrom(
                                          //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                          //           primary: Colors.redAccent[100],
                                          //           onPrimary: Colors.white,
                                          //           padding: EdgeInsets.all(5),
                                          //           alignment: Alignment.center,
                                          //           textStyle: const TextStyle(
                                          //             fontFamily: 'Dongle',
                                          //             fontSize: 30,
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ],
                                        ),
                                  );
                                }
                                else{
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          alignment: Alignment.center,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(18)
                                          ),
                                          backgroundColor: Colors.blueGrey[100],
                                          title: const Text(
                                              'Your Total Fare!!!',
                                              textAlign: TextAlign.center),
                                          titleTextStyle: const TextStyle(
                                              fontFamily: 'Dongle',
                                              color: Colors.black,
                                              fontSize: 35.0),
                                          content: Text(
                                              "The total fare is ${(km  * 3)}",
                                              textAlign: TextAlign.center),
                                          contentTextStyle: const TextStyle(
                                            fontFamily: 'Source Sans Pro',
                                            fontStyle: FontStyle.italic,
                                            color: Colors.black,
                                            fontSize: 20.0,
                                          ),
                                          // actions: <Widget>[
                                          //   Divider(color: Colors.black),
                                          //   Center(
                                          //     child: SizedBox(
                                          //       height: 38,
                                          //       width: 70,
                                          //       child: ElevatedButton(
                                          //         onPressed: () => Navigator.pop(context, 'OK'),
                                          //         child: Text('OK'),
                                          //         style: ElevatedButton.styleFrom(
                                          //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                          //           primary: Colors.redAccent[100],
                                          //           onPrimary: Colors.white,
                                          //           padding: EdgeInsets.all(5),
                                          //           alignment: Alignment.center,
                                          //           textStyle: const TextStyle(
                                          //             fontFamily: 'Dongle',
                                          //             fontSize: 30,
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ],
                                        ),
                                  );
                                }

                              },
                              child: Center(child: Text('CALCULATE')),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                primary: Colors.blueAccent,
                                onPrimary: Colors.white,
                                // elevation: 10,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10),
                                textStyle: const TextStyle(
                                  fontFamily: 'Dongle',
                                  fontSize: 30.0,
                                ),

                              ),

                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // backgroundColor: Colors.red,
      // body: Container(



    );
  }
}

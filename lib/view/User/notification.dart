import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'details_screen.dart';

List<Widget> getAllNotifications() {
  int current_time_hr = DateTime.now().hour;
  int current_time_min = DateTime.now().minute;
  List<Widget> allNotifications = [];
  for (int i = 0; i < data.getData().length; i++) {
    String start_time = data.getData()[i]['start_time'];
    String stop_time = data.getData()[i]['stop_time'];
    String full_name = data.getData()[i]['fullName'];
    String bus_no = data.getData()[i]['bus_no'];
    // bool active = data.getData()[i]['Active'];

    int start_time_hr = int.parse(start_time.split(":")[0]);
    int start_time_min = int.parse(start_time.split(":")[1]);
    int stop_time_hr = int.parse(stop_time.split(":")[0]);
    int stop_time_min = int.parse(stop_time.split(":")[1]);

    print(start_time_hr);
    print(stop_time_hr);

    var newNotification = Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            if (current_time_hr == start_time_hr ||
                current_time_hr == start_time_hr + 1 ||
                current_time_hr == start_time_hr - 1 ||
                current_time_hr == stop_time_hr ||
                current_time_hr == stop_time_hr + 1 ||
                current_time_hr == stop_time_hr - 1) ...[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFEDDB),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(
                              'images/driver_logo.png',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                full_name,
                                style: TextStyle(
                                  fontFamily: 'Avenir Next LT Pro Demi',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Bus Number : ${bus_no}',
                                style: TextStyle(
                                  fontFamily: 'Avenir Next LT Pro Demi',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              if (start_time_hr > stop_time_hr) ...[
                                Text(
                                  "The bus will be leaving from Machhegaun in about 5 minutes.",
                                  style: TextStyle(
                                      fontFamily: 'Avenir Next LT Pro Demi'),
                                )
                              ] else if (stop_time_hr > start_time_hr) ...[
                                Text(
                                  "The bus will be leaving from Ratnapark in about 5 minutes.",
                                  style: TextStyle(
                                      fontFamily: 'Avenir Next LT Pro Demi'),
                                )
                              ] else if (stop_time_hr == start_time_hr) ...[
                                if (start_time_min > stop_time_min) ...[
                                  Text(
                                    "The bus will be leaving from Machhegaun in about 5 minutes.",
                                    style: TextStyle(
                                        fontFamily: 'Avenir Next LT Pro Demi'),
                                  )
                                ] else if (stop_time_min > start_time_min) ...[
                                  Text(
                                    "The bus will be leaving from Ratnapark in about 5 minutes.",
                                    style: TextStyle(
                                        fontFamily: 'Avenir Next LT Pro Demi'),
                                  )
                                ]
                              ]
                            ],
                          )),
                          if (start_time_hr > stop_time_hr) ...[
                            Text(
                              start_time,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ] else if (stop_time_hr > start_time_hr) ...[
                            Text(
                              stop_time,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ] else if (stop_time_hr == start_time_hr) ...[
                            if (start_time_min > stop_time_min) ...[
                              Text(
                                start_time,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ] else if (stop_time_min > start_time_min) ...[
                              Text(
                                stop_time,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ]
                          ],
                          if (start_time_hr >= 12) ...[
                            Text(
                              " PM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ] else ...[
                            Text(
                              " AM",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ] 
        ]));
    allNotifications.add(newNotification);
  }
  return allNotifications;
}

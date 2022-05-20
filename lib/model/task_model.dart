import 'package:driver_dai_test/utils/lostFoundInside.dart';

class TasksModel1 {
  static List<Map<String, dynamic>> getTasks(){

    LostFoundInside data = LostFoundInside();
    return [
      {
        "title":"1. "+ data.getItem(),
        "desc": data.getDescp(),
        "completed": false
      },
      {
        "title": "2. ID card",
        "desc":
        "Student ID Card\n"
            "Bus no: BA3223\n"
            "Phone no: 9847374223\n \n"
            "To claim the item one must need to prove being the owner and must contact through the information provided above.",
        "completed": false
      },
      {
        "title": "3. Mobile Phone",
        "desc":
        "Student ID Card\n"
            "Bus no: BA3223\n"
            "Phone no: 9847374223\n\n"
            "To claim the item one must need to prove being the owner and must contact through the information provided above.",
        "completed": false
      },
      {
        "title": "4. Purse",
        "desc":
        "Student ID Card\n"
            "Bus no: BA3223\n"
            "Phone no: 9847374223\n\n"
            "To claim the item one must need to prove being the owner and must contact through the information provided above.",
        "completed": false
      },
      {
        "title": "5. Ladies Hand Bag",
        "desc":
        "Student ID Card\n"
            "Bus no: BA3223\n"
            "Phone no: 9847374223\n\n"
            "To claim the item one must need to prove being the owner and must contact through the information provided above.",
        "completed": false
      },
      {
        "title": "6. Credit Card",
        "desc":
        "Student ID Card\n"
            "Bus no: BA3223\n"
            "Phone no: 9847374223\n\n"
            "To claim the item one must need to prove being the owner and must contact through the information provided above.",
        "completed": false
      },
      {
        "title": "7. School Bag",
        "desc":
        "Student ID Card\n"
            "Bus no: BA3223\n"
            "Phone no: 9847374223\n\n"
            "To claim the item one must need to prove being the owner and must contact through the information provided above.",
        "completed": false
      },
    ];
  }
}
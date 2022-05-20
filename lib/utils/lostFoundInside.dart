class LostFoundInside{

  static String item ='Empty';
  static String descp = 'No description';

  void setItem(String itemName){
    item = itemName;
  }
  void setDescp(String description){
    descp = description;
  }

  String getItem(){
    return item;
  }
  String getDescp(){
    return descp;
  }

}
class User{
  static String name ='';
  static String phoneNum='';
  static String password='';
  static int token = 0;
  static String type = '';
  static int tokenField = 0;
  // User(this.phoneNum, this.password);
void setPhone(String phone){
  phoneNum = phone;
}

void setPassword(String pin){

  password = pin;

}

String getPhone(){
  return phoneNum;
}

String getPassword(){
  return password;
}

void setName(String Name){
  name = Name;
}

String getName(){
  return name;
}

void setToken(int Token){

    token = Token;

  }
int getToken(){
    return token;
}

  void setType(String Type){

    type = Type;

  }

String getType(){
    return type;
}

void settokenField(int passme){

    tokenField = passme;

}

int gettokenField(){

    return tokenField;

}



}
/*
User data = User();
user ko place-holder ma:
//copy this

data.get

 */
class User {
// 1. Thuộc tính : - biến 
String? userName ; 
int? birthYear;
 // 1.1 Private : Biến đó chỉ được sử dụng trong class 
 String? _phoneNumber; 
 int? _money = 2000000000;

 static String API_KEY = "fhwehfnf";
 /*
 int NUMBER = 10; 
 static String API_KEY = "fhwehfnf";
 */
//2. Phương thức : - hàm 
//2.1 Hàm khởi tạo : Chỉ có duy nhất một hàm khởi tạo 
// Hàm khởi tạo mặc đinh: User();
User({this.userName, this.birthYear});
// 2.2 Hàm getter & setter 
// setter 
void setPhoneNumber({required String phoneNumber})
{
  this._phoneNumber = phoneNumber;
}
// getter 
/*
getPhoneNumber(){
  return this._phoneNumber;
}
*/
// => a : { return a; }
getPhoneNumber() => this._phoneNumber;
get phoneNumber => this._phoneNumber;

tinhLaiNganHang()
{
  return (this._money! * 0.025);
}

getAge(){
  /*
  NUMBER = 20;
  const KEY = 30;
  final OTHER = NUMBER;
  */
  
  return DateTime.now().year - this.birthYear!;
}


}

// Tính kế thừa 
// Khi class ( cha) nó đã có các thuộc tính , phương thức 
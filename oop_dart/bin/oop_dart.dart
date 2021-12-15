

import 'hinh_vuong.dart';
import 'user.dart';
import 'xe_tai.dart';

void main(List<String> arguments) {

  User user1 = User(userName: "Bao Flutter", birthYear: 1991 ); // Tạo 1 instance hay tạo 1 đối tượng 
  print(user1.userName);
  print("Tuổi của " + user1.userName.toString() +" là: " + user1.getAge().toString());
  user1.setPhoneNumber(phoneNumber: "0349582808");
  print("Số điện thoại: " + user1.phoneNumber.toString());
  // biến static 
  String api = User.API_KEY;

  User user2 = User(userName: "Nam", birthYear: 1999 );
  User user3 = User(userName: "Hoa", birthYear: 1995 );

  List<User> userList = [user1, user2, user3];
  findOldestUser(userList: userList);

  // Đặc tính OOP 
  /*
  XeTai xeTai1 = XeTai();
  xeTai1.brand = "Huyndai";
  xeTai1.birthYear = 2001;
  print("Tuôi của xe Tải là: " + xeTai1.getAge().toString());
  */
  XeTai xeTai2 = XeTai(brand: "Suzuki", birthYear: 2002 );
  print("Thương hiệu của xe: " + xeTai2.brand.toString());
  xeTai2.chuyenCho();

  // 
  HinhVuong hinhVuong = HinhVuong(canh: 5.0);
  print("Chu vi hình vuông: " + hinhVuong.tinhChuVi().toString());


}

void findOldestUser({required List<User> userList}){
  int ageMax = 0;
  User? userResult ;  
  for(User user in userList)
  {
    int age = user.getAge();
    if(age > ageMax ){
      ageMax = age;
      userResult = user;
    }
  }
  print("Người có tuổi lớn nhất là: " 
  + userResult!.userName.toString()
  + ", có tuổi là: $ageMax" );

}
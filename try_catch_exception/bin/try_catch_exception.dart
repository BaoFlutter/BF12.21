
void main(List<String> arguments) {
  var input = "Báo Flutter";
  /*
  try {
    // Khối code nghi có ngoại lệ 
    int number = int.parse(input);
  }
  catch(e){
    // Xử lý khi có ngoại lệ
    print(e.toString());
  }
  */
  // Try - on - catch 
  /*
  try {
    // Khối code nghi có ngoại lệ 
    int number = int.parse(input);
  } on FormatException{
    // Các lệnh sử lý nếu có Exception là Format
    print("Đây là một ngoại lệ Format");
  }
  catch(e){
    // Xử lý khi có ngoại lệ
    print(e.toString());
  }
  */
  // Try - catch - finally 
  
   try {
    // Khối code nghi có ngoại lệ 
    int number = int.parse(input);
  } 
  catch(e){
    // Xử lý khi có ngoại lệ
    print(e.toString());
  }
  finally{
    print("Luôn luôn được thực thi ");
  }
  
  // throw Exception 
  /*
  try {
    kiemTraDoTuoi(age: -2);
  }
  catch(e){
    print (e.toString());
  }
  */
  print("Chương trình kết thúc");
}


void kiemTraDoTuoi({required int age})
{
  if(age <= 0 ) throw Exception("Tuổi nhập vào không được nhỏ hơn 0 ");
  if(age < 16 ) print("Bạn vẫn còn rất trẻ");
  else if(age < 50) print ("Bạn là người trưởng thành");
  else print("Bạn đã già");

}
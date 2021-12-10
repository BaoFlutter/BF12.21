
import 'package:dart_base/dart_base.dart' as dart_base;

void main(List<String> arguments) {
 
 int number = 10;
 var age = "Năm mươi";  
 dynamic tuoi = 50; 
 // ==================
 int firstNumber = 2; 
 int secondNumber = 10; 
 double mark = 8.5; 
 String name = "Báo Flutter";
 bool isLogined = true; 

 final API_KEY = "AFAJFLASF*%5";
 const KEY = "jdfsdfdsl38y834" ;

 print(name);
 print("Tuổi tôi là: $number");
 print("Điểm số cao nhất: " + number.toString() );
 int sum = tinhTong(firstNumber, secondNumber);
 print("Tổng 2 số là: $sum");
 print("Tổng 2 số là: "+ tinhTong(firstNumber, secondNumber).toString());

 if(isLogined) print("Đã đăng nhập rồi") ;

 // ======== Kiểu Dymanic ==============
  
 var  userName1 = "Bao";
 // userName1 = 10; ==> Error
 dynamic  userName2 = "Bao";
 userName2 = 190; 

 int hieu = tinhHieu(soBiTru: firstNumber, soTru: secondNumber);
 hieu = tinhHieuWithRequired(soBiTru: firstNumber, soTru: secondNumber);
 print("Hiệu 2 số: $hieu");

// Null Safety
int? personAge ; //  personAge = Null => Normal
// Hiện tại : Dart SDK => NullSafety ; không gán giá trị là null 
print ('$personAge');

inRaSoChan(number: number);

// Toán tử gán
// += ; x += 1 ;  <=> x = x + 1; 
int x = 3 ;
x += number; // 3 + 10 = 13
// || tương đương + ; true = 1; false = 0 
// true||false = true ; false || false = false; true || true = true
// && tương đương * ; true = 1; false = 0;
// true && false = false; true && true = true; 
int x1 = 6;
int x2 = 8; 
int x3 = 1; 
if((x1 > x2 )||(x3 < x1)) print("Kết quả cuối cùng ");
// false || true = true 

List<int> numberList = [8, 10, 20, 9, 2, 1];
//---------index-------0,  1,   2, 3, 4, 5 
//------------------- numberList[1];
//---------length------ 6
inRaSoLe(list: numberList);
List list = [8, 10, 20, 9, 2, 1, true, "Hello"];
inRaSoChanTrongList(list: numberList);

kiemTraSoChanLe(number: number);

inRaCacSoChiaHetCho3(number: number);

print('list này có rỗng không: ' +list.isNotEmpty.toString()
  + ' phần tử cuối cùng: '+ list.last.toString() 
 );

List? newList1; 
List newList2 = []; 

// Map là tập hợp của các cặp : Key - Value 
Map<String, int> map1 = Map<String, int>();
Map map2 = Map();
Map<String, int> map3 = {
  "age": 30,
  "numberOfCode" : 10,
  //-----------------
};
print("Tuổi: " + map3["age"].toString());
Map map4 = {
  "name": "Bao",
  1: "02305i0532",
  false: [],

};

}

void inRaSoLe({required List list}){
   print("Các số lẻ trong List là: ");
   for(int i = 0 ; i< list.length ; i++ )
   {
     if(list[i]%2 !=0 ) print(list[i].toString());
   }


}

void inRaSoChanTrongList({required List list}){
   print("Các số chẵn trong List là: ");
   for(int x in list) 
   {
     if(x%2 ==0 ) print(x.toString());
   }

}

tinhTong (a, b )
{
  return a + b; 
}

int tinhHieu({int? soBiTru, int? soTru})
{
  return soBiTru! - soTru!;
}

int tinhHieuWithRequired({ required int? soBiTru, required int? soTru})
{
  return soBiTru! - soTru!;
}

void inRaSoChan({required number})
{
if(number%2 == 0 ) print("$number là số chẵn");
else print("$number là số lẻ");
//return ;
}

void kiemTraSoChanLe({required number})
{
  int soDu = number%2;
  switch(soDu){
    case 0:
    print('$number là số chẵn');
    break;

    case 1:
    print('$number là số lẻ');
    break;

    default:
    print("Kết quả khác");
    break;

  }
}

inRaCacSoChiaHetCho3({ required int number}){
  if(number <=  0) return; 
  int count = number;
  /*
  while(count > 0 )
  {
    if(count%3 == 0) print('$count là số chia hết cho 3');
    count--; // count = count -1; 
  }
  */
  
  do {
    if(count%3 == 0) print('$count là số chia hết cho 3');
    count--; // count = count -1; 
  } while(count > 0 );


} 




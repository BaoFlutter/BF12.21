
void main(List<String> arguments) async {
   print("Chương trình bắt đầu");
   /*
   // Async - await - Future
  Future<int> resultNumber = makeLateNumber();
  int number2 = await resultNumber;
  int number = await makeLateNumber();
   print( number.toString());
   */
  /*
   // then : Dữ liệu dạng Future . then 
   makeLateNumber().then((result){
     print(result);
   });
   */
   // Stream 
   Stream<int> numberStream = Stream<int>.periodic(Duration(seconds: 2), makeNumber);
   //readStream(numberStream: numberStream);
   // Cách 2: listen từ Stream 
   /*
   numberStream.listen((number){
     print("Số trong Stream: $number");
   });
   */
   Stream<int> otherNumberStream = makeNumberStreamByAsyncYield(maxNumber: 10);
   readStream(numberStream: otherNumberStream);
   print("Chương trình kết thúc");
}
// Tạo Stream với async* & yield 

Stream<int> makeNumberStreamByAsyncYield({ int? maxNumber}) async* {

   for(int i = 0; i<= maxNumber!; i++)
   {
     yield i;
   }
}

Future<int> makeLateNumber(){
  return Future.delayed(Duration(seconds: 2),
  (){return 5;}
  );
}

void readStream( { required Stream<int> numberStream}) async
{
  // Cách 1: await for in 

  await for (int x in numberStream)
  {
    print("Số trong Stream là: $x");
  }

}

int makeNumber(int value)=> value + 1; 

import 'package:rxdart/rxdart.dart';
void main(List<String> arguments) {
  //demoPublishSubject();
 //demoBehaviourSubject();
 demoReplaySubject();
  }
// Chỉ lấy dữ liệu thêm vào sau thời điểm lấy ( lắng nghe) và dữ liệu thêm vào trước đó
demoPublishSubject(){
 PublishSubject publishSubject = PublishSubject<int>();
 // Lấy dữ liệu lần 1
 publishSubject.listen((value) { 
   print("Lấy dữ liệu lần 1: $value");
 });
 publishSubject.add(100);
 publishSubject.add(101);
 // Lấy dữ liệu lần 2
 publishSubject.listen((value) { 
   print("Lấy dữ liệu lần 2: $value");
 });
 publishSubject.add(200);
 publishSubject.add(201);
}

// Chỉ lấy dữ liệu thêm vào sau thời điểm lấy ( lắng nghe)
demoBehaviourSubject(){
 BehaviorSubject behaviorSubject = BehaviorSubject<int>();
 // Lấy dữ liệu lần 1
 behaviorSubject.listen((value) { 
   print("Lấy dữ liệu lần 1: $value");
 });
 behaviorSubject.add(100);
 behaviorSubject.add(101);
 // Lấy dữ liệu lần 2
 behaviorSubject.listen((value) { 
   print("Lấy dữ liệu lần 2: $value");
 });
 behaviorSubject.add(200);
 behaviorSubject.add(201);
}

// Chỉ lấy dữ liệu có trong Subject
demoReplaySubject(){
 ReplaySubject replaySubject = ReplaySubject<int>();
 // Lấy dữ liệu lần 1
 replaySubject.listen((value) { 
   print("Lấy dữ liệu lần 1: $value");
 });
 replaySubject.add(100);
 replaySubject.add(101);
 // Lấy dữ liệu lần 2
 replaySubject.listen((value) { 
   print("Lấy dữ liệu lần 2: $value");
 });
 replaySubject.add(200);
 replaySubject.add(201);
}
class Xe {
 
  String? brand;
  int? birthYear;
  Xe({ this.brand,  this.birthYear});

  int getAge(){
    return DateTime.now().year - this.birthYear!;
  } 

  void chuyenCho() {
    print("Xe để chở") ;
  }



}
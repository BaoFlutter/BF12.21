import 'xe.dart';

class XeTai extends Xe {

  XeTai({brand, birthYear}) : super(brand: brand, birthYear: birthYear );
  
//1. Khi lớp con kế thừa lớp cha thì : tất cả các thuộc tính và
// phương thức public của cha , lớp con đều dùng được
//2. Khi lớp cha có hàm khởi tạo thì khi khởi tạo lớp con thì 
// lớp cha cũng phải được khởi tạo

@override
  void chuyenCho() {
    // TODO: implement chuyenCho
    
    String brandXe = super.brand!;
    print("Xe $brandXe chuyên chở vật liệu xây dựng");
    
  }

}
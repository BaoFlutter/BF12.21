class HinhchuNhat{
  double? chieuDai; 
  double? chieuRong; 

  HinhchuNhat({this.chieuDai, this.chieuRong});

  tinhChuVi(){
    return (this.chieuDai! + this.chieuRong!)*2;
  }
   
  tinhDienTich(){
    return this.chieuDai! * this.chieuRong!;
  } 
  
}
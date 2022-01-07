class InformationModel {
int? id;
String? average_mark;
String? adjustment;

InformationModel({ required this.id, required this.average_mark, required this.adjustment});

InformationModel.fromJson(json):
    this.id = json['id'],
    this.average_mark = json['average_mark'],
    this.adjustment = json['adjustment'] ;

 toJson(){
   return {
     "id": this.id,
     "average_mark": this.average_mark,
     "adjustment": this.adjustment
   };
 }



}
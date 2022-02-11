class AppUser {
  String? uid;
  String? displayName;
  String? email;
  String? photoUrl;

  AppUser({this.uid, this.email, this.displayName, this.photoUrl});

  AppUser.fromJson(Map json):
      this.uid = json['uid'],
      this.displayName = json['display_name'],
      this.email = json['email'],
      this.photoUrl = json['photo_url'] ;

  toJson(){
    return {
      "uid": this.uid,
      "display_name": this.displayName,
      "email": this.email,
      "photo_url" : this.photoUrl
    };
  }


}
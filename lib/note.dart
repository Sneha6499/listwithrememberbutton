class Note{
 late String firstName;
  late String lastName;

  Note({required this.firstName, required this.lastName});

  Note.fromJson(Map<String,dynamic> json){
    firstName= json['first'];
    lastName= json['lastName'];


  }
}
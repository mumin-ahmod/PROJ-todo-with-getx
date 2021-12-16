class TaskData{

  String? id;
  String? title;

  TaskData({this.id, required this.title});

  Map<String, dynamic> toMap(){
    return{
      'id' : id,
      'title': title
    };
  }

  TaskData.fromMap( map){
    id = map["id"];
    title = map["title"];
  }

}
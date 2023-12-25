class Todo {
  String title;
  bool isDone;



  Todo({required this.title, this.isDone = false});

  Map<String, dynamic> toJson() => {
        'title': title,
        'isDone': isDone,
      };

  static Todo fromJson(Map<String, dynamic> json) => Todo(
        title: json['title'],
        isDone: json['isDone'],
      );
}
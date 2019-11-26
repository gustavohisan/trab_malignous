class Teste {
  int userId;
  int id;
  String title;
  String completed;

  Teste({this.userId, this.id, this.title, this.completed});

  factory Teste.fromJson(Map<String, dynamic> json) {
    return Teste (
    userId : json['userId'] as int,
    id : json['id'] as int,
    title : json['title'] as String,
    completed : json['completed'] as String
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}
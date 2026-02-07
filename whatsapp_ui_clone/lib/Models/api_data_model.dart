class ApiDataModel {
  final int userId, id;
  final String title;
  final bool completed;

  ApiDataModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ApiDataModel.fromJson({required Map json}) {
    return ApiDataModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

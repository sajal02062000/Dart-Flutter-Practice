class UserModel {
  final int id;
  final String name;
  final String? image;
  final String? lastMessage;

  UserModel({
    required this.id,
    required this.name,
    this.image,
    this.lastMessage,
  });
}

class User {
  final String id;
  final String npm;
  final String name;
  final String password;

  const User({
    required this.id,
    this.npm = "",
    this.name = "",
    this.password = "",
  });
}

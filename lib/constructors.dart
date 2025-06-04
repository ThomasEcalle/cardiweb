class User {
  final String nickName;
  final String? firstName;
  final String? lastName;
  final String address;
  final int age;

  const User(
    this.nickName, {
    this.firstName,
    this.lastName,
    this.address = '5 Rue Scribe',
    required this.age,
  });

  const User.toto(
    this.nickName, {
    this.firstName = 'toto',
    this.lastName,
    this.address = '5 Rue Scribe',
    required this.age,
  });
}

void main() {
  User toto = User('toto', firstName: 'thomas', lastName: 'ecalle', age: 42);

  const user1 = User('User1', age: 42);
  const user2 = User('User1', age: 42);

  print(user1 == user2);

  // final length = toto.firstName?.length ?? 10;
  print(toto.firstName?.length);
}

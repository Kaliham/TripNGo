class User {
  String email;
  String phoneNumber;
  String firstName;
  String lastName;
  String imageUrl;
  String password;
  User({
    this.email,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.imageUrl,
    this.password,
  });
  bool confirmPassword(String password) {
    if (this.password == password) print('password equal');
    return (this.password == password);
  }
}

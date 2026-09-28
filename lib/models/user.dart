class User {
  String _name;
  String _email;
  String _password;

  User({
    required String name,
    required String email,
    required String password,
  })  : _name = name,
        _email = email,
        _password = password;

  String get name => _name;
  String get email => _email;
  String get password => _password;

  set name(String value) {
    if (value.isNotEmpty) {
      _name = value;
    }
  }

  set email(String value) {
    if (value.endsWith('@gmail.com')) {
      _email = value;
    }
  }

  set password(String value) {
    if (value.length >= 8) {
      _password = value;
    }
  }

  bool isValid() {
    return _name.isNotEmpty &&
        _email.endsWith('@gmail.com') &&
        _password.length >= 8;
  }
}

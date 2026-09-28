import '../models/user.dart';

class UserService {
    User? _user;

    void register(User user) { //membuat method bernama register yang menerima object User.
        _user = user;
    }

    bool login(String email, String password) { //login() menerima: email → email yang dimasukkan di halaman Login, password → password yang dimasukkan di halaman Login
    if (_user == null) { //Cek apakah user sudah ada
        return false;
    }
    return _user!.email == email &&
        _user!.password == password;
    }
}

final userService = UserService(); //shared UserService dulu supaya Register dan Login memakai penyimpanan user yang sama.
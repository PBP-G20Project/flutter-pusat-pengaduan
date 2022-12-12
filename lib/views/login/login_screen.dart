import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/controller/route_controller.dart';
import 'package:pusat_pengaduan/pusat_pengaduan_app.dart';
import 'package:pusat_pengaduan/views/login/controller/login_controller.dart';
import 'package:pusat_pengaduan/views/widgets/custom_drawer.dart';
import 'package:pusat_pengaduan/models/profile/profile_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final controller = Get.find<LoginController>();
  bool isPasswordVisible = true;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String email = "";
  String password1 = "";

  loginRequest(request) async {
    // ganti railway
    final response = await request
        .login("https://pusat-pengaduan.up.railway.app/auth/login/", {
      'email': email,
      'password': password1,
    });
    return response;
  }

  getProfile(request) async {
    final response = await request
        .get("https://pusat-pengaduan.up.railway.app/auth/data_login/");
    if (response[0] == null) {
      return {"status": false};
    } else {
      User user = User.fromJson(response[0]);
      return {"user": user, "status": true};
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',
            style: kRubik.copyWith(
              fontSize: 18,
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
            )),
      ),
      drawer: CustomDrawer(
        title: 'Pusat Pengaduan',
        menu: RouteController.getDrawerRoute(kLogin, request),
      ),
      body: Form(
        key: _loginFormKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh : xxx@gmail.com",
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      email = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      email = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: "Masukan password anda",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          togglePasswordView();
                        }),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      password1 = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      password1 = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Password anda salah';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryColor),
                      ),
                      onPressed: () async {
                        if (_loginFormKey.currentState!.validate()) {
                          loginRequest(request).then((result) {
                            if (request.loggedIn) {
                              String msg = "Anda Berhasil Login";
                              getProfile(request).then((result2) {
                                is_user = result2['user'].fields.admin == false;
                              });
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Berhasil Login',
                                      style: TextStyle(color: Colors.green)),
                                  content: Text(msg),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          controller.navigateToHomePage(),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Gagal Login',
                                      style: TextStyle(color: Colors.red)),
                                  content: const Text(
                                      'Email atau Password Anda Salah'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Kembali'),
                                    ),
                                  ],
                                ),
                              );
                            }
                            // }
                          });
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: kWhiteColor),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

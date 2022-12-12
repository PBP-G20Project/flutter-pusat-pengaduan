import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/views/register/controller/register_controller.dart';
import 'package:pusat_pengaduan/controller/route_controller.dart';
import 'package:pusat_pengaduan/views/widgets/custom_drawer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenPage();
}

class _RegisterScreenPage extends State<RegisterScreen> {
  final _registerFormKey = GlobalKey<FormState>();
  final controller = Get.find<RegisterController>();
  bool isPasswordVisible = true;
  bool isPasswordVisible2 = true;

  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void togglePasswordView2() {
    setState(() {
      isPasswordVisible2 = !isPasswordVisible2;
    });
  }

  String email = "";
  String name = "";
  String password1 = "";
  String password2 = "";
  String nik = "";

  registerRequest(request) async {
    // ganti railway
    final response = await request
        .post("https://pusat-pengaduan.up.railway.app/auth/register_user/", {
      'email': email,
      'password1': password1,
      'password2': password2,
      'nama': name,
      'nik': nik,
    });
    return response;
  }

  registerAdminRequest(request) async {
    // ganti railway
    final response = await request.post(
        "https://pusat-pengaduan.up.railway.app/auth/register_user_admin/", {
      'email': email,
      'password1': password1,
      'password2': password2,
      'nama': name,
      'nik': nik,
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Register',
            style: kRubik.copyWith(
              fontSize: 18,
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
            )),
      ),
      drawer: CustomDrawer(
        title: 'Pusat Pengaduan',
        menu: RouteController.getDrawerRoute(kRegister, request),
      ),
      body: Form(
          key: _registerFormKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
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
                  // NAMA
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "Contoh : Chris Evans",
                        labelText: "Nama",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          name = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  // NIK
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "NIK : 36661213213",
                        labelText: "NIK",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          nik = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          nik = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length != 16) {
                          return 'NIK harus terdiri dari 16 angka';
                        }
                        return null;
                      },
                    ),
                  ),
                  // password1
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
                          return 'Password anda tidak memeuhi ketentuan';
                        }
                        return null;
                      },
                    ),
                  ),
                  // password2
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: isPasswordVisible2,
                      decoration: InputDecoration(
                        hintText: "Konfirmasi Password",
                        labelText: "Re-enter Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(isPasswordVisible2
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              togglePasswordView2();
                            }),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          password2 = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          password2 = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Password anda tidak memeuhi ketentuan';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 300,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kPrimaryColor),
                            ),
                            onPressed: () async {
                              if (_registerFormKey.currentState!.validate()) {
                                registerRequest(request).then((result) {
                                  String msg = result['message'];
                                  if (result['status']) {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('Berhasil Register',
                                            style:
                                                TextStyle(color: Colors.green)),
                                        content: Text(msg),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                controller.navigateToLogin(),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('Gagal Register',
                                            style:
                                                TextStyle(color: Colors.red)),
                                        content: Text(msg),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Kembali'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                });
                              }
                            },
                            child: const Text(
                              "Register Sebagai User",
                              style:
                                  TextStyle(fontSize: 12, color: kWhiteColor),
                            ),
                          )),
                      const SizedBox(width: 50),
                      Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kSecondaryColor01),
                            ),
                            onPressed: () async {
                              if (_registerFormKey.currentState!.validate()) {
                                registerAdminRequest(request).then((result) {
                                  String msg = result['message'];
                                  if (result['status']) {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text(
                                            'Berhasil Register Sebagai Admin',
                                            style:
                                                TextStyle(color: Colors.green)),
                                        content: Text(msg),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                controller.navigateToLogin(),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text(
                                            'Gagal Register Sebagai Admin',
                                            style:
                                                TextStyle(color: Colors.red)),
                                        content: Text(msg),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Kembali'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                });
                              }
                            },
                            child: const Text(
                              "Register Sebagai Admin",
                              style:
                                  TextStyle(fontSize: 12, color: kWhiteColor),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

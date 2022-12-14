import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/views/profile/controller/profile_controller.dart';
import 'package:pusat_pengaduan/models/profile/profile_model.dart';
import 'package:pusat_pengaduan/controller/route_controller.dart';
import 'package:pusat_pengaduan/views/widgets/custom_drawer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenPageState();
}

class _ProfileScreenPageState extends State<ProfileScreen> {
  final _profileFormKey = GlobalKey<FormState>();
  final controller = Get.find<ProfileController>();

  String email = "";
  String name = "";
  String nik = "";

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

  postProfile(request) async {
    // ganti railway
    final response = await request
        .post("https://pusat-pengaduan.up.railway.app/auth/profile/", {
      'email': email,
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
        title: Text('Profile',
            style: kRubik.copyWith(
              fontSize: 18,
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
            )),
      ),
      drawer: CustomDrawer(
        title: 'Pusat Pengaduan',
        menu: RouteController.getDrawerRoute(kProfile, request),
      ),
      body: FutureBuilder(
          future: getProfile(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.data['status'] == false) {
                // TODO fix gatau gimana caranya mungkin bikin dialog ?
                return controller.navigateToLogin();
              } else {
                return Form(
                  key: _profileFormKey,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          // Menggunakan padding sebesar 8 pixels
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            initialValue: snapshot.data['user'].fields.email,
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
                            initialValue: snapshot.data['user'].fields.nama,
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
                            initialValue: snapshot.data['user'].fields.nik,
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
                            onFieldSubmitted: (String? value) {
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
                        Expanded(
                          child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                ),
                                onPressed: () async {
                                  if (email == "") {
                                    email = snapshot.data['user'].fields.email;
                                  }
                                  if (name == "") {
                                    name = snapshot.data['user'].fields.nama;
                                  }
                                  if (nik == "") {
                                    nik = snapshot.data['user'].fields.nik;
                                  }
                                  if (_profileFormKey.currentState!
                                      .validate()) {
                                    postProfile(request).then((result) {
                                      String msg = result['message'];
                                      if (result['status']) {
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text(
                                                'Berhasil Ubah Data',
                                                style: TextStyle(
                                                    color: Colors.green)),
                                            content: Text(msg),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => controller
                                                    .navigateToHomePage(),
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
                                            title: const Text('Gagal Ubah Data',
                                                style: TextStyle(
                                                    color: Colors.red)),
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
                                  "Simpan",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
          }),
    );
  }
}

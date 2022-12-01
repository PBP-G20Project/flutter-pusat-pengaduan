import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  // const LoginScreen({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Berita Detail'),
  //     ),
  //     body: const Center(
  //       child: Text('Berita Detail'),
  //     ),
  //   );
  // }
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String psd = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
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
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Masukan password anda",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      psd = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      psd = value!;
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
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
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
      ),
    );
  }
}

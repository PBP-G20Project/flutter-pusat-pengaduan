import 'dart:html';
import 'package:get/get.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pusat_pengaduan/views/home/review/controller/review_controller.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final controller = Get.find<ReviewController>();
  final _formKey = GlobalKey<FormState>();

  static final List<List<Object>> list = [];

  String _review = "";


  List<List<Object>> _getList() {
    return list;
  }

  reviewPost(request) async {
    final response = await request.post('https://pusat-pengaduan.up.railway.app/', {
      'review' : _review
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Review',
            style: kRubik.copyWith(
              fontSize: 18,
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor)),
                    hintText: "Contoh : Aplikasinya bermanfaat",
                    labelText: "Review",
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _review = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _review = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Review tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              TextButton(
                  onPressed: () async {
                    reviewPost(request).then((result) {
                      showDialog(context: context, builder: (BuildContext context) =>
                      AlertDialog(
                        title: const Text('Berhasil Review', style: TextStyle(color: kPrimaryColor)),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text('OK'),
                          )
                        ],
                      ));
                    });
                  },
                  child: const Text("Simpan"))
            ]),
          ),
        ),
      ),
    );
  }


}

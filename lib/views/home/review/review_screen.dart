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

Map<String, String> listRating = {
  '0': '--------',
  '1': 'Very Good',
  '2': 'Good',
  '3': 'Mediocre',
  '4': 'Bad',
  '5': 'Very Bad'
};

class _ReviewScreenState extends State<ReviewScreen> {
  final controller = Get.find<ReviewController>();
  final _formKey = GlobalKey<FormState>();

  String _review = "";

  String _rating = '0';

  reviewPost(request) async {
    final response = await request.post(
        'https://pusat-pengaduan.up.railway.app/isi_form/',
        {'comment': _review, 'rating': _rating});
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
              ListTile(
                title: const Text(
                  'Rating',
                ),
                trailing: DropdownButton<String>(
                  value: _rating,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // items : listRating.forEach((key, value) {
                  //   return DropdownMenuItem(
                  //     value: key,
                  //     child: Text(value)
                  //   );
                  //  }),
                  items: listRating.keys.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(listRating[items]!),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _rating = newValue!;
                    });
                  },
                ),
              ),
              TextButton(
                  onPressed: () async {
                    reviewPost(request).then((result) {
                      String msg = result['message'];
                      if (result['status']) {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Berhasil Review',
                                      style: TextStyle(color: Colors.green)),
                                  content: Text(msg),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () =>
                                            controller.navigateToHomePage(),
                                        child: const Text("OK")),
                                  ],
                                ));
                      } else {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text("Gagal Review",
                                      style: TextStyle(color: Colors.red)),
                                  content: Text(msg),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Kembali")),
                                  ],
                                ));
                      }
                    });
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: kPrimaryColor),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}

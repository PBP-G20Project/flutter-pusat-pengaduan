import 'package:pusat_pengaduan/views/profile/model/profile_model.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

getProfile(request) async {
  final response = await request.get("http://127.0.0.1:8000/auth/data_login/");
  if (response[0] == null) {
    return {"status": false};
  } else {
    User user = User.fromJson(response[0]);
    return {"user": user, "status": true};
  }
}

import 'package:pbp_django_auth/pbp_django_auth.dart';

logout_acc(request) async {
  final response = await request.logout("http://127.0.0.1:8000/auth/logout/");
  return response;
}

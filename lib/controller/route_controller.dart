import 'package:get/get.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/pusat_pengaduan_app.dart';
import 'package:pusat_pengaduan/utils/route.dart';

class RouteController {
  static final Map<String, void Function()?> _drawerRoute = {};

  static Map<String, void Function()?> userDrawerRoute = {
    kHome: () => Get.offNamed(homePageRoute),
    kDashboardUser: () => Get.offNamed(dashboardUserRoute),
    kSubmission: () => Get.offNamed(submissionRoute),
    kProfile: () => Get.offNamed(profileRoute),
    kReview: () => Get.offNamed(reviewRoute),
    kLogout: () => Get.offNamed(loginRoute),
  };

  static Map<String, void Function()?> adminDrawerRoute = {
    kHome: () => Get.offNamed(homePageRoute),
    kDashboardAdmin: () => Get.offNamed(dashboardAdminRoute),
    kSubmission: () => Get.offNamed(submissionRoute),
    kProfile: () => Get.offNamed(profileRoute),
    kLogout: () => Get.offNamed(loginRoute),
  };

  static Map<String, void Function()?> guestDrawerRoute = {
    kHome: () => Get.offNamed(homePageRoute),
    kRegister: () => Get.offNamed(registerRoute),
    kLogin: () => Get.offNamed(loginRoute),
  };

  static isLoggedIn(request) {
    return request.loggedIn;
  }

  static isUser(request) {
    return is_user;
  }

  static Map<String, void Function()?> getDrawerRoute(String from, request) {
    _drawerRoute.clear();
    if (isLoggedIn(request)) {
      if (isUser(request)) {
        _drawerRoute.addAll(userDrawerRoute);
      } else {
        _drawerRoute.addAll(adminDrawerRoute);
      }
    } else {
      _drawerRoute.addAll(guestDrawerRoute);
    }

    try {
      _drawerRoute[from] = () => Get.back();
      // ignore: empty_catches
    } catch (e) {
      // Key Error
    }

    return _drawerRoute;
  }
}

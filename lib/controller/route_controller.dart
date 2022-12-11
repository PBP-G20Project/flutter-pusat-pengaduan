import 'package:get/get.dart';
import 'package:pusat_pengaduan/common/constant.dart';
import 'package:pusat_pengaduan/utils/route.dart';

class RouteController {
  static Map<String, void Function()?> _drawerRoute = {};

  static Map<String, void Function()?> userDrawerRoute = {
    kHome: () => Get.offNamed(homePageRoute),
    kDashboardUser: () => Get.offNamed(dashboardUserRoute),
    kSubmission: () => Get.offNamed(submissionRoute),
    kProfile: () => Get.offNamed(profileRoute),
    kLogout: () => Get.offNamed(loginRoute), // TODO: implement logout
  };

  static Map<String, void Function()?> adminDrawerRoute = {
    kHome: () => Get.offNamed(homePageRoute),
    kDashboardAdmin: () => Get.offNamed(dashboardAdminRoute),
    kSubmission: () => Get.offNamed(submissionRoute),
    kProfile: () => Get.offNamed(profileRoute),
    kLogout: () => Get.offNamed(loginRoute), // TODO: implement logout
  };

  static Map<String, void Function()?> guestDrawerRoute = {
    kHome: () => Get.offNamed(homePageRoute),
    kRegister: () => Get.offNamed(registerRoute),
    kLogin: () => Get.offNamed(loginRoute),
  };

  static isLoggedIn() {
    // TODO: implement isLoggedIn
    return true;
  }

  static isUser() {
    // TODO: implement isUser/isAdmin
    return true;
  }

  static Map<String, void Function()?> getDrawerRoute(String from) {
    if (isLoggedIn()) {
      if (isUser()) {
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

import 'package:get/get.dart';
import 'package:pusat_pengaduan/views/dashboard/catatan_admin/catatan_admin_binding.dart';
import 'package:pusat_pengaduan/views/dashboard/catatan_admin/catatan_admin_screen.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_admin/dashboard_admin_binding.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_admin/dashboard_admin_screen.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_user/dashboard_user_binding.dart';
import 'package:pusat_pengaduan/views/dashboard/dashboard_user/dashboard_user_screen.dart';
import 'package:pusat_pengaduan/views/dashboard/draft_form/draft_form_binding.dart';
import 'package:pusat_pengaduan/views/dashboard/draft_form/draft_form_screen.dart';
import 'package:pusat_pengaduan/views/home/berita_detail/berita_detail_binding.dart';
import 'package:pusat_pengaduan/views/home/berita_detail/berita_detail_screen.dart';
import 'package:pusat_pengaduan/views/home/home_page/home_page_binding.dart';
import 'package:pusat_pengaduan/views/home/home_page/home_page_screen.dart';
import 'package:pusat_pengaduan/views/home/review/review__binding.dart';
import 'package:pusat_pengaduan/views/home/review/review_screen.dart';
import 'package:pusat_pengaduan/views/login/login_binding.dart';
import 'package:pusat_pengaduan/views/login/login_screen.dart';
import 'package:pusat_pengaduan/views/profile/profile_binding.dart';
import 'package:pusat_pengaduan/views/profile/profile_screen.dart';
import 'package:pusat_pengaduan/views/register/register_binding.dart';
import 'package:pusat_pengaduan/views/register/register_screen.dart';
import 'package:pusat_pengaduan/views/splash/splash_binding.dart';
import 'package:pusat_pengaduan/views/splash/splash_screen.dart';
import 'package:pusat_pengaduan/views/submission_form/submission_form_binding.dart';
import 'package:pusat_pengaduan/views/submission_form/submission_form_screen.dart';

const splashRoute = "/splash";

const loginRoute = "/login";
const logoutRoute = "/logout";
const registerRoute = "/register";
const profileRoute = "/profile";

const homePageRoute = "/home/home_page";
const reviewRoute = "/home/review";
const beritaDetailRoute = "/home/berita_detail";

const submissionRoute = "/submission";

const dashboardUserRoute = "/dashboard/dashboard_user";
const draftFormRoute = "/dashboard/draft_form";

const dashboardAdminRoute = "/dashboard/dashboard_admin";
const catatanAdminRoute = "/dashboard/catatan_admin";

var route = [
  GetPage(
    name: splashRoute,
    page: () => const SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: loginRoute,
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: registerRoute,
    page: () => const RegisterScreen(),
    binding: RegisterBinding(),
  ),
  GetPage(
    name: profileRoute,
    page: () => const ProfileScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: homePageRoute,
    page: () => const HomePageScreen(),
    binding: HomePageBinding(),
  ),
  GetPage(
    name: reviewRoute,
    page: () => const ReviewScreen(),
    binding: ReviewBinding(),
  ),
  GetPage(
    name: beritaDetailRoute,
    page: () => const BeritaDetailScreen(),
    binding: BeritaDetailBinding(),
  ),
  GetPage(
    name: submissionRoute,
    page: () => const SubmissionFormScreen(),
    binding: SubmissionFormBinding(),
  ),
  GetPage(
    name: dashboardUserRoute,
    page: () => const DashboardUserScreen(),
    binding: DashboardUserBinding(),
  ),
  GetPage(
    name: draftFormRoute,
    page: () => const DraftFormScreen(),
    binding: DraftFormBinding(),
  ),
  GetPage(
    name: dashboardAdminRoute,
    page: () => const DashboardAdminScreen(),
    binding: DashboardAdminBinding(),
  ),
  GetPage(
    name: catatanAdminRoute,
    page: () => const CatatanAdminScreen(),
    binding: CatatanAdminBinding(),
  ),
];

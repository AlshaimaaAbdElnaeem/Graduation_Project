import 'package:go_router/go_router.dart';
import 'package:graduation_project/router/constant_go_router.dart';
import 'package:graduation_project/ui/screens/loginscreen.dart';
import 'package:graduation_project/ui/screens/register_page.dart';
import 'package:graduation_project/ui/screens/teacher_page.dart';
import 'package:graduation_project/ui/screens/view_page.dart';
import 'package:graduation_project/ui/widgets/navegationbar_teacher.dart';

GoRouter goRouter() {
  return GoRouter(initialLocation: viewPages, routes: [
    GoRoute(
      path: viewPages,
      builder: ((context, state) => const ViewPages()),
    ),
    GoRoute(
      path: logInPage,
      builder: ((context, state) => const LogInPage()),
    ),
    GoRoute(
        path: registerPage,
        builder: ((context, state) => const RegisterPage())),
    GoRoute(
      path: teacherPage,
      builder: ((context, state) => TeacherPage()),
    ),
    GoRoute(
      path: navigationbarTeacher,
      builder: ((context, state) => const CustomNavigationBarTeacher()),
    ),
  ]);
}

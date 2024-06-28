import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/logincubit/logincubit.dart';
import 'package:graduation_project/data/cubit/registercubit/registercubit.dart';
import 'package:graduation_project/data/cubit/teachercubit/teacherCubit.dart';
import 'package:graduation_project/router/go_router_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_project/ui/constant.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(setting);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const LiveCourseApp());
}

class LiveCourseApp extends StatelessWidget {
  const LiveCourseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(
            create: (BuildContext context) => RegisterCubit()),
        BlocProvider<LogInCubit>(
            create: (BuildContext context) => LogInCubit()),
        BlocProvider<TeacherCubit>(
            create: (BuildContext context) => TeacherCubit()),
      ],
      child: ValueListenableBuilder(
        valueListenable: Hive.box(setting).listenable(),
        builder: (BuildContext context, value, child) {
          var lang = Hive.box(setting).get(language, defaultValue: "en");
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: Locale(lang),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: goRouter(),
          );
        },
      ),
    );
  }
}

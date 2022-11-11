import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hng_explore/provider/countr_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config_file.dart';
import 'models/language_model.dart';
import 'screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Lang strings = Lang();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  int? langu = pref.getInt('langu');
  if (langu != null) {
    strings.setLang(langu);
  } else {
    strings.setLang(Lang.english); // set default language - English
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CountryProvider>(create: (_) => CountryProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'HNG EXPLORE',
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'Axiforma',
          ),
          darkTheme: ThemeData(
              scaffoldBackgroundColor: const Color(0xff000F24),
              brightness: Brightness.dark,
              fontFamily: 'Axiforma'),
          debugShowCheckedModeBanner: false,
          themeMode: currentTheme.currentTheme(),
          home: child,
        );
      },
      child: const HomeScreen(),
    );
  }
}

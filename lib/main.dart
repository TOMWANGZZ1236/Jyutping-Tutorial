import 'package:flutter/material.dart';
import 'package:testapp/constants/theme_constants.dart';
import 'package:testapp/home_page_view.dart';
import 'package:testapp/load_lessons.dart';
import 'package:testapp/views/general_views.dart/congrats_view.dart';
import 'package:testapp/views/introduction_views.dart/syllabus_view.dart';

late final ThemeData lightTheme;
late final ThemeData darkTheme;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<dynamic> lessons = await loadLessons('assets/jsons/lesson1.json');
  runApp(MyApp(lessons: lessons));
}

class MyApp extends StatefulWidget {
  final List<dynamic> lessons;
  const MyApp({super.key, required this.lessons});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<int, Color> blueColorMap = {
    50: blueColor,
    100: blueColor,
    200: blueColor,
    300: blueColor,
    400: blueColor,
    500: blueColor,
    600: blueColor,
    700: blueColor,
    800: blueColor,
    900: blueColor,
  };

  @override
  void initState() {
    final blueSwatch = MaterialColor(blueColor.value, blueColorMap);
    accentColor(Brightness brightness) =>
        brightness == Brightness.light ? blueColor : lightBlueColor;
    const headlineLarge =
        TextStyle(fontSize: 46.0, fontWeight: FontWeight.w600);
    const headlineMedium =
        TextStyle(fontSize: 36.0, fontWeight: FontWeight.w600);
    const headlineSmall =
        TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600);
    const titleLarge = TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600);
    const titleMedium = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600);
    const titleSmall = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600);
    const bodyLarge = TextStyle(fontSize: 22.0);
    const bodyMedium = TextStyle(fontSize: 18.0);
    const bodySmall = TextStyle(fontSize: 16.0);
    var textTheme = const TextTheme(
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
    );
    appBarTheme(Brightness brightness) => AppBarTheme.of(context).copyWith(
          backgroundColor:
              brightness == Brightness.light ? lightGreyColor : null,
          centerTitle: true,
        );
    textSelectionTheme(Brightness brightness) => TextSelectionThemeData(
        selectionColor: lightBlueColor.withAlpha(50),
        selectionHandleColor:
            brightness == Brightness.light ? blueColor : lightBlueColor,
        cursorColor:
            brightness == Brightness.light ? blueColor : lightBlueColor);
    textButtonTheme(Brightness brightness) => TextButtonThemeData(
            style: ButtonStyle(
          textStyle: WidgetStateProperty.all(
              bodyLarge.copyWith(color: accentColor(brightness))),
          foregroundColor:
              WidgetStateProperty.resolveWith((_) => accentColor(brightness)),
        ));
    elevatedButtonTheme(Brightness brightness) => ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(blueColor),
          textStyle:
              WidgetStateProperty.all(bodyLarge.copyWith(color: Colors.white)),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0)),
        ));
    dividerColor(Brightness brightness) =>
        brightness == Brightness.light ? lightGreyColor : darkGreyColor;
    dividerTheme(Brightness brightness) => DividerThemeData(
        space: 0, thickness: 1, color: dividerColor(brightness));

    const lightThemeAccentColor = blueColor;
    const darkThemeAccentColor = lightBlueColor;

    lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        accentColor: lightThemeAccentColor,
      ),
      primarySwatch: blueSwatch,
      primaryColor: blueColor,
      appBarTheme: appBarTheme(Brightness.light),
      textSelectionTheme: textSelectionTheme(Brightness.light),
      fontFamily: 'ChironHeiHK',
      textTheme: textTheme.copyWith(
          bodySmall: bodySmall.copyWith(color: darkGreyColor)),
      iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
      textButtonTheme: textButtonTheme(Brightness.light),
      elevatedButtonTheme: elevatedButtonTheme(Brightness.light),
      dividerColor: dividerColor(Brightness.light),
      dividerTheme: dividerTheme(Brightness.light),
    );
    darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: lightBlueColor,
        backgroundColor: darkThemeAccentColor,
      ),
      scaffoldBackgroundColor: Colors.black,
      primarySwatch: blueSwatch,
      primaryColor: blueColor,
      canvasColor: Colors.black,
      appBarTheme: appBarTheme(Brightness.dark),
      textSelectionTheme: textSelectionTheme(Brightness.dark),
      fontFamily: 'ChironHeiHK',
      textTheme: textTheme.copyWith(
          bodySmall: bodySmall.copyWith(color: lightGreyColor)),
      iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
      textButtonTheme: textButtonTheme(Brightness.dark),
      elevatedButtonTheme: elevatedButtonTheme(Brightness.dark),
      dividerColor: dividerColor(Brightness.dark),
      dividerTheme: dividerTheme(Brightness.dark),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Introduction',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const MyHomePage(title: '粵拼教學'),
        // home: mc1,
        routes: {
          '/syllabus-route': (context) => const SyllabusPage(),
          '/module1-1': (context) => widget.lessons[0],
          '/module1-2': (context) => widget.lessons[1],
          '/module1-3': (context) => widget.lessons[2],
          '/module1-4': (context) => widget.lessons[3],
          // '/module1-5': (context) => dialogue1,
          // '/module1-6': (context) => dialogue2,
          // '/module1-7': (context) => dialogue3,
          // '/module1-8': (context) => mc1,
          // '/module1-9': (context) => mc2,
          // '/module1-10': (context) => mc3,
          // '/module1-11': (context) => mc4,
          // '/module1-12': (context) => mc5,
          // '/module1-13': (context) => mc6,
          '/module1-14': (context) => CelebrationPage(),
        });
  }
}

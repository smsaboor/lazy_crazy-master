import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projects/constant/app_theme.dart';
import 'package:projects/utils/size_config.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'controllers/controller_binding.dart';
import 'utils/routes.dart';
import 'package:flutter/widgets.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';
// import 'package:sentry/sentry.dart';

const String _exampleDsn = 'https://681954fb94ee465bb38be0432808f51a@o1233405.ingest.sentry.io/6382328';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
  // await SentryFlutter.init(
  //       (options) {
  //     options.dsn = _exampleDsn;
  //     // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
  //     // We recommend adjusting this value in production.
  //     options.tracesSampleRate = 1.0;
  //   },
  //   appRunner: () => runApp(MyApp()),
  // );

  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Lazy Crazy",
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinding(),
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: AppTheme.primaryColor,
          accentColor: AppTheme.accentColor,
        ),
      ),
        initialRoute: '/login',
        getPages: Routes.routes
    );
  }
}


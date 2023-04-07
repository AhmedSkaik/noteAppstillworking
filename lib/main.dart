import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainingproj/provider/LanguageProvider.dart';
import 'package:trainingproj/Screens/launch_Screen.dart';
import 'package:trainingproj/Screens/login_screen.dart';
import 'package:trainingproj/sharedprefrancess/shared_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'Screens/homeScreen.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageProvider>(
           create: (context) => LanguageProvider() ,
        builder: (context, Widget? child) {
           return MaterialApp(
             debugShowCheckedModeBanner: false,
             initialRoute:  '/launchScreen',
             localizationsDelegates:const [
               AppLocalizations.delegate,
               GlobalWidgetsLocalizations.delegate,
               GlobalMaterialLocalizations.delegate,
               GlobalCupertinoLocalizations.delegate
             ],
             supportedLocales: const [
               Locale('ar'),
               Locale('en')
             ],
             locale:  Locale(Provider.of<LanguageProvider>(context).language),

             routes: {
               '/launchScreen' : (context) => LaunchSreen(),
               '/loginScreen' : (context) => LoginScreen(),
               '/homeScreen' : (context) => HomeScreen(),


             },

           );

        }


    );
  }
}

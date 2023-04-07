import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trainingproj/provider/LanguageProvider.dart';
import 'package:trainingproj/Modals/user.dart';
import 'package:trainingproj/sharedprefrancess/shared_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

late TextEditingController _emailtextEditingController;
late TextEditingController _passtextEditingController;

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    _emailtextEditingController = TextEditingController();
    _passtextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passtextEditingController.dispose();
    _emailtextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
         AppLocalizations.of(context)!.login,
          style: GoogleFonts.actor(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.welcome_hint,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              AppLocalizations.of(context)!.welcome_massege,
              style: GoogleFonts.cairo(fontWeight: FontWeight.w100),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailtextEditingController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_rounded),
                  hintText: AppLocalizations.of(context)!.email,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passtextEditingController,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: AppLocalizations.of(context)!.password,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _preformedlogin,
              child: Text(AppLocalizations.of(context)!.login),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<LanguageProvider>(context , listen: false).changeLanguage();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.language),
      ),
    );
  }

  Future<void> _preformedlogin() async {
    if (_checkdata()) {
      _login();
    }
  }

  bool _checkdata() {
    if (_passtextEditingController.text.isNotEmpty &&
        _emailtextEditingController.text.isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Eror Data!!'),
      backgroundColor: Colors.red,
      dismissDirection: DismissDirection.horizontal,
    ));
    return false;
  }

  Future<void> _login() async {
    SharedPrefController().save(user);
    Navigator.pushReplacementNamed(context, '/homeScreen');
  }

  User get user {
    return User(name: "name", email: _emailtextEditingController.text);
  }
}

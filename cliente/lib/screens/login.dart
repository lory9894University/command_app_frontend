import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../session.dart';
import 'menu.dart';
import 'profile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: <Widget>[
                Flex(direction: Axis.vertical, children: [
                  Image.asset(
                    'assets/images/ComandApp-circle-noslogan.png',
                    height: 300,
                    width: 300,
                    fit: BoxFit.fitWidth,
                  )
                ]),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    height: 300,
                    width: 300,
                    child: MobileScanner(
                        allowDuplicates: false,
                        onDetect: (barcode, args) {
                          if (barcode.rawValue != null) {
                            final String code = barcode.rawValue!;
                            debugPrint('Barcode found: $code');
                            order.tableID = code;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const Menu()),
                            );
                          }
                        }),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: SignInButton(
                    Buttons.GoogleDark,
                    text: "Log in con Google",
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () async {
                      //TODO: Autenticazione con google
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const Profile()),
                      );
                    },
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 30)),
                const Text('vuoi registrarti?'),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'clicca qui',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mobil_final/pages/AboutMe.dart';
import 'package:mobil_final/pages/HomePage.dart';
import 'package:mobil_final/pages/RegisterPage.dart';
import 'package:mobil_final/pages/SqflitePage.dart';
import 'package:mobil_final/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hoşgeldiniz'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Lottie.network(
                    'https://assets3.lottiefiles.com/packages/lf20_AMBEWz.json'),
              ),
              Text(
                'Lütfen Kullanıcı Bilgilerinizi Dogrulayınız',
                style: GoogleFonts.satisfy(fontSize: 20),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 3),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 1.0,
                              ),
                            ),
                            hintText: 'E-mail Giriniz',
                            prefixIcon: Icon(Icons.mail)),
                      ),
                      SizedBox(height: 3),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 1.0),
                            ),
                            hintText: 'Şifre Giriniz',
                            prefixIcon: Icon(Icons.key)),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _authService
                      .signIn(_emailController.text, _passwordController.text)
                      .then((value) {
                    return Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  });
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
                child: Text('Giriş'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[700],
                  minimumSize: Size(100, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Üye değil misin?',
                    style: TextStyle(color: Colors.orange, fontSize: 17),
                  ),
                  Icon(Icons.arrow_forward_outlined),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text('Kaydol'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[700],
                      minimumSize: Size(100, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutMe()));
                },
                child: Text('Hakkımda'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[700],
                  minimumSize: Size(100, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SqflitePage()));
                },
                child: Text('SSS'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[700],
                  minimumSize: Size(100, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

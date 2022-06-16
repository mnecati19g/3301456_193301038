import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobil_final/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'LoginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =TextEditingController();


  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kaydol'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Lütfen Kayıt Bilgilerinizi Dogrulayınız',
                style: GoogleFonts.satisfy(fontSize: 20),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 1.0),
                            ),
                            hintText: 'İsim Giriniz',
                            prefixIcon: Icon(Icons.person)),
                      ),
                      SizedBox(height: 3),
                      TextFormField(
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
                      SizedBox(height: 3),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordAgainController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 1.0),
                            ),
                            hintText: 'Tekrar Şifre Giriniz',
                            prefixIcon: Icon(Icons.key)),
                      ),
                      SizedBox(height: 3),
                      ElevatedButton(
                        onPressed: () async{
                          await _authService.createPerson(_nameController.text, _emailController.text,_passwordController.text).then((value) {
                            return Navigator.pop(context);
                            //Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
                          });
                        },
                        child: Text('Kaydet'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[700],
                          minimumSize: Size(100, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        ),
                      ),

                      /*TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 1.0),
                            ),
                            hintText: 'Cinsiyet Giriniz',
                            prefixIcon: Icon(Icons.wc)),
                      ),*/
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

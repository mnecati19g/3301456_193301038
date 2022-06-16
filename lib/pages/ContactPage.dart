import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobil_final/pages/AboutMe.dart';
import 'package:mobil_final/pages/HomePage.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('İletişim Bilgilerim'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Telefon No : 0 546 118 17 01',style:GoogleFonts.cookie(fontSize: 36),),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Mail Adresi:gulecmehmetnecati@gmail.com',style:GoogleFonts.commissioner(fontSize: 18),),
                  ),
                ],
              ),

              SizedBox(height: 300,),
              GestureDetector(
                onHorizontalDragEnd: (DragStartDetails){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutMe()));
                  },
                  child: Text(
                    'Hakkımda Sayfasına Dön',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[700],
                    minimumSize: Size(200, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20.0))),
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

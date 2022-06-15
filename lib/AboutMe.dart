import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobil_final/ContactPage.dart';
import 'package:mobil_final/LoginPage.dart';
import 'package:mobil_final/ReferencesPage.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hakkımda',
            style: GoogleFonts.cormorant(fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text(
                  'Ben Mehmet Necati Güleç.20 yaşındayım.Adanalıyım.193301038 nolu Bilgisayar mühendisliği 3.sınıf öğrencisiyim bu projeyi 3301456 kodlu mobil programlama dersi kapsamında final ödevim için kodladım.17/06/2022',
                  style: GoogleFonts.robotoMono(fontSize: 16),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text('Geri Dön'),
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
                    MaterialPageRoute(builder: (context) => ContactPage()));
              },
              child: Text('İletişim Bilgileri'),
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
                    MaterialPageRoute(builder: (context) => ReferencesPage()));
              },
              child: Text('Yararlanılan Kaynaklar'),
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
    );
  }
}

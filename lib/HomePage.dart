import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobil_final/AddHelp.dart';
import 'package:mobil_final/AddProduct.dart';
import 'package:mobil_final/Help.dart';
import 'package:mobil_final/LoginPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('AnaSayfa'),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Hosgeldiniz ',
                  style: GoogleFonts.satisfy(fontSize: 24,color: Colors.orange),
                ),
                Image.asset('assets/images/helpinghand624.jpeg'),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                  child: Text('Çıkış'),
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
                        MaterialPageRoute(builder: (context) => HelpPage()));
                  },
                  child: Text('Yardım Bekleyenler'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[700],
                    minimumSize: Size(100, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddProductPage()));
                  },
                  child: Text('Hibe Ürünler'),
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
                      'Yardım İstemek İçin Tıkla',
                      style: TextStyle(color: Colors.orange, fontSize: 17),
                    ),
                    Icon(Icons.arrow_forward_outlined),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddHelpPage()));
                      },
                      child: Icon(Icons.add),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        minimumSize: Size(100, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

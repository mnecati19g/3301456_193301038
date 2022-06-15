import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobil_final/AboutMe.dart';

class ReferencesPage extends StatefulWidget {
  const ReferencesPage({Key? key}) : super(key: key);

  @override
  State<ReferencesPage> createState() => _ReferencesPageState();
}

class _ReferencesPageState extends State<ReferencesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('KAYNAKÇA'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('https://stackoverflow.com/'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('https://flutter.dev/'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'https://www.youtube.com/playlist?list=PLJ5EAGz05Q3FJG96SH8GoWcSUg8IHwtnt',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 300,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutMe()));
                },
                child: Text('Hakkımda Sayfasına Dön'),
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

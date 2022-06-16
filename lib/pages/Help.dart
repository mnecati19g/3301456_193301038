import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobil_final/pages/AddHelp.dart';
import 'package:mobil_final/pages/HomePage.dart';

class HelpPage extends StatefulWidget {
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    CollectionReference text1Ref = _firestore.collection('helpRequests');
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Yardım Bekleyenler'),
        ),
        body: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: text1Ref.snapshots(),
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                List<DocumentSnapshot> listOfDocumentSnap =
                    asyncSnapshot.data.docs;

                return Flexible(
                  child: ListView.builder(
                    itemCount: listOfDocumentSnap.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Card(
                          child: ListTile(
                            title: Text('${index + 1}.Yardım İsteği'),
                            subtitle: Text(
                              '${listOfDocumentSnap[index].get('name')} - ${listOfDocumentSnap[index].get('text')}',
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                await listOfDocumentSnap[index]
                                    .reference
                                    .delete();
                              },
                            ),
                          ),
                        ),
                      );

                      Text(
                        '${listOfDocumentSnap[index].get('name')}',
                      );
                    },
                  ),
                );

                Text('${asyncSnapshot.data.data()}');
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddHelpPage()));
              },
              child: Text(
                'İstek Ekleme Sayfasına Git',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[700],
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  'Anasayfa',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[700],
                  minimumSize: Size(200, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                ),
              ),
            ),
            //Text('sent message:${_yardimTextController.text.value}'),
          ],
        ),
      ),
    );
  }
}

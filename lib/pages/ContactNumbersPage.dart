import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobil_final/pages/Help.dart';

import 'HomePage.dart';

class ContactNumbersPage extends StatefulWidget {
  const ContactNumbersPage({Key? key}) : super(key: key);

  @override
  State<ContactNumbersPage> createState() => _ContactNumbersPageState();
}

class _ContactNumbersPageState extends State<ContactNumbersPage> {
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
          title: Text('Yardım Edebileceğiniz Kişilerin Bilgileri'),
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
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: ListTile(
                                title: Center(
                                  child: Text(
                                    '${listOfDocumentSnap[index].get('name')}',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.orange),
                                  ),
                                ),
                                subtitle: Center(
                                  child: Text(
                                    'No : ${listOfDocumentSnap[index].get('number')}',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.orange),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                    MaterialPageRoute(builder: (context) => HelpPage()));
              },
              child: Text(
                'İstekleri görüntüle',
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

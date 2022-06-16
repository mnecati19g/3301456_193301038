import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil_final/pages/Help.dart';

class AddHelpPage extends StatefulWidget {
  const AddHelpPage({Key? key}) : super(key: key);

  @override
  State<AddHelpPage> createState() => _AddHelpPageState();
}

class _AddHelpPageState extends State<AddHelpPage> {
  final _firestore = FirebaseFirestore.instance;
  final TextEditingController yardimTextController = TextEditingController();
  final TextEditingController isimTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference text1Ref = _firestore.collection('helpRequests');
    var text2Ref = text1Ref.doc('Ahmet');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Yardım Ekleme Sayfası'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    //Text('${text2Ref.path}'),
                    /* (_yardimTextController.value.text.isEmpty)
                        ? Text('lütfen mesaj giriniz')
                        : TextFormField(
                            maxLines: 10,
                            minLines: 1,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                      color: Colors.orange, width: 1.0),
                                ),
                                hintText: '${_yardimTextController.value.text}',
                                prefixIcon: Icon(Icons.share)),
                          ),*/
                    /*ElevatedButton(
                      onPressed: () async {
                        var response = await text2Ref.get();
                        var map = response.data();
                        print(map);
                        /*Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpPage()));*/
                      },
                      child: Text(
                        'Veri getir',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[700],
                        minimumSize: Size(200, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                      ),
                    ),*/
                    /*StreamBuilder<QuerySnapshot>(
                      stream: text1Ref.snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot asyncSnapshot) {
                        List<DocumentSnapshot> listOfDocumentSnap =
                            asyncSnapshot.data.docs;

                        return Flexible(
                          child: ListView.builder(
                            itemCount: listOfDocumentSnap.length,
                            itemBuilder: (context, index) {
                              return Card(
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
                              );

                              Text(
                                '${listOfDocumentSnap[index].get('name')}',
                              );
                            },
                          ),
                        );

                        Text('${asyncSnapshot.data.data()}');
                      },
                    ),*/
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: isimTextController,
                            minLines: 1,
                            maxLines: 10,
                            keyboardType: TextInputType.multiline,
                            //controller: _passwordController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(50),
                                labelText: 'İsminizi Yazınız',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.orange,
                                    width: 5.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.white),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                prefixIcon: Icon(Icons.format_align_left)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: yardimTextController,
                            minLines: 1,
                            maxLines: 10,
                            keyboardType: TextInputType.multiline,
                            //controller: _passwordController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(50),
                                labelText: 'Açıklamanızı Yazınız',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.orange,
                                    width: 5.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.white),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                prefixIcon: Icon(Icons.format_align_left)),
                          ),
                          SizedBox(
                            height: 75,
                          ),
                          (isimTextController.value.text.isEmpty)?Text("lütfen istek giriniz",style: TextStyle(fontSize: 24,color: Colors.orange),):   Text("${isimTextController.value.text},isteğin eklendi.",style: TextStyle(fontSize: 24,color: Colors.orange),),
                          SizedBox(
                            height: 75,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              Map<String, dynamic> kullaniciYardimIstegi = {
                                'name': isimTextController.text,
                                'text': yardimTextController.text
                              };
                              /*Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpPage()));*/
                              await text1Ref
                                  .doc(isimTextController.text)
                                  .set(kullaniciYardimIstegi);
                              setState(() {
                                isimTextController.notifyListeners();
                              });

                            },
                            child: Text(
                              'İstek Ekle',
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
                          SizedBox(
                            height: 20,
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
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /*ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _yardimTextController.notifyListeners();
                        });
                        /*Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpPage()));*/
                      },
                      child: Text(
                        'Ekle',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[700],
                        minimumSize: Size(200, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                      ),
                    ),*/

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobil_final/pages/ProductPage.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _firestore = FirebaseFirestore.instance;

  final TextEditingController _hibeTextController = TextEditingController();
  final TextEditingController _isim2TextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference text3Ref = _firestore.collection('addProduct');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Hibe Ekleme Sayfası'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        minLines: 1,
                        maxLines: 10,
                        controller: _isim2TextController,
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
                      SizedBox(height: 10),
                      TextFormField(
                        minLines: 1,
                        maxLines: 10,
                        controller: _hibeTextController,
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
                      (_isim2TextController.value.text.isEmpty)?Text("lütfen ürün giriniz",style: TextStyle(fontSize: 24,color: Colors.orange),):   Text("${_isim2TextController.value.text},bağışın eklendi.",style: TextStyle(fontSize: 24,color: Colors.orange),),
                      SizedBox(
                        height: 75,
                      ),

                      ElevatedButton(
                        onPressed: () async {
                          Map<String, dynamic> hibeIstegi = {
                            'name': _isim2TextController.text,
                            'text': _hibeTextController.text
                          };
                          await text3Ref
                              .doc(_isim2TextController.text)
                              .set(hibeIstegi);
                          setState(() {
                            _isim2TextController.notifyListeners();
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
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage()));
                        },
                        child: Text(
                          'Hibe Ürünleri görüntüle',
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
                      /*(_hibeTextController.value.text.isEmpty) ? Text('Lütfen Bağışlamak İstediklerinizi Belirtiniz.'):TextFormField(
                        maxLines: 10,
                        minLines: 1,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                  color: Colors.orange, width: 1.0),
                            ),
                            hintText: '${_hibeTextController.value.text}',
                            prefixIcon: Icon(Icons.share)),
                      ),*/
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

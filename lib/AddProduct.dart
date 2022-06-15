import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _hibeTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Hibe Ekleme Sayfası'),
            centerTitle: true,
          ),
          body: Form(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          borderSide:
                          const BorderSide(width: 3, color: Colors.white),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        prefixIcon: Icon(Icons.format_align_left)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _hibeTextController.notifyListeners();
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
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  (_hibeTextController.value.text.isEmpty) ? Text('Lütfen Bağışlamak İstediklerinizi Belirtiniz.'):TextFormField(
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
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

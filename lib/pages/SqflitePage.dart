import 'dart:io';
import 'dart:ui';
import 'package:mobil_final/main.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class SqflitePage extends StatefulWidget {
  const SqflitePage({Key? key}) : super(key: key);

  @override
  State<SqflitePage> createState() => _SqflitePageState();
}

class _SqflitePageState extends State<SqflitePage> {
  int? selectedId;
  final text4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: text4Controller,
            style: TextStyle(
              color: Colors.orange,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide:
                BorderSide(color: Colors.orange, width: 1.0),
              ),
              hintText: 'Sorunuzu belirtiniz :',
                prefixIcon: Icon(Icons.live_help,color: Colors.orange,),
            ),
          ),
        ),
        body: FutureBuilder<List<SoruHavuzu>>(
          future: VeriTabaniOlusturucu.instance.sorulariGetir(),
          builder:
              (BuildContext context, AsyncSnapshot<List<SoruHavuzu>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: Text('Yükleniyor...',
                      style: TextStyle(color: Colors.orange)));
            }
            return snapshot.data!.isEmpty
                ? Center(
                    child: Text(
                    'Listede hiç soru yok.',
                    style: TextStyle(color: Colors.orange),
                  ))
                : ListView(
                    children: snapshot.data!.map((soruhavuzu) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Card(
                            color: selectedId == soruhavuzu.id
                                ? Colors.orange
                                : Colors.black,
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  if (selectedId == null) {
                                    text4Controller.text = soruhavuzu.name;
                                    selectedId = soruhavuzu.id;
                                  } else {
                                    text4Controller.text = '';
                                    selectedId = null;
                                  }
                                });
                              },
                              onLongPress: () {
                                setState(() {
                                  VeriTabaniOlusturucu.instance.remove(soruhavuzu.id!);
                                });
                              },
                              title: Text(soruhavuzu.name,
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
          },
        ),
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.red,
          backgroundColor: Colors.orange,
          child: Icon(Icons.save,),
          onPressed: () async {
            selectedId != null
                ? await VeriTabaniOlusturucu.instance.update(
              SoruHavuzu(id: selectedId, name: text4Controller.text),
                  )
                : await VeriTabaniOlusturucu.instance.add(
              SoruHavuzu(name: text4Controller.text),
                  );
            setState(() {
              text4Controller.clear();
            });
          },
        ),
      ),
    );
  }
}

class SoruHavuzu {
  final int? id;
  final String name;

  SoruHavuzu({this.id, required this.name});

  factory SoruHavuzu.fromMap(Map<String, dynamic> json) => new SoruHavuzu(
        id: json['id'],
        name: json['name'],
      );
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class VeriTabaniOlusturucu {
  VeriTabaniOlusturucu._privateConstructur();
  static final VeriTabaniOlusturucu instance = VeriTabaniOlusturucu._privateConstructur();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'sorular.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE sorular(
    id INTEGER PRIMARY KEY,
    name TEXT 
    )
    ''');
  }

  Future<List<SoruHavuzu>> sorulariGetir() async {
    Database db = await instance.database;
    var sorular = await db.query('sorular', orderBy: 'name');
    List<SoruHavuzu> soruList = sorular.isNotEmpty
        ? sorular.map((c) => SoruHavuzu.fromMap(c)).toList()
        : [];
    return soruList;
  }

  Future<int> add(SoruHavuzu soruhavuzu) async {
    Database db = await instance.database;
    return await db.insert('sorular', soruhavuzu.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('sorular', where: 'id =?', whereArgs: [id]);
  }

  Future<int> update(SoruHavuzu soruhavuzu) async {
    Database db = await instance.database;
    return await db.update('sorular', soruhavuzu.toMap(),
        where: 'id =?', whereArgs: [soruhavuzu.id]);
  }
}

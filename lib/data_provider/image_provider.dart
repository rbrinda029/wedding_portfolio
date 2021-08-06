import 'dart:convert';

import 'package:firebase/firebase.dart';
import 'package:myapp/data_provider/images.dart';
import 'package:flutter/cupertino.dart';

class ImgProvider extends ChangeNotifier {
  // final databaseReference = FirebaseDatabase.instance.reference();

  Database db = database();

  String tableImage = "Images";

  String tableFieldName = "name";
  String tableFieldUrl = "url";

  List<ImageData> imgList = [];

  bool isLoading = false;

  updateLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<void> setImageList() async {
    updateLoading(true);
    DatabaseReference ref = db.ref(tableImage);
    try {
      ref.onValue.listen((e) {
        DataSnapshot dataSnapshot = e.snapshot;
        imgList.clear();
        dataSnapshot.forEach((item) {
          print("item is ${item.child("name").val()} ${item.toJson()}");
          imgList.add(ImageData(
            id: "",
            name: item.child(tableFieldName).val(),
            url: item.child(tableFieldUrl).val(),
          ));
        });
        updateLoading(false);
      });
    } catch (err) {
      print("get image err $err");
    }
  }
}

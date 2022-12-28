import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppHelper {

  static Future<dynamic> pickImage(BuildContext context) async {
    dynamic result = await showModalBottomSheet(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(
                  'Camera',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.of(context).pop(0);
                },
              ),
              Divider(
                height: 0,
                color: Colors.black26,
                thickness: 0.5,
              ),
              ListTile(
                title: Text(
                  'Gallery',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.of(context).pop(1);
                },
              ),
              Divider(
                height: 0,
                color: Colors.black26,
                thickness: 0.5,
              ),
            ],
          ),
        );
      },
    );
    if (result != null && result is int) {
      if (result == 0) {
        try {
          PickedFile? pickedFile = await ImagePicker.platform
              .pickImage(imageQuality: 25, source: ImageSource.camera);
          if (pickedFile != null) {
            final bytes = pickedFile.readAsBytes();
            print('SIZE IN BYTE ===> ${bytes}');
            return File(pickedFile.path);

          }
        } catch (e) {
          print('Exception========> $e');
        }
      } else if (result == 1) {
        PickedFile? pickedFile =
        await ImagePicker.platform.pickImage(imageQuality: 25, source: ImageSource.gallery);

        if (pickedFile != null) {
          final bytes = pickedFile.readAsBytes();

          print('SIZE IN BYTE ===> ${bytes.toString()}');
          return File(pickedFile.path);
        }
      } else if (result == 2) {
        return null;
      }
    }
    return null;
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showCameraAndGalleryDialog(
    BuildContext context, Function(XFile?) callback) async {
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title:
              const Text('Open Gallery or Camera to update your profile photo'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: () async {
                Navigator.of(context).pop();
                final imagePicker = ImagePicker();
                final pickedImage =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                if (pickedImage != null) {
                  callback(pickedImage);
                }
              },
              child: const Text(
                'Open Gallery',
                style: TextStyle(color: Colors.black),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                Navigator.of(context).pop();
                final imagePicker = ImagePicker();
                final pickedImage =
                    await imagePicker.pickImage(source: ImageSource.camera);
                if (pickedImage != null) {
                  callback(pickedImage);
                }
              },
              child: const Text(
                'Open Camera',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      },
    );
  } else {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Open Gallery'),
              onTap: () async {
                Navigator.of(context).pop();
                final imagePicker = ImagePicker();
                final pickedImage =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                if (pickedImage != null) {
                  callback(pickedImage);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Open Camera'),
              onTap: () async {
                Navigator.of(context).pop();
                final imagePicker = ImagePicker();
                final pickedImage =
                    await imagePicker.pickImage(source: ImageSource.camera);
                if (pickedImage != null) {
                  callback(pickedImage);
                }
              },
            ),
            ListTile(
              title: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_ui_clone/Widgets/styled_text.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  Uint8List? selectedImage;

  Future<Uint8List?> imageProviderFromDevice({
    required BuildContext context,
  }) async {
    final ImagePicker picker = ImagePicker();

    // Pick single image
    final XFile? file = await picker.pickImage(source: ImageSource.camera);

    if (file != null) {
      return file.readAsBytes();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledText(text: "Image Picker")),
      body: Column(
        children: [
          if (selectedImage != null)
            Expanded(child: Image.memory(selectedImage!)),
          Expanded(
            child: Center(
              child: TextButton(
                onPressed: () async {
                  selectedImage = await imageProviderFromDevice(
                    context: context,
                  );
                  setState(() {});
                },
                child: StyledText(text: "Select Image"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

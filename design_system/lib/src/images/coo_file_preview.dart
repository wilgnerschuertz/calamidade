import 'dart:io';
import 'package:flutter/material.dart';
enum FilePreviewType {
  file,
  network,
}

class CooFilePreview extends StatelessWidget {
  final FilePreviewType type;
  final String path;

  const CooFilePreview({
    super.key,
    required this.type,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: type == FilePreviewType.file
              ? Image.file(
                  File(path),
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.sizeOf(context).width,
                )
              : Image.network(
                  path,
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.sizeOf(context).width,
                ),
        ),
      ),
    );
  }
}

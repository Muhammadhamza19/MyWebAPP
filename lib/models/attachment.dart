import 'package:flutter/foundation.dart';

class Attachment {
  final int index;
  final String fileName;
  final Uint8List fileBytes;
  final String fileExt;
  final String filePath;
  final double fileSize;

  // Attachment({});

  Attachment({
    required this.index,
    required this.fileName,
    required this.fileBytes,
    required this.fileExt,
    required this.filePath,
    required this.fileSize,
  });
}

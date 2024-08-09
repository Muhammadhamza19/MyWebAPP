import 'dart:io';
import 'dart:typed_data';
import 'package:byte_converter/byte_converter.dart';
import 'package:local_grocery/support/config/app_colors.dart';
import 'package:local_grocery/support/config/app_theme.dart';
import 'package:local_grocery/view_models/attachment_component_view_model.dart';
import 'package:local_grocery/ui/shared/widgets/my_asset_image.dart';
import 'package:local_grocery/ui/shared/widgets/my_text.dart';
import 'package:local_grocery/models/attachment.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class AttachmentComponent extends StatelessWidget {
  final String? upperText;
  final Function(Attachment?) onSelect;
  final Function(int) onRemove;
  List<Attachment> selectedFiles;
  final bool? allowMultipleFiles;
  String ext;

  AttachmentComponent({
    this.upperText,
    required this.selectedFiles,
    required this.onSelect,
    required this.onRemove,
    this.ext = '',
    this.allowMultipleFiles,
  });

  @override
  Widget build(BuildContext context) {
    final AttachmentComponentViewModel model =
        Get.put(AttachmentComponentViewModel());
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20.0,
                left: 10.0,
                right: 10.0,
              ),
              child: MyText(
                upperText ??
                    "*Maximum (5) attachments allowed; each should not exceed the 5 MB limit.*",
                textAlign: TextAlign.center,
              ),
            ),
            // SizedBox(
            //   height: 20.0,
            // ),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 20.0, top: 0.0),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 100.0,
                        width: 75.0,
                        decoration: BoxDecoration(
                          color: Colors.grey, //themeLight
                          border: Border.all(
                            color: Colors.grey, //theme
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Center(
                          child: MouseRegion(
                            key: Key("MyImage"),
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () async {
                                await _onImageButtonPressed();
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white, // Update with your color
                                size: 25.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(() => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20.0,
                              ),
                              child: Container(
                                height: 120,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: model.selectedFiles.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            // right: 10.0,
                                            left: 10.0,
                                          ),
                                          child: Container(
                                            height: 100.0,
                                            width: 75.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  backgroundColor, //themeLight
                                              border: Border.all(
                                                color: Colors.grey, //theme
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: MouseRegion(
                                                    key: Key("MyImage"),
                                                    cursor: SystemMouseCursors
                                                        .click,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // model.onViewImage(index);
                                                        _onViewImage(index);
                                                      },
                                                      child: model
                                                              .selectedFiles[
                                                                  index]
                                                              .fileExt
                                                              .contains("pdf")
                                                          ? MyAssetImage(
                                                              imageName:
                                                                  "pdf_download",
                                                              height: 50.0,
                                                              width: 50.0,
                                                            )
                                                          : model
                                                                  .selectedFiles[
                                                                      index]
                                                                  .fileExt
                                                                  .contains(
                                                                      "xlsx")
                                                              ? MyAssetImage(
                                                                  imageName:
                                                                      "excel_download",
                                                                  height: 50.0,
                                                                  width: 50.0,
                                                                )
                                                              : ((model
                                                                          .selectedFiles[
                                                                              index]
                                                                          .fileExt
                                                                          .contains(
                                                                              "doc")) ||
                                                                      model
                                                                          .selectedFiles[
                                                                              index]
                                                                          .fileExt
                                                                          .contains(
                                                                              "docx"))
                                                                  ? MyAssetImage(
                                                                      imageName:
                                                                          "word_download",
                                                                      height:
                                                                          50.0,
                                                                      width:
                                                                          50.0,
                                                                    )
                                                                  : model
                                                                          .selectedFiles[
                                                                              index]
                                                                          .fileExt
                                                                          .contains(
                                                                              "txt")
                                                                      ? MyAssetImage(
                                                                          imageName:
                                                                              "txt_download",
                                                                          height:
                                                                              50.0,
                                                                          width:
                                                                              50.0,
                                                                        )
                                                                      : Image
                                                                          .memory(
                                                                          Uint8List.fromList(model
                                                                              .selectedFiles[index]
                                                                              .fileBytes),
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                    ),
                                                  ),
                                                ),
                                                MouseRegion(
                                                  key: Key("MyDelete"),
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      // model.onRemove(index);
                                                      _onRemove(index);
                                                      // onRemove(index);
                                                    }, //=> onRemove(index),
                                                    child: Icon(
                                                      Icons.cancel_sharp,
                                                      size: 25.0,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        MyText(
                                          "${model.selectedFiles[index].fileSize.toStringAsFixed(2).toString()} mb",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onImageButtonPressed() async {
    try {
      final AttachmentComponentViewModel model = Get.find();

      Attachment? attachment;

      FilePickerResult? result = (await FilePicker.platform.pickFiles(
        type: (ext.isNotEmpty) ? FileType.custom : FileType.any,
        allowMultiple: allowMultipleFiles ?? false,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions:
            (ext.isNotEmpty) ? ext.replaceAll(' ', '').split(',') : null,
      ));

      if (result != null) {
        for (var file in result.files) {
          ByteConverter converter =
              ByteConverter(result.files.first.size.toDouble());

          if (file.extension == "pdf" ||
              file.extension == "PDF" ||
              file.extension == "xlsx" ||
              file.extension == "XLSX" ||
              file.extension == "docx" ||
              file.extension == "DOCX" ||
              file.extension == "doc" ||
              file.extension == "DOC" ||
              file.extension == "txt" ||
              file.extension == "TXT" ||
              file.extension == "png" ||
              file.extension == "PNG" ||
              file.extension == "jpg" ||
              file.extension == "JPG" ||
              file.extension == "jpeg" ||
              file.extension == "JPEG") {
            if (converter.megaBytes < 5) {
              Uint8List fileBytes = await File(file.path ?? "").readAsBytes();

              if ((selectedFiles.length) < 5) {
                attachment = Attachment(
                  index: 1,
                  fileName: file.name,
                  fileBytes: fileBytes,
                  fileExt: file.extension!,
                  filePath: file.path!,
                  fileSize: converter.megaBytes,
                );

                model.selectedFiles.add(attachment);
              } else {
                showInfoMessage("Attachment Limit Exceeded!");
                return null;
              }
            } else {
              showInfoMessage("Maximum file size should not exceed 5 mb");
              return null;
            }
          } else {
            showInfoMessage("Kindly upload desired attachments!");
            return null;
          }
        }
      }
      return null;
    } catch (e) {
      print("catch_error_${e}");
      return null;
    }
  }

  Future<void> _onViewImage(int index) async {
    final AttachmentComponentViewModel model = Get.find();

    String filePath = model.selectedFiles.elementAt(index).filePath;
    String fileExt = model.selectedFiles.elementAt(index).fileExt;
    String fileName = model.selectedFiles.elementAt(index).fileName;
    Uint8List fileBytes = model.selectedFiles.elementAt(index).fileBytes;

    final externalDir = await getExternalStorageDirectory();

    if (fileExt.contains("pdf") ||
        fileExt.contains("PDF") ||
        fileExt.contains("xlsx") ||
        fileExt.contains("XLSX") ||
        fileExt.contains("doc") ||
        fileExt.contains("DOC") ||
        fileExt.contains("docx") ||
        fileExt.contains("DOCX") ||
        fileExt.contains("txt") ||
        fileExt.contains("TXT") ||
        fileExt.contains("jpg") ||
        fileExt.contains("JPG") ||
        fileExt.contains("jpeg") ||
        fileExt.contains("JPEG") ||
        fileExt.contains("png") ||
        fileExt.contains("PNG")) {
      if (filePath.contains("https")) {
        final response = await http.get(Uri.parse(filePath));

        if (response.statusCode == 200) {
          final Uint8List data = response.bodyBytes;

          // final externalDir = await getExternalStorageDirectory();

          if (externalDir != null) {
            final downloadsDir = Directory('${externalDir.path}/Download/');
            await downloadsDir.create(recursive: true);
            final savePath = '${downloadsDir.path}/${fileName}';
            final file = File(savePath);
            await file.writeAsBytes(data);

            final result = await OpenFilex.open(savePath);
            if (result.type == ResultType.noAppToOpen) {
              showInfoMessage(result.message);
            }
          }
        } else {
          throw Exception('Failed to download file');
        }
      } else {
        try {
          if (externalDir != null) {
            final downloadsDir = Directory('${externalDir.path}/Download/');
            await downloadsDir.create(recursive: true);
            final savePath = '${downloadsDir.path}/${fileName}';
            final file = File(savePath);
            await file.writeAsBytes(fileBytes);

            final result = await OpenFilex.open(savePath);
            if (result.type == ResultType.noAppToOpen) {
              showInfoMessage(result.message);
            }
          }
        } catch (e) {
          throw Exception('Failed to open file');
        }
      }
    }
  }

  Future<void> _onRemove(int index) async {
    final AttachmentComponentViewModel model = Get.find();
    model.selectedFiles.removeAt(index);
  }
}

import 'package:local_grocery/view_models/base_view_model.dart';
import 'package:local_grocery/models/attachment.dart';
import 'package:get/get.dart';

class AttachmentComponentViewModel extends BaseViewModel {
  RxList<Attachment> selectedFiles = <Attachment>[].obs;
}

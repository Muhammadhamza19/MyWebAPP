import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_grocery/ui/base_scaffold_screen.dart';
import 'package:local_grocery/ui/chat/cards/chat_bubble.dart';
import 'package:local_grocery/ui/shared/components/error_view.dart';
import 'package:local_grocery/ui/shared/components/loading_list_tile.dart';
import 'package:local_grocery/ui/shared/components/loading_list_view.dart';
import 'package:local_grocery/ui/shared/components/my_app_bar.dart';
import 'package:local_grocery/ui/shared/components/shimmer_widget.dart';
import 'package:local_grocery/ui/shared/widgets/my_input_box.dart';
import 'package:local_grocery/view_models/chat_view_model.dart';

class ChatMainView extends StatefulWidget {
  @override
  _ChatMainViewState createState() => _ChatMainViewState();
}

class _ChatMainViewState extends State<ChatMainView> {
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add({
          'text': _controller.text,
          'time': DateTime.now().toString(),
        });
        _controller.clear();
      });
    }
  }

  String _formatTime(DateTime time) {
    String hour = time.hour.toString().padLeft(2, '0');
    String minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatViewModel>(
      init: ChatViewModel(),
      dispose: (_) => Get.find<ChatViewModel>().onClose(),
      builder: (_model) {
        return BaseScaffoldScreen(
          automaticallyImplyLeading: false,
          appBar: _appBar(),
          body: Obx(
            () {
              /// Show loader during page load
              if (_model.isLoading) {
                return _loadingContent();
              }

              /// Show error state
              if (_model.isError) {
                return ErrorView(_model.errorMessage.value,
                    refreshFunction: () => _model.fetchData());
              }

              /// show page content
              return Obx(
                () => (_model.shouldNotify.value)
                    ? _pageContent(context)
                    : const SizedBox(),
              );
            },
          ),
        );
      },
    );
  }

  Widget _appBar() {
    return MyAppBar(
      title: "Chat",
      onBackPressed: () => Get.back(),
    );
  }

  Widget _loadingContent() {
    return ShimmerWidget(
      child: LoadingListView(
        child: LoadingListTile(),
      ),
    );
  }

  Widget _pageContent(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return ChatBubble(
                text: messages[index]['text']!,
                time: _formatTime(DateTime.parse(messages[index]['time']!)),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: MyInputBox(
                  controller: _controller,
                  borderLabel: "Write Message Here",
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

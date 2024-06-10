import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Example for EmojiPicker
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  bool _emojiShowing = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Emoji Picker Example App'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: ValueListenableBuilder(
                    valueListenable: _controller,
                    builder: (context, text, child) {
                      return Text(
                        _controller.text,
                      );
                    },
                  ),
                ),
              ),
              Container(
                  height: 66.0,
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _emojiShowing = !_emojiShowing;
                            });
                          },
                          icon: const Icon(
                            Icons.emoji_emotions,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                              controller: _controller,
                              scrollController: _scrollController,
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.black87,
                              ),
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: 'Type a message',
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.only(
                                  left: 16.0,
                                  bottom: 8.0,
                                  top: 8.0,
                                  right: 16.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              )),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: IconButton(
                            onPressed: () {
                              // send message
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                            )),
                      )
                    ],
                  )),
              Offstage(
                offstage: !_emojiShowing,
                child: EmojiPicker(
                  // textEditingController: _controller,
                  scrollController: _scrollController,
                  // customWidget: (
                  //   Config config,
                  //   EmojiViewState state,
                  //   VoidCallback showSearchBar,
                  // ) {
                  //   return DefaultEmojiPickerView(
                  //     config,
                  //     state,
                  //     () {},
                  //   );
                  // },
                  config: Config(
                    height: 256,
                    checkPlatformCompatibility: true,
                    emojiViewConfig: EmojiViewConfig(
                        emojiSizeMax: 28 * (foundation.defaultTargetPlatform == TargetPlatform.iOS ? 1.2 : 1.0),
                        backgroundColor: Colors.black,
                        columns: 8,
                        noRecents: Text(
                          'No Recents',
                          style: TextStyle(fontSize: 20, color: Colors.white60),
                          textAlign: TextAlign.center,
                        )),
                    swapCategoryAndBottomBar: true,
                    skinToneConfig: SkinToneConfig(indicatorColor: Colors.transparent, dialogBackgroundColor: Colors.black, enabled: true),
                    categoryViewConfig: CategoryViewConfig(
                      backgroundColor: Colors.black,
                    ),
                    bottomActionBarConfig: const BottomActionBarConfig(
                        backgroundColor: Colors.black,
                        showBackspaceButton: false,
                        buttonColor: Colors.transparent,
                        buttonIconColor: Colors.white),
                    searchViewConfig: SearchViewConfig(
                      backgroundColor: Colors.black,
                      buttonColor: Colors.white,
                      buttonIconColor: Colors.white,
                      hintText: "Search emoji",
                      hintStyle: TextStyle(color: Colors.white),
                      emojiListBgColor: Colors.black
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

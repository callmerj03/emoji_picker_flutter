import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// Default Search implementation
class DefaultSearchView extends SearchView {
  /// Constructor
  const DefaultSearchView(
    Config config,
    EmojiViewState state,
    VoidCallback showEmojiView,
  ) : super(config, state, showEmojiView);

  @override
  DefaultSearchViewState createState() => DefaultSearchViewState();
}

/// Default Search View State
class DefaultSearchViewState extends SearchViewState {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final emojiSize = widget.config.emojiViewConfig.getEmojiSize(constraints.maxWidth);
      final emojiBoxSize = widget.config.emojiViewConfig.getEmojiBoxSize(constraints.maxWidth);

      return Container(
        color: widget.config.searchViewConfig.backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            Material(
              child: Container(
                color: widget.config.searchViewConfig.emojiListBgColor,
                height: emojiBoxSize + 8.0,
                child: results.length > 0 ?
                ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    return buildEmoji(
                      results[index],
                      emojiSize,
                      emojiBoxSize,
                    );
                  },
                ) : Center(child: Text("No Data",  style: widget.config.searchViewConfig.hintStyle,)),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    widget.showEmojiView();
                  },
                  color: widget.config.searchViewConfig.buttonColor,
                  icon: Icon(
                    Icons.arrow_back,
                    color: widget.config.searchViewConfig.buttonIconColor,
                  ),
                ),
                Expanded(
                  child: TextField(
                    onChanged: onTextInputChanged,
                    focusNode: focusNode,
                    style: widget.config.searchViewConfig.hintStyle,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.config.searchViewConfig.hintText,
                      hintStyle: widget.config.searchViewConfig.hintStyle?.copyWith(
                        color: widget.config.searchViewConfig.hintStyle?.color?.withOpacity(0.7)
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

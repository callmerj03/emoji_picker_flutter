import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

/// Callback function for custom search view
typedef SearchViewBuilder = Widget Function(
  Config config,
  EmojiViewState state,
  VoidCallback showEmojiView,
);

/// Search view Config
class SearchViewConfig {
  /// Constructor
  const SearchViewConfig({
    this.backgroundColor = const Color(0xFFEBEFF2),
    this.buttonColor = Colors.transparent,
    this.buttonIconColor = Colors.black26,
    this.hintText = 'Search',
    this.customSearchView,
    this.hintStyle,
    this.emojiListBgColor,
  });
  // hint textStyle
  final TextStyle? hintStyle;

  // emoji list background
  final Color? emojiListBgColor;

  /// Background color of search bar
  final Color backgroundColor;

  /// Fill color of hide search view button
  final Color buttonColor;

  /// Icon color of hide search view button
  final Color buttonIconColor;

  /// Custom hint text
  final String? hintText;

  /// Custom search bar
  /// Hot reload is not supported
  final SearchViewBuilder? customSearchView;

  @override
  bool operator ==(other) {
    return (other is SearchViewConfig) &&
        other.backgroundColor == backgroundColor &&
        other.buttonColor == buttonColor &&
        other.buttonIconColor == buttonIconColor &&
        other.hintText == hintText &&
        other.emojiListBgColor == emojiListBgColor &&
        other.hintStyle == hintStyle;
  }

  @override
  int get hashCode =>
      backgroundColor.hashCode ^
      buttonColor.hashCode ^
      buttonIconColor.hashCode ^
      hintStyle.hashCode ^
      emojiListBgColor.hashCode ^
      hintText.hashCode;
}

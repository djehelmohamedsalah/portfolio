
  import 'package:flutter/material.dart';

/// Parses text with **bold** markers into a list of TextSpans
  List<TextSpan> buildTextSpans(String text, TextStyle? boldStyle) {
    final List<TextSpan> spans = [];
    final RegExp regExp = RegExp(r'\*\*(.*?)\*\*');
    int lastMatchEnd = 0;

    for (final Match match in regExp.allMatches(text)) {
      // Add text before the match
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(text: text.substring(lastMatchEnd, match.start)));
      }
      // Add the bolded text (match group 1)
      spans.add(TextSpan(text: match.group(1), style: boldStyle));
      lastMatchEnd = match.end;
    }

    // Add remaining text after the last match
    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastMatchEnd)));
    }

    return spans;
  }



import 'package:flutter/material.dart';

bool textIsOverflow(int maxLines, List<InlineSpan> children, double width) {
  TextPainter textPainter = TextPainter(
    maxLines: maxLines,
    text: TextSpan(children: children),
    textDirection: TextDirection.ltr
  )..layout(maxWidth: width);
  return textPainter.didExceedMaxLines;
}

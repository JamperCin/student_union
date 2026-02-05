import 'package:student_union/core/enums/segment_type.dart';

class TextSegment {
  final String text;
  final SegmentType type;
  TextSegment(this.text, this.type);
}


List<TextSegment> parseDescription(String text) {
  final List<TextSegment> segments = [];
  int lastIndex = 0;

  final phoneRegex = RegExp(r'(\+233\s?\d{3}\s?\d{3}\s?\d{3})');
  final urlRegex = RegExp(r'(https?://\S+)');

  final allMatches = [
    ...phoneRegex.allMatches(text),
    ...urlRegex.allMatches(text)
  ]..sort((a, b) => a.start.compareTo(b.start));

  for (final match in allMatches) {
    if (lastIndex < match.start) {
      segments.add(TextSegment(text.substring(lastIndex, match.start), SegmentType.text));
    }

    final matchText = match.group(0) ?? '';
    final type = matchText.startsWith('http') ? SegmentType.url : SegmentType.phone;
    segments.add(TextSegment(matchText, type));
    
    lastIndex = match.end;
  }

  if (lastIndex < text.length) {
    segments.add(TextSegment(text.substring(lastIndex), SegmentType.text));
  }
  return segments;
}

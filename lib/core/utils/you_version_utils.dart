import 'package:core_module/core/def/global_def.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/enums/bible_version.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core-ui/screen/base_web.dart';
import '../model/local/web_model.dart';

class YouVersionUtils {
  /// Map of book names & abbreviations → YouVersion abbreviations
  final Map<String, String> bibleBookMap = {
    // Old Testament
    'Genesis': 'GEN', 'Gen': 'GEN',
    'Exodus': 'EXO', 'Exo': 'EXO',
    'Leviticus': 'LEV', 'Lev': 'LEV',
    'Numbers': 'NUM', 'Num': 'NUM',
    'Deuteronomy': 'DEU', 'Deut': 'DEU',
    'Joshua': 'JOS', 'Josh': 'JOS',
    'Judges': 'JDG', 'Judg': 'JDG',
    'Ruth': 'RUT', 'RUTH': 'RUT',
    '1 Samuel': '1SA', '1Sam': '1SA',
    '2 Samuel': '2SA', '2Sam': '2SA',
    '1 Kings': '1KI', '1Kgs': '1KI',
    '2 Kings': '2KI', '2Kgs': '2KI',
    '1 Chronicles': '1CH', '1Chr': '1CH',
    '2 Chronicles': '2CH', '2Chr': '2CH',
    'Ezra': 'EZR',
    'Nehemiah': 'NEH', 'Neh': 'NEH',
    'Esther': 'EST',
    'Job': 'JOB',
    'Psalms': 'PSA', 'Psalm': 'PSA', 'Ps': 'PSA',
    'Proverbs': 'PRO', 'Prov': 'PRO',
    'Ecclesiastes': 'ECC', 'Eccl': 'ECC',
    'Song of Solomon': 'SNG', 'Song': 'SNG',
    'Isaiah': 'ISA',
    'Jeremiah': 'JER',
    'Lamentations': 'LAM',
    'Ezekiel': 'EZK',
    'Daniel': 'DAN',
    'Hosea': 'HOS',
    'Joel': 'JOL',
    'Amos': 'AMO',
    'Obadiah': 'OBA', 'Obad': 'OBA',
    'Jonah': 'JON',
    'Micah': 'MIC',
    'Nahum': 'NAM',
    'Habakkuk': 'HAB',
    'Zephaniah': 'ZEP',
    'Haggai': 'HAG',
    'Zechariah': 'ZEC',
    'Malachi': 'MAL',

    // New Testament
    'Matthew': 'MAT', 'Matt': 'MAT',
    'Mark': 'MRK',
    'Luke': 'LUK',
    'John': 'JHN',
    'Acts': 'ACT',
    'Romans': 'ROM',
    '1 Corinthians': '1CO', '1Cor': '1CO',
    '2 Corinthians': '2CO', '2Cor': '2CO',
    'Galatians': 'GAL',
    'Ephesians': 'EPH',
    'Philippians': 'PHP',
    'Colossians': 'COL',
    '1 Thessalonians': '1TH',
    '2 Thessalonians': '2TH',
    '1 Timothy': '1TI',
    '2 Timothy': '2TI',
    'Titus': 'TIT',
    'Philemon': 'PHM',
    'Hebrews': 'HEB',
    'James': 'JAS',
    '1 Peter': '1PE',
    '2 Peter': '2PE',
    '1 John': '1JN',
    '2 John': '2JN',
    '3 John': '3JN',
    'Jude': 'JUD',
    'Revelation': 'REV',
  };

  /// Convert a Bible reference to YouVersion URL (supports ranges)
  String _bibleReferenceToUrl(String reference) {
    if (reference.isEmpty) {
      return '';
    }
    // Match: book name, chapter, starting verse, optional ending verse
    final regex = RegExp(r'^([\d ]?[A-Za-z ]+)\s+(\d+)(?::(\d+)(?:-(\d+))?)?$');

    final match = regex.firstMatch(reference.trim());
    if (match == null) {
      throw ArgumentError('Invalid reference format: $reference');
    }

    final book = match.group(1)!.trim();
    final chapter = match.group(2);
    final startVerse = match.group(3);
    final endVerse = match.group(4);

    final abbr = _getBookAbbreviation(book);
    if (abbr == null) {
      throw ArgumentError('Unknown book: $book');
    }

    String ref;
    if (startVerse != null) {
      // If we have a range
      if (endVerse != null) {
        ref = '$abbr.$chapter.$startVerse-$endVerse';
      } else {
        ref = '$abbr.$chapter.$startVerse';
      }
    } else {
      // Chapter only
      ref = '$abbr.$chapter';
    }

    return ref;
  }

  String? _getBookAbbreviation(String inputBook) {
    // Normalize spaces & case
    final cleanBook = inputBook.trim().toLowerCase();

    // Try exact match ignoring case
    for (final entry in bibleBookMap.entries) {
      if (entry.key.toLowerCase() == cleanBook) {
        return entry.value;
      }
    }

    // Try fuzzy match (startsWith or contains)
    for (final entry in bibleBookMap.entries) {
      if (entry.key.toLowerCase().startsWith(cleanBook) ||
          cleanBook.startsWith(entry.key.toLowerCase())) {
        return entry.value;
      }
    }

    // Could add Levenshtein distance check here if needed
    return null;
  }

  Future<void> openBibleReference({
    String? ref,
    BibleVersion version = BibleVersion.KJV, // Default to KJV
  }) async {
    try {
      String reference = _bibleReferenceToUrl(ref ?? 'GENESIS 1');
      final versionId = version.webVersionId;
      // Bible Mobile app Uri
      final mobileUri = Uri.parse(
        'youversion://bible/$versionId?reference=${Uri.encodeComponent(reference)}',
      );

      final webUri = Uri.parse(
        'https://www.bible.com/bible/$versionId/$reference',
      );

      debugPrint('Launching YouVersion URI Mobile: $mobileUri \nWeb: $webUri');

      if (await canLaunchUrl(mobileUri)) {
        await launchUrl(mobileUri);
      } else {
        navUtils.fireTarget(
          BaseWebView(
            model: WebModel(title: "Read Bible ($version)", uri: webUri),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error opening Bible reference: $e');
    }
  }
}

enum BibleVersion { KJV, NKJV, NIV, ESV, ERV, NLT }

extension BibleVersionExtension on BibleVersion {
  String get abbreviation {
    switch (this) {
      case BibleVersion.KJV:
        return 'KJV';
      case BibleVersion.NKJV:
        return 'NKJV';
      case BibleVersion.NIV:
        return 'NIV';
      case BibleVersion.ESV:
        return 'ESV';
      case BibleVersion.ERV:
        return 'ERV';
      case BibleVersion.NLT:
        return 'NLT';
    }
  }

  //Get the Web fallback with specified version
  String get webVersionId {
    switch (this) {
      case BibleVersion.KJV:
        return '1';
      case BibleVersion.NKJV:
        return '114';
      case BibleVersion.NIV:
        return '111';
      case BibleVersion.ESV:
        return '59';
      case BibleVersion.ERV:
        return '42';
      case BibleVersion.NLT:
        return '116';
    }
  }
}

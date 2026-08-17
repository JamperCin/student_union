class StoreConfig {
  /// Toggle this at build time:
  /// `--dart-define=RC_USE_TEST_STORE=true|false`
  static const bool useTestStore = bool.fromEnvironment(
    'RC_USE_TEST_STORE',
    defaultValue: false,
  );

  static String get activeStoreLabel => useTestStore ? 'test' : 'live';

  // Legacy single key support, kept for backward compatibility.
  static const String _rcPublicKeyLegacy = String.fromEnvironment(
    'RC_PUBLIC_API_KEY',
    defaultValue: '',
  );

  // RevenueCat Public SDK keys
  static const String _rcPublicKeyTest = String.fromEnvironment(
    'RC_PUBLIC_API_KEY_TEST',
    defaultValue: 'test_oxJGeZjwJxUhXOeavxQOylRYEVS',
  );

  static const String _rcPublicKeyLive = String.fromEnvironment(
    'RC_PUBLIC_API_KEY_LIVE',
    defaultValue: 'appl_hUGYvpJJGtFikhPvBCNFmfKUzkH',
  );

  static String get rcPublicApiKey {
    if (_rcPublicKeyLegacy.isNotEmpty) {
      return _rcPublicKeyLegacy;
    }
    return useTestStore ? _rcPublicKeyTest : _rcPublicKeyLive;
  }

  // Product prefixes
  static const String _productPrefixLegacy = String.fromEnvironment(
    'RC_PRODUCT_PREFIX',
    defaultValue: '',
  );

  static const String _productPrefixTest = String.fromEnvironment(
    'RC_PRODUCT_PREFIX_TEST',
    defaultValue: 'com.kodeit.scriptureunion.devotional_',
  );

  static const String _productPrefixLive = String.fromEnvironment(
    'RC_PRODUCT_PREFIX_LIVE',
    defaultValue: 'com.kodeit.scriptureunion.devotional_',
  );

  static String get productPrefix {
    if (_productPrefixLegacy.isNotEmpty) {
      return _productPrefixLegacy;
    }
    return useTestStore ? _productPrefixTest : _productPrefixLive;
  }

  // Offerings
  static const String _devotionalOfferingIdLegacy = String.fromEnvironment(
    'RC_DEVOTIONAL_OFFERING_ID',
    defaultValue: '',
  );

  static const String _devotionalOfferingIdTest = String.fromEnvironment(
    'RC_DEVOTIONAL_OFFERING_ID_TEST',
    defaultValue: 'main_devotional_catalog',
  );

  static const String _devotionalOfferingIdLive = String.fromEnvironment(
    'RC_DEVOTIONAL_OFFERING_ID_LIVE',
    defaultValue: 'main_devotional_catalog',
  );

  static String get devotionalOfferingId {
    if (_devotionalOfferingIdLegacy.isNotEmpty) {
      return _devotionalOfferingIdLegacy;
    }
    return useTestStore ? _devotionalOfferingIdTest : _devotionalOfferingIdLive;
  }

  // Product IDs (Daily Guide)
  static const String _dailyGuideProductIdLegacy = String.fromEnvironment(
    'RC_DAILY_GUIDE_PRODUCT_ID',
    defaultValue: '',
  );

  static const String _dailyGuideProductIdTest = String.fromEnvironment(
    'RC_DAILY_GUIDE_PRODUCT_ID_TEST',
    defaultValue: 'com.kodeit.scriptureunion.devotional_daily_guide_1',
  );

  static const String _dailyGuideProductIdLive = String.fromEnvironment(
    'RC_DAILY_GUIDE_PRODUCT_ID_LIVE',
    defaultValue: 'com.kodeit.scriptureunion.devotional_1',
  );

  static String get dailyGuideProductId {
    if (_dailyGuideProductIdLegacy.isNotEmpty) {
      return _dailyGuideProductIdLegacy;
    }
    return useTestStore ? _dailyGuideProductIdTest : _dailyGuideProductIdLive;
  }

  // Product IDs (Daily Power)
  static const String _dailyPowerProductIdLegacy = String.fromEnvironment(
    'RC_DAILY_POWER_PRODUCT_ID',
    defaultValue: '',
  );

  static const String _dailyPowerProductIdTest = String.fromEnvironment(
    'RC_DAILY_POWER_PRODUCT_ID_TEST',
    defaultValue: 'com.kodeit.scriptureunion.devotional_daily_power_5',
  );

  static const String _dailyPowerProductIdLive = String.fromEnvironment(
    'RC_DAILY_POWER_PRODUCT_ID_LIVE',
    defaultValue: 'com.kodeit.scriptureunion.devotional_5',
  );

  static String get dailyPowerProductId {
    if (_dailyPowerProductIdLegacy.isNotEmpty) {
      return _dailyPowerProductIdLegacy;
    }
    return useTestStore ? _dailyPowerProductIdTest : _dailyPowerProductIdLive;
  }

  static const int dailyGuideBookId = int.fromEnvironment(
    'RC_DAILY_GUIDE_BOOK_ID',
    defaultValue: 1,
  );

  static const int dailyPowerBookId = int.fromEnvironment(
    'RC_DAILY_POWER_BOOK_ID',
    defaultValue: 5,
  );

  static const String dailyGuideEntitlement = String.fromEnvironment(
    'RC_DAILY_GUIDE_ENTITLEMENT',
    defaultValue: 'daily_guide_access',
  );

  static const String dailyPowerEntitlement = String.fromEnvironment(
    'RC_DAILY_POWER_ENTITLEMENT',
    defaultValue: 'daily_power_access',
  );

  static const String dailyGuidePackage = String.fromEnvironment(
    'RC_DAILY_GUIDE_PACKAGE',
    defaultValue: 'daily_guide',
  );

  static const String dailyPowerPackage = String.fromEnvironment(
    'RC_DAILY_POWER_PACKAGE',
    defaultValue: 'daily_power',
  );
}

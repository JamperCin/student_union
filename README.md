# student_union

A new Flutter project for Scripture Union

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Setting up Github Actions to build release apk/app bundle 
Follow the steps below to build Android apk/app bundle

 - Generate a base64 txt file out of your signing key ```.jks``` file using the example command below:
 ```base64 -i su-keystore.jks -o su-keystore.jks.base64```

 - Now run below command to open the base64 file so you can copy the entire base64 string content:
 - `cat su-keystore.jks.base64` 
 - ⚠️ DO NOT copy with spaces or line breaks

### Paste the Base64 string into GitHub Secrets
      Go to:
      GitHub → Repo → Settings → Secrets → Actions
      Add these secrets:

      Name	Value
      ANDROID_KEYSTORE_BASE64	paste the base64 string
      ANDROID_KEYSTORE_PASSWORD	your keystore password
      ANDROID_KEY_PASSWORD	your key alias password
      ANDROID_KEY_ALIAS	your alias name
      ⚠️ Ensure no newline at the end.

## Setting up for IOS 
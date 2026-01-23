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


# Setting Up Github Actions to auto deploy releases

Below are steps to folow when you want to set up fastlane with Github to auto deploy release.

## Setting Up Android 
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

### Setting up Google Service Account and Generating GoogleJson Key
Follow the link [here](https://docs.fastlane.tools/getting-started/android/setup/) to do the following
- Create a project in your google cloud console
- Enable the Google Play Developer API for that project
- Create a service Account on that project
- Add a key on that service account
- Download the google json key to local machine and copy the auto generated email address

### Setting up on Google Play Console with email address generated from above
- Open the Google Play Console and select Users and Permissions
- Click Invite new users
- Paste the email address you saved for later use into the email address field
- Click on Account Permissions
- Choose the permissions you'd like this account to have. We recommend Admin (all permissions), but you may want to manually select all checkboxes and leave out some of the Releases permissions such as Release to production, exclude devices, and use Play App Signing
- Click on Invite User

### Configure fastlane in Android folder 
- Navigate to Android folder in your project and open a terminal
-  Run ```fastlane init``` in your project folder. This creates a ```./fastlane``` directory with an Appfile (app configuration) and a Fastfile (automation scripts/lanes)
- Make sure to choose ```Manual``` option when setting up fastlane
- Once completed, you should have a folder called fastlane in your Android folder

### Define Lanes in Fastfile
- Open the file name ```fastfile``` and lets edit with below code


```ruby
def increment_version_name(version)
  # Extract version from format '20 (1.2.0)' using regex
  # This looks for digits separated by dots inside parentheses
  match = version.match(/\(([\d.]+)\)/)
  
  # Use the extracted part, or the original if no parentheses found
  version_to_parse = match ? match[1] : version

  # Split into integers
  major, minor, patch = version_to_parse.split(".").map(&:to_i)

  # Logic for 2026: typical semantic versioning increments
  if patch < 9
    patch += 1
  else
    patch = 0
    if minor < 9
      minor += 1
    else
      minor = 0
      major += 1
    end
  end

  "#{major}.#{minor}.#{patch}"
end

#-----------------------------------------------------------------------------------------
# End of helper methods for versioning pubspec.yaml
#-----------------------------------------------------------------------------------------`

#-----------------------------------------------------------------------------------------
# Android lane for internal release
#-----------------------------------------------------------------------------------------

default_platform(:android)

platform :android do
  desc "Build and upload a new Android version to the internal track"
  lane :internal_release do
    credentials = ENV['GPLAY_JSON_DATA'] #--> The Google Json Key saved to Github Secret
    
     # 1. Safely fetch Version Names
    names = []
    begin
      names = google_play_track_release_names(
        track: 'alpha',
        json_key_data: credentials
      )
    rescue => e
      puts "Notice: Could not fetch release names (Track might be empty): #{e}"
    end
    play_store_version_name = names.first || "1.0.0"
    
    # 2. Safely fetch Version Codes (Fix for the 'flat_map' error)
    codes = []
    begin
      codes = google_play_track_version_codes(
        track: 'alpha',
        json_key_data: credentials
      )
    rescue => e
      # This catches the nil:NilClass error when the track is empty
      puts "Notice: Track 'alpha' is empty. Starting from version code 1."
      codes = [0] 
    end
    
    # Ensure codes is an array even if the action returns nil unexpectedly
    new_version_code = ((codes || [0]).max || 0) + 1

    # 3. Increment the Version Name
    new_version_name = increment_version_name(play_store_version_name)

    puts("Current Version: #{play_store_version_name}")

    puts("New Version Name: #{new_version_name}")
    puts("New Version Code: #{new_version_code}")

    # 4. Build the App
    gradle(
      task: 'clean bundle',
      build_type: 'Release',
      gradle_path: './gradlew', # Explicitly point to the local wrapper
      properties: {
        "android.injected.version.name" => new_version_name,
        "android.injected.version.code" => new_version_code
      }
    )

    # 5. Upload to Play Store
    # Removed package_name here (pulled from Appfile)
    upload_to_play_store(
      track: "alpha",
      aab: "../build/app/outputs/bundle/release/app-release.aab", # Verified path for Flutter
      release_status: "completed",
      json_key_data: credentials
    )
  end
end
```

### Setting GitHub Actions for Android


## Setting up for IOS 
- Navigate into the ios folder and open terminal
- Run the following command ```fastlane init```
- Choose manual setup and will be asked to press Enter till it completes minimal setUp
- Open AppFile in the fastlane folder and paste below code. Make sure you replace them with correct data

```ruby
app_identifier("com.your.bundle.id") # Your iOS Bundle ID
apple_id("your-apple-id@email.com")   # Your Apple ID
itc_team_id("12345678")               # Your App Store Connect Team ID
team_id("ABCDEFGH12")                 # Your Apple Developer Portal Team ID
```

- For you to obtain your ```itc_team_id``` you need to make sure at least you've already logged into your appstore connect acccount on your browser. [AppStore Connect](https://appstoreconnect.apple.com/)

- Now Visit this link [here](https://appstoreconnect.apple.com/WebObjects/iTunesConnect.woa/ra/user/detail) to obtain your ```itc_team_id```

- It should load a json content, then search for ```contentProviderId```. Copy the value and that is your ```itc_team_id```

- Update your Fastfile: Open ```ios/fastlane/Fastfile``` and set up your release lane using the API Key method (to avoid the 2FA prompt):
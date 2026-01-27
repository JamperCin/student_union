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

### Setup Github Actions so we can use them in our workflows
To keep your credentials secure, do not put them in your code. Go to your ```GitHub Repository > Settings > Secrets and variables > Actions```
and add the following New repository secrets:

```ruby
APP_STORE_CONNECT_KEY_ID: Your Key ID from App Store Connect. Copy this and save
APP_STORE_CONNECT_ISSUER_ID: Your Issuer ID from App store
APP_STORE_CONNECT_KEY_CONTENT: The text content of your .p8 API key file in the form of base64 content
MATCH_PASSWORD: The password you used to encrypt your certificates. The MATCH_PASSWORD is not something you "obtain" from Apple or GitLab; it is a passphrase that you create yourself to encrypt and decrypt your code-signing certificates.
```
In cases where you are mirroring from Gitlab to Github, you can make use of Gitlab secure files storage. You can setup another secret

```ruby
GITLAB_PRIVATE_TOKEN: A GitLab Project Access Token (with api scope) so the GitHub runner can download your certificates from GitLab Secure Files.
Use Fastlane Match with GitLab Secure Files to store your certificates for free without needing a separate private repository
```

To generate the base64 content of the app store connect api key do the following:

1. Encode your .p8 key to Base64 
Do not paste the raw text of your .p8 file directly into GitHub Secrets. Instead, convert it to a single-line Base64 string locally first:
bash
#### Run this on your local terminal
cat AuthKey_XXXXXXXXXX.p8 | base64 | pbcopy

Paste this resulting single-line string into your GitHub Repository Secret `APP_STORE_CONNECT_KEY_CONTENT`

Update the app_store_connect_api_key action to tell fastlane that the content is Base64 encoded. example below:
```ruby
app_store_connect_api_key(
  key_id: ENV["APP_STORE_CONNECT_KEY_ID"],
  issuer_id: ENV["APP_STORE_CONNECT_ISSUER_ID"],
  key_content: ENV["APP_STORE_CONNECT_KEY_CONTENT"],
  is_key_content_base64: true, # This is the critical fix
  in_house: false
)
```


### When Using Gitlab and mirroring to Github repository
#### Configure Fastlane for Code Signing 
Use ```Fastlane Match``` with ```GitLab Secure Files``` to store your certificates for free without needing a separate private repository. 

1. Initialize: Run ```bundle exec fastlane match init``` in your /ios folder and select ```gitlab_secure_files```.
2. Auth: Create a ```GitLab Project Access Token``` with ```api``` scope. 
3. Export it locally: ```export PRIVATE_TOKEN=your_token```.
4. Sync: Run ```bundle exec fastlane match development``` to generate and upload certificates to GitLab Secure Files.

## When using Github alone
#### Configure Fastlane for code signing
Use ```Fastlane Match``` and a new private GitHub repository to store your certificates. In cases where you want to use an existing repo which already stores your certifcates and provisioning profiles, you just have to use that and create a new branch to store this one. So same repo but different branches for seperate projects. 

1. Initialize: Run ```bundle exec fastlane match init``` in your /ios folder and select ```git```.
2. Enter ```URL```: Provide the ```SSH URL``` of your dedicated private GitHub certificate repository. 
3. Open ios/fastlane/Matchfile and specify the unique branch for the current team. This is when you are using one repo that stores all your certificates for different projects. In that case you specify which branch is responsibe for your current project.
- An example is ```git_branch("prime-customer-certs") ```
4. Uncomment the following or make sure you add the following 
   ```ruby
    app_identifier(["com.team-b.app"])
    username("apple-id-for-team-b@email.com")
   ```

##  Link to GitHub Actions (Secrets)
Since the ```GitHub runner``` needs to authenticate with your certificate repo, you must provide it with authorization. 

1. Generate a `Personal Access Token (PAT)`: Create a GitHub PAT with repo scope.

2. Add Secrets to Project Repo: On your main GitHub project, add the PAT and save it as : `MATCH_GIT_BASIC_AUTHORIZATION`: 

3. `MATCH_PASSWORD`: The passphrase you used to encrypt the certificates, if you already have it created, ignore. This one you create your own passphrase. 

### How to generate the PAT
To generate a `Personal Access Token (PAT)` in 2026, follow these steps on GitHub. This token acts as a password that allows Fastlane and GitHub Actions to access your private certificate repository.

1. Navigate to `Developer Settings`
- Log in to your GitHub account.
- Click your Profile Photo in the top-right corner.
- Select Settings.
- On the left-hand sidebar, scroll all the way to the bottom and click <> `Developer settings`.

2. Generate the `Token`
- In the left sidebar, click Personal access tokens.
- Select Tokens (classic). 
Note: While "Fine-grained tokens" are newer, most Fastlane setups still prefer "Classic" for broader compatibility with git commands. GitHub Documentation
- Click the Generate new token dropdown and select Generate new token (classic).

3. Configure the `Scopes`
- Note: Give it a name you'll remember, like Fastlane-Match-Token.
- Expiration: Choose an expiration date (e.g., 90 days or "No expiration" if you are the only one with access, though 90 days is safer).
- Select Scopes: Check the box for repo (Full control of private repositories). This is the only scope Fastlane needs to read and write your certificates.

4. Save the `Token`
- Click Generate token at the bottom of the page.
- CRITICAL: Copy the token (it starts with ghp_...).
Warning: You will never see this token again. If you leave the page without copying it, you will have to delete it and create a new one.

5. How to use it for Fastlane
- As mentioned in previous steps, you will use this token in two places:
Locally (on your 2017 Mac): Use it when match prompts you for your GitHub password.
- On GitHub (Secrets):
- Go to your Main Project Repo > Settings > Secrets and variables > Actions.
- Add a new secret named MATCH_GIT_BASIC_AUTHORIZATION as said above and paste the PAT.


## Generate the provisioning profiles and store them to repo

To generate the certificates from Apple and upload them to your new ```GitHub certificate repository```, 

1. Run the Command Locally
Open the Terminal on your Mac, navigate to your /ios folder, and run:
bash

```bundle exec fastlane match appstore```

2. Follow the prompt and enter the PASSPHRASE for Match storage. In this case enter the ```MATCH_PASSWORD``` and hit enter.

3. Now you may be prompted to enter the password for your apple Id. Enter it and hit enter

4. You may be prompted to enter a 6-digit code generated on your apple device. enter it and hit enter and fter that, the profiles will be downloaded and stored at the private repo in the said branch specified in your ```matchfile```.
 
## Setting up Github actions and workflows
Set up Github action and create a new workflow by choosing `dart` option.
- After that add your workflows like below :






    
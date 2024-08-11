# Email/Password Auth Steps

## 1. Create flutter project in VSCode named passwordtest 

## 2. Add project to source control
    * Go into the passwordtest in the terminal and enter: “git init” to initialize an empty git repo

    * In terminal: “git add .” To stage all of the files

    * In terminal: “git commit” to do the initial commit
        * Message “initial commit”

    * Create empty Repo in Github named passwordtest
        * https://github.com/ilanning51/passwordtest

    *  Link the local repo to the cloud repo
        * git remote add origin https://github.com/ilanning51/passwordtest.git
        * git push -u origin main

## 3. Create a new project in Firebase named passwordtest
    * https://console.firebase.google.com/project/_/authentication/provider

    * Click on Authentication and Get Started

    * Select Email/Password provider
        * Enable and Save
    
## 4. Configure App
    * Follow the steps to add firebase to your flutter app
        * https://firebase.google.com/docs/flutter/setup?platform=ios

        * skip step 1

        * step 2: flutterfire configure
            * select all platforms
            * name it com.passwordtest.app
        
        * step 3: initialize firebase
            * from flutter app directory: flutter pub add firebase_core firebase_ui_auth
            * flutterfire configure
                * yes to reuse files
    * Change application deployment target to 13.0
        * 

## 5. Follow firebase_ui_auth documentation to add Email/Password UI
    * https://github.com/firebase/FirebaseUI-Flutter/blob/main/docs/firebase-ui-auth/providers/email.md
    * copy and paste the "configure email provider" portion and the "Using Screen" portion




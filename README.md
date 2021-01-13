** Reupload from private gitlab repo **
# Summarized For U (SFU)

The official Summarized For U application

## Steps to run the app

1. Follow the instructions for installing Flutter, Android Studio, and a simulator here: https://flutter.dev/docs/get-started/install

2. Clone the `sfu-server` repo

3. Clone the `sfu-flutter` repo

4. `cd` into the `sfu-server` directory

5. Install the Python dependencies:
    ```shell
    pip3 install -r requirements.txt
    ```

6. Install the node dependencies:
    ```shell
    npm install
    ```
7. Start the server:
    ```shell
    node index.js
    ```
8. Open the `sfu-flutter` directory in Android Studio

9. Select your mobile phone simulator of choice and click run

10. In the mobile app, select the topic that concerns you the most in the Terms of Service (eg. privacy, liability, security, copyright) from the keyword dropdown menu

11. Copy our example Terms and Conditions text from `parsedappleTAC.txt` from the `sfu-server` repo and paste it into the text input area "Enter your TOS" in the mobile app

12. Click send and wait for the summary to return!

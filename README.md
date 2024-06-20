#### Updates in new version
- Added new date format method in Sdk Configuration. For more details please check the step `SDK Properties`


# Steps of using iPASS iOS Package

To explain how a user can use the iPASS Package in steps, you can outline the process as follows:

## Steps to use iPASS iOS Package

### Integrate Package into the App

First, we need to add the package to the application using the git link: [https://github.com/yazanalqasem/iPass2.0NativeiOS](https://github.com/yazanalqasem/iPass2.0NativeiOS)

Steps to add the package:
1. Go to `Files > Add Package Dependencies`
2. Paste the Package URL
3. Click on "Add Package" to include the package in your project.

### Import Package

Import the package in your required view controller.

```ruby
import iPass2_0NativeiOS
```
### Configure Permissions in Info.plist

In this step user will give required permissions in the Info.plist file to enable the necessary device features:

- Privacy - Camera Usage Description — Description for camera access.
- Privacy - Photo Library Usage Description - Description for photo library access.
- Privacy - Bluetooth Always Usage Description - Description for Bluetooth access.
- Privacy - Speech Recognition Usage Description - Description for speech recognition.
- Privacy - Privacy - NFC Scan Usage Description - Description for NFC usage.
- ISO7816 application identifiers for NFC Tag Reader Session - For NFC features.

Add following items to above array item
- A0000002471001
- E80704007F00070302
- A000000167455349474E
- A0000002480100
- A0000002480200
- A0000002480300
- A00000045645444C2D3031
- com.apple.developer.nfc.readersession.formats. - NFC reading formats

Add following items to above array item
- NDEF
- TAG

### Add NFC Compatibility
- Near Field Communication Tag Reading

### Initialize Database
- To start the process user need to download the database using following code.
- In this step progress object can be used to track the downloading percentage.
- Once the database is downloaded 100% and status is Start Now, user can start the next step.
```ruby
 DataBaseDownloading.initialization(completion:{progres, status, error in
                    print(progres, status, error)
                })
```
### Get User Login Token
- Pass valid email id and password to get user token
```ruby
iPassSDKManger.UserOnboardingProcess(email: emailStr, password: passwordStr) { status, tokenString in
    if(status == true) {
        self.userToken = tokenString!
    }
}
```
- Once the user is logged in user token need to save because this will be used in document scanning process
  
### Get Supported Flows
```ruby
    var getList = [[String: Any]]()
    getList = iPassSDKManger.getWorkFlows()
```
- In the getList object you will get the array of dictionary with all the flows
- Get the flowId from the list of supported flows which will be required for scanning process
- Sdk Supported Flows
  - Full Processing(10031)
  - Id verification + Liveness + AML(10032)
  - Id verification + AML(10015)
  - Id verification + Liveness(10011)
- In Full Process(10031), Social media email and phone number is required

### Document Scanning

- User can scan various types of documents.
- Users can scan both the front and back sides of documents, but it totally depends on the document type.

 ```ruby
iPassSDKManger.delegate = self
iPassSDKManger.startScanningProcess(userEmail: "sam@gmail.com", flowId: 10031, socialMediaEmail :"samfb@gmail.com", phoneNumber : "978xxxxxx", controller: self, userToken: self.userToken, appToken: self.appToken)
```
- usertoken will be the login token
- appToken will be the auth token provided by Admin
- flowId will be the id selected by the user from above step.
- After the scanning process, Response will be available in package delegate.

### Add Delegate to Get Response
 ```ruby
   extension ViewController : iPassSDKManagerDelegate {
        func getScanCompletionResult(result: String, transactionId: String, error: String) {
            print(result)
            print(transactionId)
            print(error)
        }
    }
```
- "result" object will return the required json response
- "transactionId" object will return the unique transcation number for completed transaction
- "error" object will return the error description

### SDK Properties
 ```ruby
configProperties.setLoaderColor(color: UIColor.red)
configProperties.needHologramDetection(value: true)
configProperties.needHologramDetection(value: true)
configProperties.setDateFormat(format: "dd/mm/yyyy")
```
- "setLoaderColor" property is used to change the color of the loader.
- "needHologramDetection" property is used for Authenticity checks like detection of Electronic Device, Optically Variable Ink, Multiple Laser Images, Image Patterns.
- By default hologram detection is enabled. you can disabled passing the false in hologram detection property.
- "setDateFormat" property is used to change the format of dates displayed in the results. The mask examples are "dd/mm/yyyy", "mm/dd/yyyy", "dd-mm-yyyy", "mm-dd-yyyy", "dd/mm/yy".

### Add Multiple Languages (Optional)
Applications supports following langauges
- Arabic
- English
- French
- German
- Kurdish
- Spanish
- Turkish
- Urdu

You need to add the multi languages files from the xcode for requried languages and you can copy the language keys from the following link

 <a href="https://devdocs.ipass-mena.com/ipass-sdkLanguages.html">
   Language Files
  </a>


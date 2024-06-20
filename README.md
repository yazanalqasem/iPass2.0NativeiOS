                        <h1>Steps of using iPASS iOS Package</h1>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>ipass</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
          <link rel="icon" type="image/x-icon" href="https://app.ipass-mena.com/Static/logo.png">
    <!-- FONT-FAMILY -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap"
        rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
        <link rel="stylesheet" type="text/css" href="assets/css/fonts.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>
 
<body>


    <header>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="header-flex-wrapper">
                        <div class="header-logo">
                            <img src="assets/img/logo.png" alt="iPass">
                        </div>
                        <a href="https://ipass-mena.com/" class="returnbtn">Return to Home</a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <section class="hero-section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="page-heading">
                        <h1>iOS SDK Documentation</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="all-data">
        <div class="container"> 
             <ul class="nav nav-tabs" id="myTab" role="tablist">
            
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="true" >iOS SDK Documentation</button>
                </li>
                <li class="nav-item" role="presentation">
                    <a href="sdkDocumentation.html"><button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false" tabindex="-1">Android SDK Documentation</button></a>
                </li>
                    <li class="nav-item" role="presentation">
                     <a href="https://plusapi.ipass-mena.com/api-docs/"> <button class="nav-link" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="false" tabindex="-1">WEB API Documentation</button></a>
                </li>
              </ul>

            <div class="row">  
                <div class="col-12">
                    <div class="content-blk">
                        <h1>Steps of using iPASS iOS Package</h1>
                        <p>To explain how a user can use the iPASS Package in steps, you can outline the process as follows:</p>
                        <h2>Steps to use iPASS iOS Package</h2>                        
                        <div class="card mt-3">
                            <div class="card-body pt-20">
                                <h3 class="heading">Integrate Package into the App</h3>
                                <ul>
                                    <li>First we need to add package to application using git link => 'https://github.com/yazanalqasem/iPass2.0NativeiOS'</li>
                                    <li>Steps to add package: Go to files > Add Package Dependencies > Past the Package URL </li>
                                    <li>Click on Add Package to include package in your project.</li>
                                </ul>                             

                                <h3 class="heading mt-30">Import Package</h3>
                                <p>Import Package in your requried view controller.</p>
<pre>import iPass2_0NativeiOS</pre>
                               
                                <h3 class="heading mt-30">Configure Permissions in Info.plist</h3>
                                <p>In this step user will give required permissions in the Info.plist file to
                                    enable the necessary device features:</p>
                                <ul>
                                    <li>Privacy - Camera Usage Description — Description for camera access.</li>
                                    <li>Privacy - Photo Library Usage Description - Description for photo library access.</li>
                                    <li>Privacy - Bluetooth Always Usage Description - Description for Bluetooth access.</li>
                                    <li>Privacy - Speech Recognition Usage Description - Description for speech recognition.</li>
                                    <li>Privacy - Privacy - NFC Scan Usage Description - Description for NFC usage.</li>
                                    <li><p>ISO7816 application identifiers for NFC Tag Reader Session - For NFC features.</p>
                                        <h4 class="h4-heading">Add following items to above array item</h4>
                                        <ul class="my-2 inner-list">
                                            <li>A0000002471001</li>
                                            <li>E80704007F00070302</li>
                                            <li>A000000167455349474E</li>
                                            <li>A0000002480100</li>
                                            <li>A0000002480200</li>
                                            <li>A0000002480300</li>
                                            <li>A00000045645444C2D3031</li>
                                        </ul>
                                    </li>

                                    <li><p>com.apple.developer.nfc.readersession.formats. - NFC reading formats</p>
                                        <h4 class="h4-heading">Add following items to above array item</h4>
                                        <ul class="my-2 inner-list">
                                            <li>NDEF</li>
                                            <li>TAG</li>
                                        </ul>
                                    </li>
                                  
                                </ul>
                                
                            </div>
                        </div>
                        <div class="card pt-20 mt-3">
                            <div class="card-body">
                                <div class="accordion" id="accordionPanelsStayOpenExample">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse1" aria-expanded="false" aria-controls="panelsStayOpen-collapse1">Add NFC compatibility permission</button>
                                        </h2>
                                        <div id="panelsStayOpen-collapse1" class="accordion-collapse collapse">
                                            <div class="accordion-body">
                                                <p>Add NFC Compatibility</p>
                                <pre>Near Field Communication Tag Reading</pre>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse2" aria-expanded="false" aria-controls="panelsStayOpen-collapse2">Initialize Database</button>
                                        </h2>
                                        <div id="panelsStayOpen-collapse2" class="accordion-collapse collapse">
                                            <div class="accordion-body">
                                                <ul>
                                                    <li>To start the process user need to download the database using following code.</li>
                                                    <li>In this step progress object can be used to track the downloading percentage.</li>
                                                    <li>Once the database is downloaded 100% and status is Start Now, user can start the next step.</li>                                    
                                                </ul>
                                               <div class="mt-30">
                                                <h3 class="bg-white">Code to download the database</h3>
                                               </div>
<pre>
DataBaseDownloading.initialization(completion:{progres, status, error in
                    print(progres, status, error)
                })
</pre>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse3" aria-expanded="false" aria-controls="panelsStayOpen-collapse3">Get user Login token</button>
                                        </h2>
                                        <div id="panelsStayOpen-collapse3" class="accordion-collapse collapse">
                                            <div class="accordion-body">
                                                <ul>
                                                    <li>Pass valid email id and password to get user token</li>
                                                </ul> 
                                                <div class="mt-30">
                                                    <h3 class="bg-white">Code for user login</h3>
                                                </div>
<pre>
iPassSDKManger.UserOnboardingProcess(email: emailStr, password: passwordStr) { status, tokenString in
    if(status == true) {
        self.userToken = tokenString!
    }
}
</pre>   
                                                <div class="mt-30">
                                                    <ul>
                                                        <li>Once the user is logged in user token need to save because this will be used in document scanning process</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse4" aria-expanded="false" aria-controls="panelsStayOpen-collapse4">Get Supported flows</button>
                                        </h2>
                                        <div id="panelsStayOpen-collapse4" class="accordion-collapse collapse">
                                            <div class="accordion-body">
<pre>
    var getList = [[String: Any]]()
    getList = iPassSDKManger.getWorkFlows()
</pre>
                                                <ul>
                                                    <li>In the getList object you will get the array of dictionary with all the flows</li>
                
                                                    <li>Get the flowId from the list of supported flows which will be required for scanning process</li>
                
                                                    <li><p></p>
                                                        <h4 class="h4-heading">Sdk Supported Flows</h4>
                                                        <ul class="my-2 inner-list">
                                                            <li>Full Processing(10031)</li>
                                                            <li>Id verification + Liveness + AML(10032)</li>
                                                            <li>Id verification + AML(10015)</li>
                                                            <li>Id verification + Liveness(10011)</li>                                                            
                                                        </ul>
                                                    </li>
                                                    <li>In Full Process(10031), Social media email and phone number is required</li>                                   
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse5" aria-expanded="false" aria-controls="panelsStayOpen-collapse5">Document Scanning</button>
                                        </h2>
                                        <div id="panelsStayOpen-collapse5" class="accordion-collapse collapse">
                                            <div class="accordion-body">
                                                <ul>
                                                    <li>User can scan various types of documents.</li>
                                                    <li>Users can scan both the front and back sides of documents, but it totally depends on the document type.</li>
                                                </ul> 
                                                <div class="mt-30">
                                                    <h3 class="bg-white">Code to scan document</h3>
                                                </div>
<pre>
iPassSDKManger.delegate = self

iPassSDKManger.startScanningProcess(userEmail: "sam@gmail.com", flowId: 10031, socialMediaEmail :"samfb@gmail.com", phoneNumber : "978xxxxxx", controller: self, userToken: self.userToken, appToken: self.appToken)
</pre> 
                                                <div class="mt-30">
                                                    <ul>
                                                        <li>usertoken will be the login token</li>
                                                        <li>appToken will be the auth token provided by Admin</li>
                                                        <li>flowId will be the id selected by the user from above step.</li>
                                                        <li>After the scanning process, Response will be available in package delegate.</li>
                
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse6" aria-expanded="false" aria-controls="panelsStayOpen-collapse6">Add following delegate to get response</button>
                                        </h2>
                                        <div id="panelsStayOpen-collapse6" class="accordion-collapse collapse">
                                            <div class="accordion-body tab-li-content">
<pre>
    extension ViewController : iPassSDKManagerDelegate {
    
        func getScanCompletionResult(result: String, transactionId: String, error: String) {
            print(result)
            print(transactionId)
            print(error)
        }
    }
</pre> 
                                                <div class="mt-30">
                                                    <ul>
                                                        <li>"result" object will return the required json response</li>
                                                        <li>"transactionId" object will return the unique transcation number for completed transaction</li>
                                                        <li>"error" object will return the error description</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse7" aria-expanded="false" aria-controls="panelsStayOpen-collapse7">SDK properties</button>
                                        </h2>
                                        <div id="panelsStayOpen-collapse7" class="accordion-collapse collapse">
                                            <div class="accordion-body tab-li-content">
<pre>
    configProperties.setLoaderColor(color: UIColor.red)
    configProperties.needHologramDetection(value: true)
</pre> 
                                                    <div class="mt-30">
                                                        <ul>
                                                            <li>"setLoaderColor" property is used to change the color of the loader</li>
                                                            <li>"needHologramDetection" property is used for Authenticity checks like detection of Electronic Device, Optically Variable Ink, Multiple Laser Images, Image Patterns</li>
                                                            <li>By default hologram detection is enabled. you can disabled passing the false in hologram detection property</li>
                                                        </ul>
                                                    </div>
<pre>
    configProperties.needHologramDetection(value: false)
</pre> 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse8" aria-expanded="false" aria-controls="panelsStayOpen-collapse8">Add Multiple Languages(Optional)</button>
                                        </h2>
                                        <div id="panelsStayOpen-collapse8" class="accordion-collapse collapse">
                                            <div class="accordion-body tab-li-content">
                                                <p>Applications supports following langauges</p>
                                                <ul>
                                                    <li>Arabic</li>
                                                    <li>English</li>
                                                    <li>French</li>
                                                    <li>German</li>
                                                    <li>Kurdish</li>
                                                    <li>Spanish</li>
                                                    <li>Turkish</li>
                                                    <li>Urdu</li>
                                                </ul>
                                                <p>You need to add the multi languages files from the xcode for requried languages and you can copy the language keys from the following link</p>
                                                <div class="new-page-link my-4">
                                                    <a href="ipass-sdkLanguages.html" target="_blank">Click here</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="ipassfooter">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="footer-blk">
                        <div class="footer-logo">
                            <img src="assets/img/i-pass-logo-white.png" alt="logo">
                        </div>
                        <div class="footer-content">
                            <p>AI-powered identity verification, eKYC, and transaction monitoring</p>
                        </div>
                        <div class="ipass-social-media-blk">
                            <a href="https://www.facebook.com/Ipass.mena" target="_blank">
                                <i class="fab fa-facebook-square"></i>
                            </a>
                            <a href="https://www.youtube.com/channel/UCmlULlAptc4jmWnqIxsnZLw" target="_blank">
                                <i class="fab fa-youtube-square"></i>
                            </a>
                            <a href="https://www.linkedin.com/company/i-pass" target="_blank">
                                <i class="fab fa-linkedin"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="assets/js/bootstrap.bundle.min.js"></script>


<script>
$(document).ready(function() {
  // Set a 5-second timeout using setTimeout
  setTimeout(function() {
    var currentUrl = window.location.href;
        
    // Check if the URL ends with "documentation.html"
    if (currentUrl.endsWith("documentation.html")) {
    // Alert after the timeout
      window.location.replace("https://plusapi.ipass-mena.com/api-docs/");
    } else {
      // No redirection needed (optional: you can add a message here)
      console.log("URL does not end with 'documentation.html'");
    }
  }, 500); // Timeout in milliseconds (5000ms = 5 seconds)
});

  //  $(document).on("click", "#contact-tab", function() {
  //   alert("1");
  //   $("#contact-tab").addClass("active");
  // });
</script>
</body>

</html>

# AlertWalletSDK

`AlertWalletSDK` is a Swift library that facilitates interactions with Apple Wallet for managing and manipulating passes programmatically. This SDK provides functionality to create, manage, and update passes seamlessly within your iOS applications.

## Table of Contents

- [Features](#features)
- [Onboarding](#onboarding)
- [Installation](#installation)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [API Reference](#api-reference)
- [License](#license)

## Features

- **Pass Management**: Create, update, and manage Apple Wallet passes.
- **Pass Retrieval**: Retrieve and query existing passes in the Wallet.
- **Customizable Passes**: Support for custom pass designs and metadata.
- **Delegates and Callbacks**: Handle pass-related events and updates with delegate callbacks.

## Onboarding

To enable your app to provision and add a pass to Apple Wallet, follow these steps:

## Entitlements for Pass Provisioning

To enable your iOS app to provision and add passes to Apple Wallet, you must configure the appropriate entitlement. This section describes the steps required to request and implement the entitlement needed for pass provisioning.

### Overview

An entitlement grants your app the necessary rights to use certain features or technologies on iOS devices. For pass provisioning to Apple Wallet, your app requires the `com.apple.developer.contactless-payment-pass-provisioning` entitlement with the value `["shareablecredential"]`.

### Steps to Configure the Entitlement

#### Step 1: Request the Entitlement

To provision passes from within your app, you need to request the following entitlement:

- **Entitlement Key:** `com.apple.developer.contactless-payment-pass-provisioning`
- **Entitlement Value:** `["shareablecredential"]`

To request this entitlement:
1. Email **applepayentitlements@apple.com** with the following information:
   - **Proposed Use Cases:** Describe how you plan to use pass provisioning.
   - **Business Location:** State the country where your business is headquartered.
   - **Organization Name**
   - **App Name**
   - **Team ID:** Your Apple Developer account Team ID.
   - **App ID:** Your App Store ID.

You will receive an email confirmation once your entitlement request is processed.

#### Step 2: Create a Provisioning Profile

After receiving the entitlement, you need to include it in a provisioning profile. Follow these steps:

1. **Sign in** to [Apple Developer Account](https://developer.apple.com/account).

2. **Create a New Identifier:**
   - Go to **Identifiers**.
   - Select **+** next to **Identifiers**.
   - Choose **App IDs** > **App** or **App IDs** > **App Clip**.
   - On the Register an App ID page:
     - Enter a description.
     - Select the appropriate **Bundle ID** type.
     - Under **Additional Capabilities**, select **Contactless Pass Provisioning (SharableCredential)**.
     - Click **Register**.

3. **Create a Provisioning Profile:**
   - Go to **Certificates, IDs & Profiles**.
   - Select **Profiles** and then **+** next to **Profile**.
   - Choose **iOS App Development**.
   - On the **Generate a Provisioning Profile** page:
     - Select the new **App ID** you created.
     - Choose the appropriate **Certificates** and **Devices**.
     - For **Entitlements**, select **Default** to include the entitlement automatically.
     - Enter a profile name and click **Generate**.
   - **Download** the Provisioning Profile.

4. **Add the Provisioning Profile to Xcode:**
   - Open your Xcode project.
   - Go to **Signing & Capabilities** in the project editor.
   - Ensure **Automatically manage signing** is unchecked.
   - Select or import the downloaded provisioning profile.

#### Step 3: Add the Entitlement to the Entitlements plist

Once the provisioning profile is set up, add the entitlement to your app’s Entitlements plist:

1. **Edit the Entitlements plist File Directly:**
   - Add the following key-value pair to the file:

   ```xml
   <key>com.apple.developer.contactless-payment-pass-provisioning</key>
   <array>
       <string>shareablecredential</string>
   </array>
   ```

2. **Edit the Entitlements plist in Xcode:**
   - Open the Entitlements file in Xcode.
   - Update it to include the entitlement key and value.

By following these steps, you will configure your app to support pass provisioning to Apple Wallet, enabling users to seamlessly add and manage their passes.



## Installation

### Swift Package Manager

To add `AlertWalletSDK` to your project using Swift Package Manager:

1. Open your Xcode project.
2. Select 'File' > 'Add Packages…'' from the menu.
3. in the dialog that appears, enter the following URL in the search bar:
```ruby
https://github.com/AlertEnterprise-Inc/AlertWalletSDK.git
```
4. Choose the version you want to install and click `Add Package`.
   Alternatively, you can manually add it by including the following in your `Package.swift` file:
```ruby
dependencies: [
    .package(url: "https://github.com/AlertEnterprise-Inc/AlertWalletSDK.git", from: "1.0.0")
]
```

### CocoaPods
To integrate AlertWalletSDK using CocoaPods, add the following line to your Podfile:

    pod 'AlertWalletSDK', '~> 1.0'

Then run:

    pod install


## Getting Started
1. Import the Library
Import the `AlertWalletSDK` module into your Swift files where you plan to use it:

```swift
import AlertWalletSDK
```
2. Configure the SDK
Ensure that the SDK is properly configured in your app. This may involve setting up necessary credentials or configurations specific to your use case.

```swift
PropertiesManager.shared.setEnvironmentIdentifier(environmentIdentifier: "your-environment-id")
```

## Usage

1. implement a class / controller that conforms to AlertWalletControllerDelegate
```swift
class AlertViewController : UIViewController,AlertWalletControllerDelegate
```
2. To handle these events, you need to set your class as the delegate of AlertWalletController
```swift
 AlertWalletController.shared.delegate = self
```
Explanation:
`viewDidLoad():` Called after the view controller has loaded its view hierarchy into memory. This is where UI setup is typically performed.

3. Call functions of AlertWalletController(Singleton) using shared reference
```swift
AlertWalletController.shared.isWatchPaired()
AlertWalletController.shared.getRemotePasses()
AlertWalletController.shared.getDevicePasses()
```
4. To handle these events, you need to implement delegate functions accordingly for Eg. The `saveToWallet` method of `AlertWalletController` allows you to save a pass to the Apple Wallet. It uses the provided `ProvisioningCredential` and an optional preview image to add the pass to the user's Wallet.

### Function Signature

```swift
func saveToWallet(parentViewController: UIViewController, credential: ProvisioningCredential, previewImage: UIImage?)
```

### Parameters

- **parentViewController (`UIViewController`)**: The view controller that will present any necessary UI components or dialogs during the process of adding the pass to Apple Wallet.

- **credential (`ProvisioningCredential`)**: The credential object that contains all necessary details for the pass, including identifiers and metadata required for provisioning.

- **previewImage (`UIImage?`)**: An optional image to be shown as a preview for the pass. This can enhance user experience by displaying a visual representation of the pass during the addition process.

### Returns

- **Void**: This method does not return any value. It performs the operation of saving the pass to the Wallet.

### Example Usage

```swift
import UIKit
import PassKit

// Initialize ProvisioningCredential
let credential = ProvisioningCredential(/* initialization parameters */)

// Load a preview image
let previewImage = UIImage(named: "alert-card_art")!

// Call saveToWallet to add the pass
AlertWalletController.shared.saveToWallet(parentViewController: self, credential: credential, previewImage: previewImage)
```

### Callback Methods

To handle the results of the `saveToWallet` operation, implement the following delegate methods in your `AlertWalletControllerDelegate`:

#### `onWalletProvisioningError`

This method is called if an error occurs while provisioning the pass to Apple Wallet.

**Function Signature:**

```swift
func AlertWalletUIViewController(_ controller: AlertWalletController, onWalletProvisioningError error: WalletProvisioningResponse)
```

**Parameters:**

- **controller (`AlertWalletController`)**: The instance of `AlertWalletController` that invoked the callback.
- **error (`WalletProvisioningResponse`)**:  An instance of WalletProvisioningResponse containing error details.

**Example Implementation:**

```swift
func AlertWalletUIViewController(_ controller: AlertWalletController, onWalletProvisioningError error: WalletProvisioningResponse) {
    Self.logger.debug("walletProvisioningError ::  \(error)" )
    // Handle the error (e.g., show an alert to the user)
}
```

**Details:**

- Use this callback to handle errors during the Wallet provisioning process.
- Update the UI or notify the user about the failure to ensure a smooth experience.

#### `onWalletProvisioningSuccess`

This method is called when the pass is successfully provisioned to Apple Wallet.

**Function Signature:**

```swift
func AlertWalletUIViewController(_ controller: AlertWalletController, onWalletProvisioningSuccess success: WalletProvisioningResponse)
```

**Parameters:**

- **controller (`AlertWalletController`)**: The instance of `AlertWalletController` that invoked the callback.
- **success (`WalletProvisioningResponse`)**: An instance of WalletProvisioningResponse containing success details.

**Example Implementation:**

```swift
func AlertWalletUIViewController(_ controller: AlertWalletController, onWalletProvisioningSuccess success: WalletProvisioningResponse) {
    Self.logger.debug("walletProvisioningSuccess ::  \(success)" )
    self.viewmodel.showProgressView = false
    self.viewmodel.stateModel.cards[self.viewmodel.activeCard].showAddtoWalletButton = false
    // Notify the user or update the UI to reflect the successful addition
}
```

**Details:**

- Use this callback to handle successful provisioning.
- Update the UI to reflect that the pass has been added and to hide any progress indicators or buttons related to the provisioning process.

---

These methods ensure that your app can handle both successful and unsuccessful attempts to add passes to Apple Wallet, providing a better user experience and facilitating error management.
  
5. for more details about delegate callback function refer to API section


## API Reference
### Controller  & Delegate
The `AlertWalletController` class is designed to manage and present Apple Wallet passes within your application. It provides methods to add, update, and provision passes, along with delegate callbacks to handle success and error scenarios.
`AlertWalletController` inherits from UIViewController

##### Initialization
`AlertWalletController` is a singleton object
To access the function of `AlertWalletController`, use shared variable of the class.

#### Main Responsibilities:
- **Eligibility Check**: Verify if the device and app are eligible for pass provisioning.
- **Provisioning**: Manage the process of provisioning a pass, including handling success and error scenarios.
- **Pass Management**: Retrieve and manage device and remote passes.

### Properties

#### `shared`

```swift
public static let shared = AlertWalletController()
```

- **Description**: 
  - The `shared` property provides a singleton instance of the `AlertWalletController` class. This is the only instance that should be used throughout your application to ensure consistent behavior and avoid multiple instances.

- **Usage**:
  - Access the shared instance using `AlertWalletController.shared` to interact with the controller's functionality, such as checking eligibility or provisioning passes.

#### `delegate`

```swift
public weak var delegate: AlertWalletControllerDelegate?
```

- **Description**: 
  - The `delegate` property is used to set an object that will receive asynchronous event callbacks related to pass provisioning and other Wallet interactions. This allows your application to respond to various events, such as success or failure of provisioning operations.

- **Usage**:
  - Assign a delegate that conforms to the `AlertWalletControllerDelegate` protocol to handle callbacks and update your app’s UI or state based on the results of Wallet interactions.

## functions

### `checkEligibility`
Here's how you might use it in your code:
 
    AlertWalletController.shared.checkEligibility()

| **Method**                 | **Description**                                                                                      | **Usage**                                                                                            | **Parameters**
|----------------------------|------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| `checkEligibility()`   | To verify if the device and app meet the requirements for pass provisioning.                                          | Call it during the initialization phase of your app or when you need to verify if the pass provisioning process can proceed. | `nil`

**Delegate Callbacks:**

    func AlertWalletUIViewController(_ controller: AlertWalletController, onEligibilityResult isEligible: Bool)

| **Callback Method**                                | **Description**                                                      | **Parameters**                                |
|----------------------------------------------------|----------------------------------------------------------------------|-----------------------------------------------|
| `onEligibilityResult`    | Once the eligibility check is complete, the SDK will typically notify your app via a delegate method or a callback. This allows you to handle the result appropriately.    | `_ controller: isEligible` |


### `isWatchPaired`
Here's how you might use it in your code:
 
    AlertWalletController.shared.isWatchPaired()

| **Method**                 | **Description**                                                                                      | **Usage**                                                                                            | **Parameters**
|----------------------------|------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| `isWatchPaired()`   | To determine whether the user’s iOS device is paired with an Apple Watch. This is a critical check when working with passes that are intended to be used across both the iPhone and Apple Watch.                                          | Call it when you need to check the status of the Apple Watch pairing. | `nil`

**Delegate Callbacks:**

    func AlertWalletUIViewController(_ controller: AlertWalletController, isWatchPaired result: Bool)

| **Callback Method**                                | **Description**                                                      | **Parameters**                                |
|----------------------------------------------------|----------------------------------------------------------------------|-----------------------------------------------|
| `onEligibilityResult`    | Once the eligibility check is complete, the SDK will typically notify your app via a delegate method or a callback. This allows you to handle the result appropriately.    | `_ controller: isWatchPaired` |


### `saveToWallet`
Here's how you might use it in your code:

```swift
AlertWalletController.shared.saveToWallet(parentViewController: UIViewController, credential: ProvisioningCredential, previewImage: UIImage?)
```

### Parameters

- **parentViewController (`UIViewController`)**: The view controller that will present any necessary UI components or dialogs during the process of adding the pass to Apple Wallet.

- **credential (`ProvisioningCredential`)**: The credential object that contains all necessary details for the pass, including identifiers and metadata required for provisioning.

- **previewImage (`UIImage?`)**: An optional image to be shown as a preview for the pass. This can enhance user experience by displaying a visual representation of the pass during the addition process.


| **Method**               | **Description**                                                                                     | **Parameters**         |
|--------------------------|-----------------------------------------------------------------------------------------------------|---------------------|
| `saveToWallet(_:)`     | Simulates the process of adding a pass to Apple Wallet. This method is a placeholder.              |  `parentViewController: UIViewController`, `credential: ProvisioningCredential`, `previewImage: UIImage?` |

**Delegate Callbacks:**

To handle the results of the `saveToWallet` operation, implement the following delegate methods in your `AlertWalletControllerDelegate`:


```swift
func AlertWalletUIViewController(_ controller: AlertWalletController, onWalletProvisioningSuccess success: WalletProvisioningResponse)
```
```swift
func AlertWalletUIViewController(_ controller: AlertWalletController, onWalletProvisioningError error: WalletProvisioningResponse)
```

| **Method**                          | **Description**                                             | **Parameters**                                    |
|----------------------------------------------|-------------------------------------------------------------|---------------------------------------------------|
| `onWalletProvisioningSuccess` | Called when a pass is successfully provisioned.            | `controller: AlertWalletController`, `onWalletProvisioningSuccess success: WalletProvisioningResponse`  |
| `onWalletProvisioningError`   | Called when an error occurs during pass provisioning.       | `controller: AlertWalletController`, `onWalletProvisioningError error: WalletProvisioningResponse` |

### `getDevicePasses`
Here's how you might use it in your code:

```swift
AlertWalletController.shared.getDevicePasses()
```

| **Method**               | **Description**                                                                                     | **Returns**         |
|--------------------------|-----------------------------------------------------------------------------------------------------|---------------------|
| `getDevicePasses()`     | Retrieves a list of passes stored locally on the device. These are physical passes that have been added to Apple Wallet and are accessible directly from the device.              |  `[PKPass]`|

### `getRemotePasses`
Here's how you might use it in your code:

```swift
AlertWalletController.shared.getRemotePasses()
```

| **Method**               | **Description**                                                                                     | **Returns**         |
|--------------------------|-----------------------------------------------------------------------------------------------------|---------------------|
| `getRemotePasses()`     | Retrieves a list of of remote passes that are stored on a paired device, such as an Apple Watch. .              |  `[PKSecureElementPass]`|

Here's a summary document for the data structures used in provisioning passes:

---

# Summary of Data Structures

## `ProvisioningRequestPayload` Data Structure

**Purpose**: Represents the payload needed to request provisioning of a pass. This structure contains the user and badge identifiers required for the provisioning process.

### Properties

- **userId** (`String`): Unique identifier for the user requesting the pass.
- **badgeId** (`String`): Unique identifier for the badge associated with the pass.

### Initializers

- **`init()`**: Creates an instance with `userId` and `badgeId` set to empty strings.
- **`init(userId:badgeId:)`**: Creates an instance with specified `userId` and `badgeId`.

### Example Usage

```swift
let payload = ProvisioningRequestPayload(userId: "12345", badgeId: "67890")
```

---

## `ProvisioningCredential` Data Structure

**Purpose**: Represents the credential obtained after a successful provisioning request. This structure includes detailed provisioning information.

### Properties

- **provisioningInformation** (`ProvisioningInformation`): Contains detailed information about the provisioning process.

### Initializers

- **`init()`**: Creates an instance with an empty `ProvisioningInformation`.
- **`init(provisioningInformation:)`**: Creates an instance with a specified `ProvisioningInformation`.

### Example Usage

```swift
let info = ProvisioningInformation(provisioningCredentialIdentifier: "ABC123",
                                   sharingInstanceIdentifier: "XYZ789",
                                   cardTemplateIdentifier: "Template1",
                                   environmentIdentifier: "Env1",
                                   accountHash: "HashValue",
                                   relyingPartyIdentifier: "RelyingParty")
let credential = ProvisioningCredential(provisioningInformation: info)
```

---

## `ProvisioningInformation` Data Structure

**Purpose**: Contains detailed information about the pass being provisioned. This structure provides identifiers and additional details related to the pass.

### Properties

- **provisioningCredentialIdentifier** (`String`): Identifier for the provisioning credential.
- **sharingInstanceIdentifier** (`String`): Identifier for the sharing instance.
- **cardTemplateIdentifier** (`String`): Identifier for the card template used.
- **environmentIdentifier** (`String?`): Optional identifier for the environment.
- **accountHash** (`String?`): Optional hash for the account.
- **relyingPartyIdentifier** (`String?`): Optional identifier for the relying party.

### Initializers

- **`init()`**: Creates an instance with empty strings for required properties and `nil` for optional properties.
- **`init(provisioningCredentialIdentifier:sharingInstanceIdentifier:cardTemplateIdentifier:environmentIdentifier:accountHash:relyingPartyIdentifier:)`**: Creates an instance with specified values for all properties.

### Example Usage

```swift
let info = ProvisioningInformation(provisioningCredentialIdentifier: "ABC123",
                                   sharingInstanceIdentifier: "XYZ789",
                                   cardTemplateIdentifier: "Template1",
                                   environmentIdentifier: "Env1",
                                   accountHash: "HashValue",
                                   relyingPartyIdentifier: "RelyingParty")
```

## `WalletProvisioningResponse` Data Structure

**Purpose**: Represents the response received from the wallet provisioning process, including success status, pass URL, and additional information.

### Properties

- **success** (`Bool`): Indicates whether the provisioning process was successful.
- **passUrl** (`URL?`): URL to view the pass in Wallet, if successful.
- **message** (`String?`): Message providing details about the provisioning result (success or error).
- **pass** (`PassInformation`): Detailed information about the pass.

### Initializers

- **`init()`**: Creates an instance with default values:
  - `success` set to `false`.
  - `passUrl` and `message` set to `nil`.
  - `pass` set to an empty `PassInformation` instance.

- **`init(message: String)`**: Creates an instance with a message indicating an error:
  - `success` set to `false`.
  - `passUrl` set to `nil`.
  - `message` set to the provided error message.
  - `pass` set to an empty `PassInformation` instance.

- **`init(success: Bool, passUrl: URL?, message: String, pass: PassInformation)`**: Creates an instance with specified values for all properties.

### Example Usage

```swift
let successResponse = WalletProvisioningResponse(success: true,
                                                 passUrl: URL(string: "https://example.com/pass"),
                                                 message: "Provisioning successful",
                                                 pass: PassInformation(/* initialize with actual values */))
```

## `PassInformation` Data Structure

**Purpose**: Contains details about the pass being provisioned.

### Properties

- **passType** (`Int?`): An optional integer representing the type of the pass.
- **passTypeIdentifier** (`String?`): An optional string identifier for the type of pass.
- **webServiceURL** (`URL?`): An optional URL for the web service related to the pass.

### Initializers

- **`init()`**: Creates an instance with default values:
  - `passType`, `passTypeIdentifier`, and `webServiceURL` set to `nil`.

- **`init(passType: Int?, passTypeIdentifier: String?, webServiceURL: URL?)`**: Creates an instance with specified values:
  - `passType` set to the provided integer value.
  - `passTypeIdentifier` set to the provided string.
  - `webServiceURL` set to the provided URL.

### Example Usage

```swift
let passInfo = PassInformation(passType: 1,
                                passTypeIdentifier: "com.example.pass",
                                webServiceURL: URL(string: "https://example.com/service"))
```


---

This document provides an overview of the data structures used for pass provisioning, including `ProvisioningRequestPayload`, `ProvisioningCredential`, and `ProvisioningInformation`. Each structure has properties and initializers to facilitate the creation and handling of provisioning requests and credentials.

## License
**copyright reserved Alertenterprise**


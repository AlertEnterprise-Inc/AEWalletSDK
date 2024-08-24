# AlertWalletSDK

`AlertWalletSDK` is a Swift library that facilitates interactions with Apple Wallet for managing and manipulating passes programmatically. This SDK provides functionality to create, manage, and update passes seamlessly within your iOS applications.

## Table of Contents

- [Features](#features)
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
## Getting Started
1. Import the Library
Import the `AlertWalletSDK` module into your Swift files where you plan to use it:
```swift
import AlertWalletSDK
```
2. Configure the SDK
Ensure that the SDK is properly configured in your app. This may involve setting up necessary credentials or configurations specific to your use case.


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
4. To handle these events, you need to implement delegate functions accordingly for Eg
The `startPassProvisioning` method in `AlertWalletController` is responsible for initiating the process of provisioning a pass to Apple Wallet. This process involves creating or updating a pass in the user's Wallet, which requires interaction with Apple Wallet's APIs.
```swift
 AlertWalletController.shared.startPassProvisioning(identityId: userId,identityMobileCredentialId:badgeId)
```
will delegate response to `provisioningSuccess` or `provisioningError`

```swift
func provisioningError(_ controller: AlertWalletController, credentialCreateError credential: ProvisionAPIErrorResponse) {
        Self.logger.debug("implement Error flow" )
    }
```
```swift
func provisioningSuccess(_ controller: AlertWalletController, credentialCreateSuccess credential: ProvisioningCredential) {
        Self.logger.debug(" \(credential.provisioningInformation.provisioningCredentialIdentifier)" )
        Self.logger.debug(" \(credential.provisioningInformation.cardTemplateIdentifier)" )
        Self.logger.debug(" \(credential.provisioningInformation.sharingInstanceIdentifier)" )
        AlertWalletController.shared.saveToWallet(parentViewController: self, credential: credential)
    }
```
5. for more details about delegate callback function refer to API section


## API Reference
### Controller  & Delegate
The `AlertWalletController` class is designed to manage and present Apple Wallet passes within your application. It provides methods to add, update, and provision passes, along with delegate callbacks to handle success and error scenarios.
`AlertWalletController` inherits from UIViewController

##### Initialization
`AlertWalletController` is a singleton object
To access the function of `AlertWalletController`, use shared variable of the class.

##### functions

### `startPassProvisioning`

| **Method**                 | **Description**                                                                                      | **Usage**                                                                                            | **Parameters**
|----------------------------|------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| `startPassProvisioning()`   | Starts the process of provisioning a pass to Apple Wallet.                                          | Call this method to initiate the provisioning process for the pass associated with this controller. | `identityId: String, identityMobileCredentialId: String`

**Delegate Callbacks:**

| **Callback Method**                                | **Description**                                                      | **Parameters**                                |
|----------------------------------------------------|----------------------------------------------------------------------|-----------------------------------------------|
| `credentialCreateSuccess`    | Called when the pass is successfully create a credenttial to add to wallet.    | `controller: `, `credential: ProvisioningCredential` |
| `credentialCreateError`      | Called when an error occurs during the provisioning process.         | `_ controller: AlertWalletController`, `credentialCreateError credential: ProvisionAPIErrorResponse` |

### `saveToWallet(parentViewController: UIViewController, credential: ProvisioningCredential)`

| **Method**               | **Description**                                                                                     | **Returns**         |
|--------------------------|-----------------------------------------------------------------------------------------------------|---------------------|
| `saveToWallet(_:)`     | Simulates the process of adding a pass to Apple Wallet. This method is a placeholder.              |  success / failure in delegate response) |

**Delegate Callbacks:**


| ** Method**                          | **Description**                                             | **Parameters**                                    |
|----------------------------------------------|-------------------------------------------------------------|---------------------------------------------------|
| `walletprovisioningSuccess` | Called when a pass is successfully provisioned.            | `controller: AlertWalletController`, `walletProvisioningSuccess success: String`  |
| `walletprovisioningError`   | Called when an error occurs during pass provisioning.       | `controller: AlertWalletController`, `walletProvisioningError error: String` |

## License
**copyright reserved Alertenterprise**


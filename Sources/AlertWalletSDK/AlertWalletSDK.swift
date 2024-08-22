public class AlertWalletSDK {

    public static func createViewController(delegate: AlertWalletControllerDelegate?) -> AlertWalletController {
        let viewController = AlertWalletController()
        viewController.delegate = delegate
        return viewController
    }
}


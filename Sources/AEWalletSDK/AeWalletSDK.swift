public class AeWalletSDK {

    public static func createViewController(delegate: AeWalletControllerDelegate?) -> AeWalletController {
        let viewController = AeWalletController()
        viewController.delegate = delegate
        return viewController
    }
}


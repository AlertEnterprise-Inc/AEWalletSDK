import PassKit

public class AlertWalletSDK {

    public init(delegate : AlertWalletControllerDelegate){
        AppleWatchDetector.shared.delegate = delegate
        AppleWatchDetector.shared.initialize()

    }
}


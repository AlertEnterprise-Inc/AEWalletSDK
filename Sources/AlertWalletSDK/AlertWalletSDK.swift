import PassKit

public class AlertWalletSDK {

    var watchDetector: AppleWatchDetector

    public init(delegate : AlertWalletControllerDelegate){
        AppleWatchDetector.shared.delegate = delegate
        AppleWatchDetector.shared.initialize()
    }





}


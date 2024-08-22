import PassKit

public class AlertWalletSDK {

    var watchDetector: AppleWatchDetector

    public init(){
        watchDetector = AppleWatchDetector.shared
    }

    public func isWatchPaired() -> Bool{
        return watchDetector.watchPaired
    }



}


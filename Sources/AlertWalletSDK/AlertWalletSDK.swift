import PassKit

public class AlertWalletSDK {

    var watchDetector: AppleWatchDetector

    public init(){
        watchDetector = AppleWatchDetector()
    }

    public func isWatchPaired() -> Bool{
        watchDetector.detect()
        return watchDetector.watchPaired
    }

}


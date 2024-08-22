import PassKit


public struct AlertWalletSDK  {

    public init() {
        print("Ïnit");
    }

    public func propertyManager() -> PropertiesManager{
        return PropertiesManager.shared
    }

}


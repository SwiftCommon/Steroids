import Foundation
import Swinject

/// The actual syringe to inject your goodies with
@propertyWrapper
public struct Injected<Service> {
    private var service: Service?
    /// Specify a specific dealer or use Dealer.shared when nil
    public var dealer: Dealer?
    /// Specify the name for the needed service
    public var name: String?

    /// Initialize an injection
    ///
    /// - Parameters:
    ///   - dealer: Specify a specific dealer or use Dealer.shared when nil
    ///   - name: Specify the name for the needed service
    public init(dealer: Dealer? = nil, name: String? = nil) {
        self.dealer = dealer
        self.name = name
    }

    /// Take the injection
    public var wrappedValue: Service {
        mutating get {
            if service == nil {
                service = (dealer ?? Dealer.shared).resolver.resolve(
                    Service.self,
                    name: name
                )
            }
            return service! //swiftlint:disable:this force_unwrapping
        }
        set {
            service = newValue
        }
    }

    /// Projected self
    public var projectedValue: Injected<Service> {
        get {
            return self
        }
        mutating set {
            self = newValue
        }
    }
}

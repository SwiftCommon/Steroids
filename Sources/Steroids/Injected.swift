import Foundation
import Swinject

@propertyWrapper
public struct Injected<Service> {
    private var service: Service?
    public var dealer: Dealer?
    public var name: String?

    public init(dealer: Dealer? = nil, name: String? = nil) {
        self.dealer = dealer
        self.name = name
    }

    public var wrappedValue: Service {
        mutating get {
            if service == nil {
                service = (dealer ?? Dealer.shared).resolver.resolve(
                    Service.self,
                    name: name
                )
            }
            return service!
        }
        set {
            service = newValue
        }
    }
    public var projectedValue: Injected<Service> {
        get {
            return self
        }
        mutating set {
            self = newValue
        }
    }
}

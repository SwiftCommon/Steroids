import Foundation
import Swinject

public final class Dealer {
    let container: Container

    init(container: Container) {
        self.container = container
    }

    public static var shared = Dealer(container: Container())

    public var resolver: Resolver {
        get {
            return container
        }
    }

    public func push<Service>(
        _ serviceType: Service.Type,
        name: String? = nil,
        factory: @escaping (Resolver) -> Service
    ) -> ServiceEntry<Service> {
        return container.register(serviceType, name: name, factory: factory)
    }

    public func reset() {
        container.removeAll()
    }
}

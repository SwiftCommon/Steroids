import Foundation
import Swinject

/// Dealer a front for whatever Swinject has to sell
public final class Dealer {
    let container: Container

    init(container: Container) {
        self.container = container
    }

    /// Shared dealer instance for all your needs
    public static var shared = Dealer(container: Container())

    /// The actual resolver hidden by this Dealer
    public var resolver: Resolver {
        return container
    }

    /// Add your own Steroids to the Dealers list
    ///
    /// - Parameters:
    ///   - serviceType: the type to register
    ///   - name: A registration name, which is used to differentiate from other registrations
    //            that have the same service and factory types.
    ///   - factory: the closure that creates the registered service. If the type has any dependencies it resolve these
    ///           with the use of the given `Resolver`
    /// - Returns: A registered `ServiceEntry` to configure more settings with method chaining.
    @discardableResult
    public func push<Service>(
        _ serviceType: Service.Type,
        name: String? = nil,
        factory: @escaping (Resolver) -> Service
    ) -> ServiceEntry<Service> {
        return container.register(serviceType, name: name, factory: factory)
    }

    /// Remove/drop all registrations
    public func reset() {
        container.removeAll()
    }
}

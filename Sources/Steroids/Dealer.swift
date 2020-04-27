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
}

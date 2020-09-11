import Foundation
@testable import Steroids
import XCTest

final class InjectedTest: XCTestCase {
    @Injected(name: "value") var sut: String

    override static func setUp() {
        super.setUp()
        Dealer.shared.push(String.self, name: "value") { _ in "SomeString" as String }
    }

    func testInjected() {
        XCTAssertEqual("SomeString", sut)
    }

    static var allTests = [
        ("testInjected", testInjected)
    ]
}

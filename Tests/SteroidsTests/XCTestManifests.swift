import XCTest

#if !canImport(ObjectiveC)
/// Run all tests
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(InjectedTest.allTests)
    ]
}
#endif

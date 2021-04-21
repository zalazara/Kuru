import XCTest
@testable import Kuru

final class KuruTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Kuru().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

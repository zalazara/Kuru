import XCTest
import Quick
import Nimble

@testable import Kuru
import Quick
import Nimble
import SwiftUI

@testable import Kuru

final class KComponentDecoderTest: QuickSpec {

    override func spec() {
        describe("KComponentDecoder") {
            let validJson = "{\"type\":\"view\",\"args\":{\"backgroundColor\":\"#f00\"},\"childrens\":[{\"type\":\"view\",\"args\":{}},{\"type\":\"view\",\"args\":{}},{\"type\":\"view\",\"args\":{}}]}"
            let validViewData = Data(validJson.utf8)
            
            let invalidJson = "{\"type\":\"text\",\"args\":{}"
            let invalidViewData = Data(invalidJson.utf8)

            Kuru.registerComponent(JsonView.self, for: "view")

            context("If it's a registered component") {
                it("have a component to display") {
                    let componentsToRender = Kuru.render(fromData: validViewData)
                    expect(componentsToRender).toNot(beNil())
                }
            }
            
            context("If it's an unregistered component") {
                it("haven't a component to display") {
                    let componentsToRender = Kuru.render(fromData: invalidViewData)
                    expect(componentsToRender).to(beNil())
                }
            }

            
        }
    }

    // static var allTests = [
    //     ("testExample", testExample),
    // ]
}

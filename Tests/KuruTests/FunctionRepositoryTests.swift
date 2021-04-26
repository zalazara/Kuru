import Quick
import Nimble

@testable import Kuru

final class FunctionRepositoryTests: QuickSpec {

    override func spec() {
        describe("FunctionRepository") {

            Kuru.registerFunction(name: "sayHello", completion: { params in
                print("Hello \(params?["name"] ?? "" )")
            })

            context("after register a function sayHello") {
                it("is in function repository"){
                    let findFunction = Kuru.registerFunctions.first(where: { $0.name == "sayHello" })
                    expect(findFunction).toNot(beNil())
                }
            }
        }
    }
}

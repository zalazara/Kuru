import SwiftUI
import Foundation

public class Kuru {
    
    static var registerFunctions: [KFunction]  = []
    
    public static func registerComponent<A: KComponentProtocol>(_ type: A.Type, for typeName: String) {
        KComponentDecoder.register(A.self, for: typeName)
    }
    
    public static func registerComponents<A: KComponentProtocol>(_ components: [String : A.Type ]) {
        components.forEach({
            KComponentDecoder.register($0.value.self, for: $0.key)
        })
    }
    
    public static func registerFunction(name: String, completion: @escaping ([String: Any]?) -> Void) {
        self.registerFunctions.append(KFunction(name: name, execute: completion))
    }
    
    public static func render(fromData json: Data) -> AnyView? {
        guard !json.isEmpty else { return nil }
        return KComponentDecoder.getDecoder(json: json)
    }
}

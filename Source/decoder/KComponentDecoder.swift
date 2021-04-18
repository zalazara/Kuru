//
// Special mention to @gonzalezreal for this code
// git:=> https://github.com/gonzalezreal/IndeterminateTypesWithCodable
// Blog post:=> https://medium.com/makingtuenti/indeterminate-types-with-codable-in-swift-5a1af0aa9f3d
//


import Foundation
import SwiftUI

struct KComponentDecoder: Codable {
    
    let type: String
    let view: AnyView
    let childrens: [AnyView]
    
    // MARK: Registration
    private typealias CDecoder = (KeyedDecodingContainer<CodingKeys>) throws -> Any
    private typealias CEncoder = (Any, inout KeyedEncodingContainer<CodingKeys>) throws -> Void
    
    private static var decoders: [String: CDecoder] = [:]
    private static var encoders: [String: CEncoder] = [:]
    
    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case type
        case args
        case childrens
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)
        
        
        if let decodeChildrens = try? container.decode([KComponentDecoder].self, forKey: .childrens) {
            childrens = decodeChildrens.map({ $0.view })
        } else {
           childrens = []
        }
        
        
        if let decode = KComponentDecoder.decoders[type] , let decodedView = (try decode(container) as? KComponentProtocol){
            view = decodedView.render(withChildrens: childrens)
        } else {
            view = AnyView(EmptyView())
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
    }
    
    static func register<A: Codable>(_ type: A.Type, for typeName: String) {
        
        if decoders.keys.first(where: { $0 == typeName}) != nil && encoders.keys.first(where: { $0 == typeName}) != nil {
            print("Error: Multiple registers for component type \(typeName)")
            return
        }
        
        decoders[typeName] = { container in
            try container.decode(A.self, forKey: .args)
        }
        
        encoders[typeName] = { payload, container in
            try container.encode(payload as! A, forKey: .args)
        }
    }
    
    static func getDecoder(json: Data) -> AnyView? {
        
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(KComponentDecoder.self, from: json)
            
            return decoded.view
        } catch  {
            print(error.localizedDescription)
        }
        
        return nil
    }
}

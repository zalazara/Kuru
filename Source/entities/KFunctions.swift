
import Foundation

struct KFunction {
    let name: String
    let execute: ([String : Any]?) -> Void
}

typealias RegisterFunction = () -> Void

public struct KFunctionDecoder: Codable {
    
    var execute: RegisterFunction = {}
    
    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case name
        case parameters
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let parameters = try? container.decode([String : Any].self, forKey: .parameters)
        
        if let functionRegister =  Kuru.registerFunctions.first(where: { $0.name == name }) {
            self.execute = { functionRegister.execute(parameters) }
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        
    }
    
    public func callAsFunction(){
        execute()
    }
}

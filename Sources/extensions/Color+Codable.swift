import SwiftUI

extension Color: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        var color = Color.clear
        
        if let mappedColor = try? container.decode(String.self).hexToColor {
            color = mappedColor
        }
        
        self = color
    }
    
    public func encode(to encoder: Encoder) throws {
    }
}

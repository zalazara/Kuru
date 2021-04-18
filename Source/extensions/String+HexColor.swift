import SwiftUI
import Foundation

public extension String {
    var hexToColor: Color? {
        
        get {
            
            let r, g, b: Double
            var a: Double = 1.0
            
            var cString:String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
            
            if (cString.hasPrefix("#")) {
                cString.remove(at: cString.startIndex)
            }
            
            let scanner = Scanner(string: cString)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) && cString.count >= 3{
                switch cString.count {
                case 8:
                    r = Double((hexNumber & 0xff000000) >> 24) / 255
                    g = Double((hexNumber & 0x00ff0000) >> 16) / 255
                    b = Double((hexNumber & 0x0000ff00) >> 8) / 255
                    a = Double(hexNumber & 0x000000ff) / 255
                case 6:
                    r = Double((hexNumber & 0xFF0000) >> 16) / 255
                    g = Double((hexNumber & 0x00FF00) >> 8) / 255
                    b = Double(hexNumber & 0x0000FF) / 255
                default:
                    r = Double((hexNumber >> 8) * 17) / 255
                    g = Double(((hexNumber & 0xF) >> 4) * 17) / 255
                    b = Double((hexNumber & 0xF) * 17) / 255
                }
                
                return Color.init(red: r, green: g, blue: b, opacity: a)
            } else {
                print("Invalid hex color \(self)")
            }
            
            return nil
        }
        
    }
}

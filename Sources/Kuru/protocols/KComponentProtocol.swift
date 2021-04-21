import SwiftUI

public protocol KComponentProtocol: Codable {
    func render(withChildrens: [AnyView]) -> AnyView
}

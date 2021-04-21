import SwiftUI

public extension View {
    func toAnyView() -> AnyView {
        return AnyView(self)
    }
}

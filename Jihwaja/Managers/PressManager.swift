//
//  PressManager.swift
//  Jihwaja
//
//  Created by geee3 on 2023/05/09.
//

import SwiftUI

struct PressManager: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in
                        onPress()
                    })
                    .onEnded({ _ in
                        onRelease()
                    })
            )
    }
}

extension View {
    func pressEvents(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
        modifier(PressManager(onPress: { onPress() }, onRelease: { onRelease() }))
    }
}

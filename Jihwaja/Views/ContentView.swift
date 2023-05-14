//
//  ContentView.swift
//  Jihwaja
//
//  Created by geee3 on 2023/05/02.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("_isFirstLaunching") var isFirstLaunching : Bool = true
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    
    @EnvironmentObject var store: JihwajaStore
    var body: some View {
        ZStack{
            if isFirstLaunching == false{
                MainView()
            } else {
                OnboardingView(isFirstLaunching: $isFirstLaunching)
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(saveAction: {})
    }
}

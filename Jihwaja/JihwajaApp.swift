//
//  JihwajaApp.swift
//  Jihwaja
//
//  Created by geee3 on 2023/05/02.
//

import SwiftUI

@main
struct JihwajaApp: App {
    @StateObject private var store = JihwajaStore()
    
    var body: some Scene {
        WindowGroup {
                ContentView()
                .environmentObject(store)

        }
    }
}

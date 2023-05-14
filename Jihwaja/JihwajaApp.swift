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

            if store.jihwaja.isFirst{
            MainView()
                    {
                Task{
                    do {
                        try await store.save(jihwaja: store.jihwaja)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                    
                    
                }
            }
            .environmentObject(store)
            .task{
                do{
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
            
            } else {
                OnboardingView(jihwajaData: $store.jihwaja)
                    .environmentObject(store)
            }

        }
    }
}

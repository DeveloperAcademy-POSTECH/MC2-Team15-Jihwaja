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

            MainView(jihwajaData: $store.jihwaja){
                Task{
                    do {
                        try await store.save(jihwaja: store.jihwaja)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                    
                    
                }
            }
            .task{
                do{
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }

        }
    }
}

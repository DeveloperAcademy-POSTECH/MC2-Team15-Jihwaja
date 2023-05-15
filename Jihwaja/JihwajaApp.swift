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
    @State var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashView()
                    .frame(width: getWidth() * 0.8)
                    .onAppear {
                        print("splash")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.showSplash = false
                        }
                    }
            } else {
                
                ContentView()
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
            }
        }
    }
}

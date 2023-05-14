//
//  ContentView.swift
//  Jihwaja
//
//  Created by geee3 on 2023/05/02.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: JihwajaStore
    
    var body: some View {
        if store.jihwaja.isFirst == false{
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
            .task{
                do{
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
            
        } else {
            OnboardingView()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

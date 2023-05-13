//
//  ContentView.swift
//  Jihwaja
//
//  Created by geee3 on 2023/05/02.
//

import SwiftUI

struct ContentView: View {
    var isFirst = false
    var isLoading = true
    var body: some View {
        
        
        if isFirst {
            Text("Onboarding")
        } else {
            Text("Main")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  StoreButtonView.swift
//  Jihwaja
//
//  Created by SY AN on 2023/05/04.
//

import SwiftUI

struct StoreButtonView: View {
    var isActive: Bool
    
    var body: some View {
        
            Text("저장하기")
                .foregroundColor(.white)
                .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
                .background(isActive ? Color.green : Color.gray)
                .cornerRadius(15)
                .padding(.top, getWidth() * 0.04)
                .padding(.bottom, getWidth() * 0.1)
    }
}

struct StoreButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StoreButtonView(isActive: false)
    }
}

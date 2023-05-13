//
//  StoreButtonView.swift
//  Jihwaja
//
//  Created by SY AN on 2023/05/04.
//

import SwiftUI

struct StoreButtonView: View {
    // 활성화 시킬건지
    var isActive: Bool
    
    var body: some View {
        //NavigationLink(destination:MainView()){
            Button("저장하기"){
                
            }
            .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
            // 버튼이 활성화되면 초록색, 비활성화되면 회색 배경색
            .background(isActive ? Color("green") : Color("grayButton"))
            .foregroundColor(.white)
            .cornerRadius(10)
            
            .padding(.top, getWidth() * 0.04)
            .padding(.bottom, getWidth() * 0.12)

        }
        // 버튼이 활성화 되어야 MainView로 이동하는 NavigationLink 활성화
    //}
}

struct StoreButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StoreButtonView(isActive: true)
    }
}

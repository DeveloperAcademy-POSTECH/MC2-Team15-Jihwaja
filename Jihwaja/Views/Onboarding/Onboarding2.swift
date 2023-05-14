//
//  Onboarding2.swift
//  Jihwaja
//
//  Created by 안수린 on 2023/05/15.
//

import SwiftUI

struct Onboarding2: View {
    var body: some View {
        VStack {
            
            HStack {
                Text("12개의 카드")
                    .font(.system(size: 21))
                    .fontWeight(.heavy)
                    .padding(.trailing, -8)
                    .padding(.top, getWidth() * 0.18)
                Text("를 눌러 각 질문에 대한")
                .font(.system(size: 21))
                .fontWeight(.semibold)
                .padding(.top, getWidth() * 0.18)
                      }
            
            Text("답을 자유롭게 해주세요.")
            .font(.system(size: 21))
            .fontWeight(.semibold)
            
            Spacer()
            
            Image("iPhoneMain")
                .resizable()
                .frame(width: 200, height: 400)
                .padding(.bottom, getWidth() * 0.03)
            
        }
        .multilineTextAlignment(.center)
    }
}

struct Onboarding2_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding2()
    }
}

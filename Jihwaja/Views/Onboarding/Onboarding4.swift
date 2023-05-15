//
//  Onboarding4.swift
//  Jihwaja
//
//  Created by 안수린 on 2023/05/15.
//

import SwiftUI

struct Onboarding4: View {
    var body: some View {
        VStack {
            
            Text("모든 질문에 답을 완료하면")
            .font(.system(size: 18))
            .fontWeight(.semibold)
            .padding(.top, getWidth() * 0.18)
            
            HStack {
                Text("최종 결과지가 생성")
                    .font(.system(size: 18))
                    .fontWeight(.heavy)
                    .padding(.trailing, -8)
                Text("됩니다!")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                      }
            
            
            
            Image("iPhoneLoad")
                .resizable()
                .frame(width: 200, height: 400)
                .padding(.vertical, getWidth() * 0.03)
            
        }
        .multilineTextAlignment(.center)
    }
}

struct Onboarding4_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding4()
    }
}

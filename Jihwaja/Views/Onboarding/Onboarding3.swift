//
//  Onboarding3.swift
//  Jihwaja
//
//  Created by 안수린 on 2023/05/15.
//

import SwiftUI

struct Onboarding3: View {
    var body: some View {
        VStack {
            
            HStack {
                Text("예시를 보고 게임하듯 답")
                    .font(.system(size: 18))
                    .fontWeight(.heavy)
                    .padding(.trailing, -8)
                    .padding(.top, getWidth() * 0.18)
                Text("을 하다 보면")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(.top, getWidth() * 0.18)
                      }
            
            Text("카드의 그림이 하나 둘 완성될거에요.")
            .font(.system(size: 18))
            .fontWeight(.semibold)
            
           
            
            AnimatedManager(fileName: "onboarding_motion")
                .frame(width: 200, height: 400)
                .padding(.vertical, getWidth() * 0.03)
            
        }
        .multilineTextAlignment(.center)
    }
}

struct Onboarding3_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding3()
    }
}

//
//  Onboarding1.swift
//  Jihwaja
//
//  Created by 안수린 on 2023/05/15.
//

import SwiftUI

struct Onboarding1: View {
    var body: some View {
        VStack {
            
            Text("知 化 自")
                .font(.system(size: 28))
                .fontWeight(.heavy)
                .foregroundColor(Color("grayText"))
                .padding(.top, getWidth() * 0.18)
                .padding(.bottom, getWidth() * 0.001)
            
            
            Text("알 지 / 될 화 / 스스로 자")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .foregroundColor(Color("grayText"))
            
            Spacer()
            Image("SplashImg")
                .resizable()
                .frame(width: getWidth() * 0.2, height: getHeight() * 0.2)
            Spacer()
            
            HStack {
                Text("스스로를 돌아볼 시간")
                    .font(.system(size: 18))
                    .fontWeight(.heavy)
                    .padding(.trailing, -8)
                Text("이 많아진")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
            }
            
            Text("부모님들을 위한 앱입니다.")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(.bottom, getWidth() * 0.05)
            
            Text("질문에 답을 하는 과정을 통해")
                .font(.system(size: 18))
                .fontWeight(.semibold)
            
            HStack {
                Text("나 자신에 대해 더 깊게 이해")
                    .font(.system(size: 18))
                    .fontWeight(.heavy)
                    .padding(.trailing, -8)
                Text("하고")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
            }
            
            Text("행복을 찾아보세요!")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(.bottom, getWidth() * 0.07)
            
        }
        .multilineTextAlignment(.center)
    }
}

struct Onboarding1_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding1()
    }
}

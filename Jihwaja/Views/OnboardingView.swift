//
//  OnboardingView.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selectedTabIndex = 0
    
    var body: some View {
        VStack{
            TabView (){
                Image("OnBoarding1")
                Image("OnBoarding2")
                Image("OnBoarding3")
                Image("OnBoarding4")
                
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            Button(action:{
                
                selectedTabIndex += 1
                print(selectedTabIndex)
            }, label: {
                Text("다음")
                    .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
                // 버튼이 활성화되면 초록색, 비활성화되면 회색 배경색
                    .background(Color("green"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.top, getWidth() * 0.01)
                    .padding(.bottom, getWidth() * 0.04)
            })
            
            Text("건너뛰기")
                .foregroundColor(Color("green"))
                .padding(.bottom, getWidth() * 0.04)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

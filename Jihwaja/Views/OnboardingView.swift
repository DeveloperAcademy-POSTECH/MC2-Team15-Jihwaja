//
//  OnboardingView.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selectedTabIndex = 0
    @Binding var jihwajaData : jihwajaData
    
    var body: some View {
        VStack{
            TabView (selection: $selectedTabIndex){
                Image("OnBoarding1")
                    .tag(0)
                Image("OnBoarding2")
                    .tag(1)
                Image("OnBoarding3")
                    .tag(2)
                Image("OnBoarding4")
                    .tag(3)
                
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            Button(action:{
                if selectedTabIndex != 3 {
                    selectedTabIndex += 1
                    print(selectedTabIndex)
                }
            }, label: {
                Text(selectedTabIndex == 3 ? "시작하기" : "다음")
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
                .opacity(selectedTabIndex == 3 ? 0 : 1)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(jihwajaData:.constant(jihwajaData.emptyData))
    }
}

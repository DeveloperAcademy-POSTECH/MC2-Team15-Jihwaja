//
//  OnboardingView.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

struct OnboardingView: View {
    // 사용자가 화면을 이탈하는지 감시할 변수
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var store: JihwajaStore
    @Binding var isFirstLaunching : Bool
    @State private var selectedTabIndex = 0
    
    var body: some View {
        NavigationView{
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
                    
                    if selectedTabIndex != 3 {
                        Button(action:{
                                selectedTabIndex += 1
                                print(selectedTabIndex)
                            
                        }, label: {
                            Text( "다음")
                                .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
                                .background(Color("green"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.top, getWidth() * 0.01)
                                .padding(.bottom, getWidth() * 0.04)
                        })
                        
                        
                    } else if selectedTabIndex == 3 {
                        NavigationLink(destination: QuestionView01(isFirstLaunching: $isFirstLaunching), label: {
                            Text( "시작하기" )
                                .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
                                .background(Color("green"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.top, getWidth() * 0.01)
                                .padding(.bottom, getWidth() * 0.04)
                        })
                    }
                    
                    NavigationLink(destination: QuestionView01(isFirstLaunching: $isFirstLaunching), label: {
                        Text("건너뛰기")
                            .foregroundColor(Color("green"))
                            .padding(.bottom, getWidth() * 0.04)
                            .opacity(selectedTabIndex == 3 ? 0 : 1)
                    })
                }
        } // NavigationView
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(isFirstLaunching: .constant(true))
    }
}

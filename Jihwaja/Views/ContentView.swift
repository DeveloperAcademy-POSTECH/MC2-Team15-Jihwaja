//
//  ContentView.swift
//  Jihwaja
//
//  Created by geee3 on 2023/05/02.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("_isFirstLaunching") var isFirstLaunching : Bool = true
    @AppStorage("_showModal") var showModal : Bool = true

    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.presentationMode) var presentationMode
    
    let saveAction: ()->Void
    
    @EnvironmentObject var store: JihwajaStore
    var body: some View {
        ZStack{
            if isFirstLaunching == false{
                MainView()
                    .sheet(isPresented: $showModal){
                        VStack{
                            Image(systemName: "minus")
                               .padding(.top, getWidth() * 0.02)
                               .imageScale(.large)
                               .font(Font.title.weight(.heavy))
                               .foregroundColor(Color(UIColor.tertiaryLabel))
                            Spacer()
                            Image("SplashImg")
                                .resizable()
                                .scaledToFit()
                                .frame(height: getHeight() * 0.1)
                            Spacer()
                            
                            Text("첫 번째 답변을 완료해\n화투패가 뒤집혔습니다.\n\n나머지 화투패들도 눌러서\n답변을 완료해보세요!")
                            Button(action: {
                                showModal = false
                                self.presentationMode.wrappedValue.dismiss()
                                
                            }) {
                                Text("확인했습니다")
                                    .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
                                    .background(Color("green"))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.top, getWidth() * 0.06)
                                    .padding(.bottom, getWidth() * 0.08)
                            }
                            
                        }
                        .onDisappear{
                            showModal = false
                        }
                        .presentationDetents([.height(getHeight() * 0.5)])
                        .multilineTextAlignment(.center)
                    }
                    
            
            } else {
                OnboardingView(isFirstLaunching: $isFirstLaunching)
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(saveAction: {})
    }
}

//
//  QuestionView02.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

struct QuestionView02: View {
    @State private var yes = 10.0
    
    var body: some View {
        NavigationView{
            VStack{
                QuestionView(question: "🙋🏻‍♀️곽애숙씨는 지금까지\n 진정으로 원하는 삶을 살았나요?")
                Spacer()
                VStack{
                    Text("네!")  
                        .font(.system(size:(10 * (yes/5))))
                        .foregroundColor(Color("green"))
                }.frame(width: getWidth(), height: getHeight() * 0.4)
                Slider(value: $yes,
                       in: 1...100,
                       step: 1)  
                .accentColor(Color("green"))
                Text("\(Int(yes)) %")
   
                
                StoreButtonView(isActive: true)
            }
            .padding(.horizontal)
        }
    }
}

struct QuestionView02_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView02()
    }
}

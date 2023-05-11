//
//  QuestionView10.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

//import SwiftUI
//
//struct QuestionView10: View {
//
//
//
//    var body: some View {
//        NavigationView{
//            VStack{
//                ScrollView{
//                    // 질문 뷰
//                    QuestionView(question: "💁‍♂️ 두 가지 선택지 중 곽애숙씨가 더 선호하는 취미를 골라주세요")
//
//                    // 답변
//
//                    Spacer()
//                }
//
//                // 저장 버튼
//
//
//
//            }
//
//
//        }
//    }
//}
//
//struct QuestionView10_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionView10()
//    }
//}

    

import SwiftUI

struct QuestionView10: View {
    @State private var selectedCard: Int?
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    selectedCard = 1
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue.opacity(selectedCard == 1 ? 1 : 0.5))
                        Text("Card 1")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
                .frame(width: 100, height: 150)
                
                Button(action: {
                    selectedCard = 2
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(selectedCard == 2 ? 1 : 0.5))
                        Text("Card 2")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
                .frame(width: 100, height: 150)
            }
            
            if let selectedCard = selectedCard {
                if selectedCard == 1 {
                    Text("Card 1 selected")
                } else {
                    Text("Card 2 selected")
                }
            }
        }
    }
}

struct QuestionView10_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView10()
    }
}

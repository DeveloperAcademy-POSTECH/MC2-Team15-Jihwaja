//
//  QuestionView10.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

struct QuestionView10: View {
    
    @State private var selectedCard: Int? = nil
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    // 질문 뷰
                    QuestionView(question: "💁‍♂️ 두 가지 선택지 중 곽애숙씨가 더 선호하는 취미를 골라주세요")
                    
                    // 답변 TextField
//                    if selectedCard == nil {
//                        // Display both cards
//                        HStack {
//                            CardView(imageName: "cardDesign00")
//                                .onTapGesture {
//                                    // Select card 1
//                                    selectedCard = 1
//                                }
//
//                            CardView(imageName: "cardDesign01")
//                                .onTapGesture {
//                                    // Select card 2
//                                    selectedCard = 2
//                                }
//                        }
//                    } else {
//                        // Display the selected card
//                        CardView(imageName: "card\(selectedCard!)")
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            .onTapGesture {
//                                // Deselect the card
//                                selectedCard = nil
//                            }
//                    }
                    HStack {
                        CardView(imageName: "cardDesign00")
                            .opacity(selectedCard == 2 ? 0 : 1)
                            .onTapGesture {
                                // Select card 1
                                selectedCard = 1
                            }
                        
                        CardView(imageName: "cardDesign01")
                            .opacity(selectedCard == 1 ? 0 : 1)
                            .onTapGesture {
                                // Select card 2
                                selectedCard = 2
                            }
                    }
                    .animation(.default)
                    .frame(maxHeight: .infinity)
                    
                    Spacer()
                    
                    if selectedCard != nil {
                        CardView(imageName: "card\(selectedCard!)")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .onTapGesture {
                                selectedCard = nil
                            }
                    }
                    
                    Spacer()
                }
                
                // 저장 버튼
                
               
                
            }
            
        }
    }
}



struct CardView: View {
    
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 300)
            .padding()
    }
}

struct QuestionView10_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView10()
    }
}

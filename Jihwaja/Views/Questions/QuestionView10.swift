//
//  QuestionView10.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//


//struct QuestionView10: View {
//
//
//

//}
//
//struct QuestionView10_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionView10()
//    }
//}

    

//
//  ContentView.swift
//  0511_Home
//
//  Created by Hyungmin Kim on 2023/05/11.
//

import SwiftUI




// edit it later
let IMAGE_WIDTHS: CGFloat = 150
let IMAGE_HEIGHTS: CGFloat = 200


struct QuestionView10: View {
    
    
    @State private var isActiveQ10 = false
    
    // stage 0: 8강
    // stage 1: 4강
    // stage 2: 결승
    // stage 3: 우승
    @State var stage: Int = 0
    // selected card name
    @State var selected: [String]! = []
    // default card list for each stage
    @State var not_cards = ["cardDesign00", "cardDesign01", "cardDesign02", "cardDesign03","cardDesign04", "cardDesign05", "cardDesign06", "cardDesign07", "", ""]
    
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                
                ScrollView {
                    
                    QuestionView(question: "💁‍♂️ 두 가지 선택지 중 곽애숙씨가 더 선호하는 취미를 골라주세요")
                    
                    
                    VStack {
                        Text(stage == 0 ? "8 강" : stage == 1 ? "4강" : stage == 2 ? "결승" : "🥳 우승! 🎉")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(.green)
                        
                        if stage == 3 {
                            HStack() {
                                CardView(imageName: selected[0])
                            }
                            .frame(width: IMAGE_WIDTHS + 50, height: IMAGE_HEIGHTS + 50)
                        }
                        else {
                            
                            HStack() {
                                // left side is cliked
                                Button(action: {
                                    selected.append(not_cards.removeFirst())
                                    not_cards.removeFirst()
                                }) {
                                    CardView(imageName: not_cards[0])
                                }
                                
                                // right side is cliked
                                Button(action: {
                                    selected.append(not_cards.remove(at: 1))
                                    not_cards.removeFirst()
                                    
                                }) {
                                    CardView(imageName: not_cards[1])
                                }
                            }
                        }
                        
                        
                        
                        //            .onChange(of: selected.count, perform: {
                        //                // TODO: selected.count
                        //                // When stage == 0 && count == 4, stage1: 2, stage2: 1
                        //                // 2. stage + 1
                        //                // 3. not_cards = selected, selected = []
                        //                // 4. finish 처리
                        //            })
                        
                        
                    }
                    .padding()
                    
                }
                .onChange(of: selected.count) { newValue in
                    if newValue == 4 {
                        stage += 1
                        not_cards = selected + ["", ""]
                        selected = []
                    }
                    else if newValue == 2 && stage == 1 {
                        stage += 1
                        not_cards = selected + ["", ""]
                        selected = []
                    }
                    else if newValue == 1 && stage == 2 {
                        stage += 1
                    }
                }
                
                StoreButtonView(isActive: isActiveQ10)
            }
        }
    }
    
    
    
}





struct CardView: View {
    var imageName: String
    
    var body: some View {
            Image("\(imageName)")
            .resizable()
            .scaledToFit()
            .mask {
                RoundedRectangle(cornerRadius: 22)
                .frame(width: IMAGE_WIDTHS, height: IMAGE_HEIGHTS)
            }
    }
}

struct Question10_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView10()
    }
}







/*
import SwiftUI

struct Card {
    let name: String
    let image: String
    var quarterFlag: Bool = false
    var semiFlag: Bool = false
    var finalFlag: Bool = false
}

var cards = [
    Card(name: "Card 1", image: "cardDesign00"),
    Card(name: "Card 2", image: "cardDesign01"),
    Card(name: "Card 3", image: "cardDesign02"),
    Card(name: "Card 4", image: "cardDesign03"),
    Card(name: "Card 5", image: "cardDesign04"),
    Card(name: "Card 6", image: "cardDesign05"),
    Card(name: "Card 7", image: "cardDesign06"),
    Card(name: "Card 8", image: "cardDesign07")
]


struct QuestionView10: View {
    @State private var selectedCard: Int?
    
    var body: some View {
        VStack {
            HStack {
                CardView(imageName: "cardDesign00")
                    .opacity(selectedCard == 2 ? 0 : 1)
                    .onTapGesture {
                        // Select card 1
                        selectedCard = 1
                        cards[0].quarterFlag = true
                        print(cards[0].quarterFlag)
                    }
                
                CardView(imageName: "cardDesign01")
                    .opacity(selectedCard == 1 ? 0 : 1)
                    .onTapGesture {
                        // Select card 2
                        selectedCard = 2
                    }
            }
            .animation(.default)
            
            Spacer()
            
            if selectedCard != nil {
                CardView(imageName: "card\(selectedCard!)")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onTapGesture {
                        selectedCard = nil
                    }
            }
            
            
//            if let selectedCard = selectedCard {
//                if selectedCard == 1 {
//                    Text("Card 1 selected")
//                } else {
//                    Text("Card 2 selected")
//                }
//            }
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
*/

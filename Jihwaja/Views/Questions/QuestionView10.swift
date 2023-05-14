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
                                    ImageView(imageName: selected[0])
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
                                    ImageView(imageName: not_cards[0])
                                }
                                
                                // right side is cliked
                                Button(action: {
                                    selected.append(not_cards.remove(at: 1))
                                    not_cards.removeFirst()
                                    
                                }) {
                                    ImageView(imageName: not_cards[1])
                                }
                            }
                        }
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
                .onChange(of: stage) { newValue in
                    if newValue == 3 {
                        isActiveQ10 = true
                    }
                }
                
                StoreButtonView(isActive: isActiveQ10)
                    
            }
        }
    }
    
    
    
}





struct ImageView: View {
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

import SwiftUI


// edit it later
let IMAGE_WIDTHS: CGFloat = 160
let IMAGE_HEIGHTS: CGFloat = 270


struct QuestionView10: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: JihwajaStore
    
    @State private var isActiveQ10 = false
    @State var showModal = true
    
    // stage 0: 8강
    // stage 1: 4강
    // stage 2: 결승
    // stage 3: 우승
    @State var stage: Int = 0
    // selected card name
    @State var selected: [String]! = []
    // default card list for each stage
    @State var not_cards = ["Drawing", "Listening", "Golf", "Cooking","Planting", "Climbing", "Traveling", "Reading", "", ""]
    
    var body: some View {
        
       
        VStack {
            if !store.jihwaja.isCompleted[9] {
                ScrollView {
                    
                    QuestionView(question: "💁‍♂️ 두 가지 선택지 중 \(store.jihwaja.A1)씨가 더 선호하는 취미를 골라주세요")
                    
                    
                    VStack {
                        Text(stage == 0 ? "8 강" : stage == 1 ? "4강" : stage == 2 ? "결승" : "🥳 우승! 🎉")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(.green)
                        
                        if stage == 3 {
                            
                            VStack {
                                HStack() {
                                    ImageView(imageName: selected[0])
                                }
                                .frame(width: IMAGE_WIDTHS, height: IMAGE_HEIGHTS)
                                .padding()
                            }
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
                            .padding()
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
            } else {
                VStack{
                    Text("🥳 우승! 🎉")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.green)
                    
                    HStack() {
                        ImageView(imageName: store.jihwaja.A10)
                    }
                    .frame(width: IMAGE_WIDTHS, height: IMAGE_HEIGHTS)
                }
            }
            
            //저장 버튼
            Button(action: {
                store.jihwaja.A10 = selected[0]
                store.jihwaja.isCompleted[9] = true
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                StoreButtonView(isActive: isActiveQ10)
            })
            .disabled(!isActiveQ10)
            .opacity(store.jihwaja.isCompleted[9] == true ? 0 : 1)
            .sheet(isPresented: store.jihwaja.isCompleted[9] ? .constant(false) : $showModal)
            { HalfModalView(imageName:"Q10_motion",
                            title: "선택지에서 고르기",
                            content: "두 가지 선택지 중에 더 선호하는 취미를 골라주세요!",
                            showModal: $showModal)
                
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

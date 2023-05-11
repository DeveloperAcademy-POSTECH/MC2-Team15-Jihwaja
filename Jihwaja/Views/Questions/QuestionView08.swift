//
//  QuestionView07.swift
//  Jihwaja
//
//  Created by ffffff on 2023/05/02.
//

import SwiftUI
import Foundation

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}

//CardView
struct QuestionView08: View {
    let card: Card
    var removal: (() -> Void)? = nil
    
    @State var travel : String = ""
    @State var isActive : Bool = false
    
    @State private var showModal = true
    @State private var showCard = false
    @State private var offset: CGSize = .zero
    
    var body: some View {
        
        ZStack{
            ScrollView{
                // 질문 뷰
                QuestionView(question: "✈️ 곽애숙씨가 지금 당장\n떠나고 싶은 곳은 어디인가요?")
                
                // 답변 카드 뷰
                
//                ForEach (1..<3){ index in
                    ZStack {
                        if offset.width > getWidth() * 0.001 {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: getWidth() * 0.78, height: getHeight() * 0.5)
                                .foregroundColor(Color("lightGreen"))
                                .shadow(radius: 7)
                        } else if offset.width < -getWidth() * 0.001 {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: getWidth() * 0.78, height: getHeight() * 0.5)
                                .foregroundColor(Color("lightRed"))
                                .shadow(radius: 7)
                        } else {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: getWidth() * 0.78, height: getHeight() * 0.5)
                                .foregroundColor(Color("lightGray"))
                                .shadow(radius: 7)
                        }
                        
                        VStack {
                            Image("test_gif")
                                .resizable()
                                .frame(width: 160, height: 160)
                                .padding(.top, getWidth() * 0.1)
                                .padding(.bottom, getWidth() * 0.25)
                            
                            Text("이집트")
                                .font(.system(size: 24))
                                .fontWeight(.black)
                            
                            //                        if showCard {
                            //
                            //                        }
                        }
                    }
                    .multilineTextAlignment(.center)
                    .rotationEffect(.degrees(Double(offset.width / 5)))
                    .offset(x: offset.width * 5, y: 0)
                    .opacity(2 - Double(abs(offset.width / 50)))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                offset = gesture.translation
                            }
                            .onEnded { _ in
                                if abs(offset.width) > 100 {
                                    removal?()
                                } else {
                                    offset = .zero
                                }
                            }
                    )
                    .onTapGesture {
                        showCard.toggle()
                    }
                    //                .offset(x: offset.width, y: offset.height)
                    //                .gesture(drag)
                    //                .animation(.interactiveSpring(), value: offset)
//                }
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                Button(action:{
                    // MainView 로 넘어가는 코드
                    // 여덟 번째 답변 저장
                }){
                    // name.isEmpty == false 이면 isActive true
                    StoreButtonView(isActive: !travel.isEmpty)
                }
                .sheet(isPresented: self.$showModal) {
                    HalfModalView(imageName: "test_gif", title: "카드 좌우로 밀기", content: "긍정적이면 오른쪽, 부정적이면\n왼쪽으로 카드를 밀어주세요!")
                }
            }
        }
        
        //        func removeCard(at index: Int) {
        //            cards.remove(at: index)
        //        }
        
    }
}

struct CardDumView: View {
    
    @State private var cards = Array<Card>(repeating: Card.example, count: 10)
    
    var body: some View {
        ZStack {
            ForEach(0..<cards.count, id: \.self) { index in
                QuestionView08(card: cards[index]) {
                    withAnimation {
                        //                        removeCard(at: index)
                    }
                }
                .stacked(at: index, in: cards.count)
            }
        }
    }
}

struct Card {
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "who?", answer: "jodie")
}

struct QuestionView08_Previews: PreviewProvider {
    let card: Card
    
    static var previews: some View {
        QuestionView08(card: Card(prompt: "Prompt", answer: "Answer"))
    }
}

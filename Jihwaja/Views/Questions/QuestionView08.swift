//
//  QuestionView07.swift
//  Jihwaja
//
//  Created by ffffff on 2023/05/02.
//

import SwiftUI

struct QuestionView08: View {
    @State private var cards = Array<Card>(repeating: Card.example, count: 10)
    @State private var isActiveQ8 = true
    
    var body: some View {
        ZStack {
            VStack {
                QuestionView(question: "✈️ 곽애숙씨가 지금 당장\n떠나고 싶은 곳은 어디인가요?")
                
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index])
                            .stacked(at: index, in: cards.count)
                    }
                }
                
                Spacer()
                
                StoreButtonView(isActive: isActiveQ8)
            }
        }
    }
}

struct QuestionView08_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView05()
    }
}

struct CardView: View {
    let card: Card
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .frame(width: getWidth() * 0.78, height: getHeight() * 0.45)
                .foregroundColor(Color("lightGray").opacity(1 - Double(abs(offset.width / 50))))
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(offset.width > 0 ? Color("lightGreen") : Color("lightRed")))
                .shadow(color: Color("grayText").opacity(0.3), radius: 6)
            
            VStack {
                Spacer()
                Text("이집트")
                    .padding(.bottom)
            }
        }
        .frame(width: getWidth() * 0.78, height: getHeight() * 0.45)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(DragGesture()
            .onChanged { gesture in
                offset = gesture.translation
            }.onEnded{ _ in
                if abs(offset.width) > 100 {
                    //remove card
                } else {
                    offset = .zero
                }
            })
    }
}
struct Card {
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "제이름은", answer: "애숙애숙")
}
extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 3)
    }
}

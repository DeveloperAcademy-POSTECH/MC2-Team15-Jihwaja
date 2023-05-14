//
//  QuestionView07.swift
//  Jihwaja
//
//  Created by ffffff on 2023/05/02.
//

import SwiftUI

struct QuestionView08: View {
    let country: [String] = ["이집트", "네덜란드", "일본", "서울", "모스크바", "중국", "인도", "스페인"]
    @State private var isActiveQ8 = true
    @State private var result = ""
    
    var body: some View {
        ZStack {
            VStack {
                QuestionView(question: "✈️ 곽애숙씨가 지금 당장\n떠나고 싶은 곳은 어디인가요?")
                
                ZStack {
                    if result == "" {
                        Text("\n지금 당장 떠나고 싶은 곳이 있나요?")
                            .multilineTextAlignment(.center)
                            .frame(width: getWidth() * 0.65)
                            .font(.system(size: 27))
                            .fontWeight(.bold)
                            .foregroundColor(Color("green"))
                    } else if result.last == "본" || result.last == "울" || result.last == "국" || result.last == "인"{
                        Text("\n지금 당장 \(result)으로 떠나보는 것은 어떨까요?")
                            .multilineTextAlignment(.center)
                            .frame(width: getWidth() * 0.65)
                            .font(.system(size: 27))
                            .fontWeight(.bold)
                            .foregroundColor(Color("green"))
                    } else {
                        Text("\n지금 당장 \(result)로 떠나보는 것은 어떨까요?")
                            .multilineTextAlignment(.center)
                            .frame(width: getWidth() * 0.65)
                            .font(.system(size: 27))
                            .fontWeight(.bold)
                            .foregroundColor(Color("green"))
                    }
                    
                    ForEach(0..<8, id: \.self) { index in
                        CardView(result: $result, image: "cardPic0\(index)", country: country[index])
                            .stacked(at: index, in: 8)
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
        QuestionView08()
    }
}

struct CardView: View {
    @State private var offset = CGSize.zero
    @Binding var result: String
    let image: String
    let country: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .frame(width: getWidth() * 0.78, height: getHeight() * 0.45)
                .foregroundColor(Color("lightGray").opacity(1 - Double(abs(offset.width / 50))))
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(offset.width > 0 ? Color("lightGreen") : Color("lightRed")))
                .shadow(color: Color("grayText").opacity(0.3), radius: 6)
            
            Image(image)
                .resizable()
                .frame(width: getWidth() * 0.7, height: getWidth() * 0.93)
            
            Text(country)
                .font(.system(size: 27))
                .fontWeight(.bold)
                .padding(.top, getWidth() * 0.7)
        }
        .frame(width: getWidth() * 0.78, height: getHeight() * 0.45)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(DragGesture()
            .onChanged { gesture in
                offset = gesture.translation
            }.onEnded{ _ in
                if offset.width > 100 {
                    if result == "" {
                        result.append(country)
                    } else {
                        result.append(", \(country)")
                    }
                    // remove card
                } else if offset.width < -100 {
                    // remove card
                } else {
                    offset = .zero
                }
            })
    }
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 3)
    }
}

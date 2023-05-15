//
//  QuestionView07.swift
//  Jihwaja
//
//  Created by ffffff on 2023/05/02.
//

import SwiftUI

struct QuestionView08: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: JihwajaStore
    
    let country: [String] = ["이집트", "네덜란드", "일본", "서울", "모스크바", "중국", "인도", "스페인"]
    @State private var isActiveQ8 = true
    @State private var result = ""
    @State var showModal = true
    
    var body: some View {
        ZStack {
            VStack {
                QuestionView(question: "✈️ \(store.jihwaja.A1)씨가 지금 당장\n떠나고 싶은 곳은 어디인가요?")
                
                if store.jihwaja.isCompleted[7] {
                    Text("\n지금 당장 \(result)로 떠나보는 것은 어떨까요?")
                        .multilineTextAlignment(.center)
                        .frame(width: getWidth() * 0.65)
                        .font(.system(size: 27))
                        .fontWeight(.bold)
                        .foregroundColor(Color("green"))
                    
                } else {
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
            }
                Spacer()
                
                // 저장 버튼
                Button(action: {
                    store.jihwaja.A8 = result
                    store.jihwaja.isCompleted[7] = true
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    StoreButtonView(isActive: isActiveQ8)
                })
                .opacity(store.jihwaja.isCompleted[7] ? 0 : 1)
            }
        }.sheet(isPresented: store.jihwaja.isCompleted[7] ? .constant(false) : $showModal)
        { HalfModalView(imageName:"Q8_motion",
                       title: "카드 좌우로 밀기",
                        content: "긍정적이면 오른쪽, 부정적이면 왼쪽으로 카드를 밀어주세요!",
                        showModal: $showModal)
        }
        
        .onAppear{
            result = store.jihwaja.A8
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
        .gesture(DragGesture(minimumDistance: 0.05)
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
                
            }
            
        )
    }
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 3)
    }
}

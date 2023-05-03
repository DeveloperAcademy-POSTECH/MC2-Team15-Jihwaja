//
//  MainView.swift
//  Jihwaja
//
//  Created by ffffff on 2023/05/02.
//

import SwiftUI

struct MainView: View {
    @State var isMoving: [String] = Array(repeating: "", count: 12)
    @State var isPlaying = true
    
    var body: some View {
        VStack {
            HStack {
                Text("곽애숙님, 반가워요!")
                    .font(.title)
                    .foregroundColor(.gray)
                Spacer()
            }.padding(.top, getWidth() * 0.18)
            
            HStack {
                Text("카드를 골라 질문을 선택해 주세요 :)")
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
            }.padding(.bottom, getWidth() * 0.05)
            Spacer()
            
            VStack {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                    ForEach(0..<12, id: \.self) { index in
                        ZStack {
                            Image("background")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.23, height: getWidth() * 0.29)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            Image("cardDesign\(String(format: "%02d", index))")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.18, height: getWidth() * 0.24)
                                .cornerRadius(7)
                                .flipped()
                                .opacity(isMoving[index] != "" ? 1 : 0)
                        }
                        .rotation3DEffect(.init(degrees: isMoving[index] != "" ? 180 : 0), axis: (x: 0.0, y: 1.0, z: 0.0), anchor: .center, anchorZ: 0.0, perspective: 0.2)
                        .onTapGesture(perform: { withAnimation(Animation.easeInOut(duration: 0.5)) {
                            if isMoving[index] == "" { isMoving[index] = "." }
                        }})
                    }
                }
            }
            
            Button {} label: {
                Image(systemName: "lock.fill")
                    .foregroundColor(.white)
                    .frame(width: getWidth() * 0.78, height: getWidth() * 0.12)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            .padding(.top, getWidth() * 0.04)
            .padding(.bottom, getWidth() * 0.12)
        }.frame(width: getWidth() * 0.76)
    }
    
    func getWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension View {
    func flipped(_ axis: Axis = .horizontal, anchor: UnitPoint = .center) -> some View {
        switch axis {
        case .horizontal:
            return scaleEffect(CGSize(width: -1, height: 1), anchor: anchor)
        case .vertical:
            return scaleEffect(CGSize(width: 1, height: -1), anchor: anchor)
        }
    }
}

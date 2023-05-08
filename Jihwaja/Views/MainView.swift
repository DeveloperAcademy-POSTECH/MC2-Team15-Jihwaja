//
//  MainView.swift
//  Jihwaja
//
//  Created by ffffff on 2023/05/02.
//

import SwiftUI

struct MainView: View {
    // UserDefaults의 _isFlipped isFlipped에 저장
    @State var isFlipped = UserDefaults.standard.array(forKey: "_isFlipped") as! [Bool]
    
    @State var isActive = false
    
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
                                .opacity(isFlipped[index] != false ? 1 : 0)
                        }
                        .rotation3DEffect(.init(degrees: isFlipped[index] != false ? 180 : 0), axis: (x: 0.0, y: 1.0, z: 0.0), anchor: .center, anchorZ: 0.0, perspective: 0.2)
                        .onTapGesture(perform: { withAnimation(Animation.easeInOut(duration: 0.5)) {
                            if isFlipped[index] == false {
                                // 카드가 아직 뒤집히지 않았을 경우
                                isFlipped[index] = true
                                // isFlipped를 뒤집힌 상태로 변경
                                UserDefaults.standard.set(isFlipped, forKey: "_isFlipped")
                                // UserDefaults 업데이트
                            }
                        }})
                    }
                }
            }
            Button("아직 11개의 질문이 남아있어요"){
                
            }
            .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
            // 버튼이 활성화되면 초록색, 비활성화되면 회색 배경색
            .background(isActive ? Color("green") : Color("grayButton"))
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.top, getWidth() * 0.04)
            .padding(.bottom, getWidth() * 0.12)
        }
        .frame(width: getWidth() * 0.76)
        .navigationBarHidden(true)

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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(isFlipped: [true, true, false, false, false, true, false, false, false, true, false, false])
    }
}

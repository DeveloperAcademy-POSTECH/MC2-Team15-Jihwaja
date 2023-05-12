//
//  QuestionView03.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

struct QuestionView03: View {

    @State var isActiveQ3 = false
    @State var position = CGPoint(x: 50, y: 50)
    @State var values = ["건강", "노후", "관계", "여가","자아", "직업", "자녀", "도전", "봉사"]
    let rows = 3
    let cols = 3
    
//    @State private var positions = Array(repeating: CGPoint.zero, count: 9)
    @State private var positions = Array(repeating: CGPoint(x: 50, y: 40), count: 9)
    

    private func dragGesture(index: Int) -> some Gesture {
           DragGesture()
               .onChanged { value in
                   positions[index] = value.location
                                  }
               .onEnded { value in
                   positions[index] = value.location
                   isActiveQ3 = true
               }
       }

    var body: some View {
   
        VStack{
        
            QuestionView(question: "☝️ 곽애숙씨에게 가장 중요한\n5가지 가치는 무엇인가요?")
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("green"))
                .opacity(0.1)
                .frame(width: getWidth() * 0.78, height: getHeight() * 0.2)
           
            Spacer()
        
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                .stroke(Color("grayText"))
                .background(Color.white)
                .frame(width: getWidth() * 0.78, height: getHeight() * 0.3)
                
                .overlay{
                    VStack{
                        ForEach(0 ..< rows) { rowIndex in
                            HStack{
                                ForEach(0 ..< cols){ colIndex in
                                    let index: Int = rowIndex * 3 + colIndex
                                    //백그라운드 색상 변경의 기준 위치를 정해주는 변수
                                    let num: Int = -85 * rowIndex - 40
                                    let text = values[index]
                                    Text(text)
                                        .padding()
                                        .background{
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(Int(positions[index].y) < num
                                                      ?  Color("green") : Color("lightGray"))
                                        }
                                        .position(positions[index])
                                        .gesture(dragGesture(index: index))
                                        .onChange(of: positions[index].y) { value in
                                            print("Y position: \(positions[index].y)")
                                                    }
                                            
                                               
                                            }
                                    }
                                }
                            }
                        //Text("\(getHeight() * 0.1)")
                    }
                }
                Spacer()
                
                StoreButtonView(isActive: isActiveQ3)
            }//VStack
        .padding(.horizontal, getWidth()*0.05)
    } // body
} // View



struct QuestionView03_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView03()
    }
}

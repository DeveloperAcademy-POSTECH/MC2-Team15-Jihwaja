//
//  QuestionView03.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

struct QuestionView03: View {
    
    // 버튼 활성화를 위한 변수
    @State private var isActiveQ3 = false
    
    // 버튼에 줄 텍스트
    @State private var values = ["건강", "노후", "관계", "여가","자아", "직업", "자녀", "도전", "봉사"]
    
    // 버튼의 위치 저장할 배열
    @State private var positions = Array(repeating: CGPoint(x: 50, y: 40), count: 9)
    
    // 올라갔는지 여부를 저장할 배열
    @State private var isInGreen : [Bool] = Array(repeating: false, count: 9)
    
    // 배열의 열, 행 개수
    let rows = 3
    let cols = 3
    
    // 전체 너비와 높이
    let width = ceil(getWidth())
    let height = ceil(getHeight())
    
    // 올라간 버튼의 개수를 저장할 변수
    @State var isGreen = 0
    
    // 색을 바꿀 Y 좌표의 기준 값
    var colorYStandard : CGFloat {height * 0.1}
    
    // Row 값에 따라 줄 변수
    var colorYOffset : CGFloat {height * 0.047}
    
    // 드래그 제스쳐 정의
    private func dragGesture(row: Int, col: Int) -> some Gesture {
        DragGesture()
            .onChanged { value in
                // 5개가 올라가지 않았으면
                if isInGreen[row * 3 + col] == true || isGreen < 5 {
                    
                    // 배열에서 올라가있는 버튼의 개수를 저장
                    isGreen = isInGreen.filter { $0 == true }.count
                    
                    // 각 텍스트가 갈 수 있는 바운더리 x, y 값
                    let minX = width * 0.1 - width * 0.25 * CGFloat(col)
                    let maxX = width * 0.68 - width * 0.25 * CGFloat(col)
                    
                    let minY = -height * 0.18 - height * 0.1 * CGFloat(row)
                    let maxY = (height * 0.26 - height * 0.1 * CGFloat(row))
                    
                    // 드래그 해서 위치 변경
                    positions[row * 3 + col].x = min(max(minX ,value.location.x), maxX)
                    positions[row * 3 + col].y = min(max(minY,value.location.y), maxY)
                }
            }
            .onEnded { value in
                
                // 옮겨진 텍스트의 위치가 초록색 영역이면
                if positions[row * 3 + col].y < -colorYStandard * CGFloat(row) - colorYOffset{
                    // true
                    isInGreen[row * 3 + col] = true
                } else {
                    //false
                    isInGreen[row * 3 + col] = false
                }
                
                // 5개가 올라갔으면 버튼 활성화
                if isGreen >= 5 {
                    isActiveQ3 = true
                }
            }
    }
    
    var body: some View {
        
        VStack{
            // 질문
            QuestionView(question: "☝️ 곽애숙씨에게 가장 중요한\n5가지 가치는 무엇인가요?")
            // 초록색 영역
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("green"))
                .opacity(0.1)
                .frame(width: getWidth() * 0.78, height: getHeight() * 0.2)
            
            Spacer()
            
            // 답변 영역
            ZStack{
                // 사각형 바운더리
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("grayText"))
                    .background(Color.white)
                    .frame(width: getWidth() * 0.78, height: getHeight() * 0.3)
                    // 텍스트 3x3 배열
                    .overlay{
                        VStack{
                            ForEach(0 ..< rows) { rowIndex in
                                HStack{
                                    ForEach(0 ..< cols){ colIndex in
                                        let index: Int = rowIndex * 3 + colIndex
                                        //백그라운드 색상 변경의 기준 위치를 정해주는 변수
                                        let num = -colorYStandard * CGFloat(rowIndex) - colorYOffset
                                        let text = values[index]
                                        
                                        Text(text)
                                            .padding()
                                            .background{
                                                RoundedRectangle(cornerRadius: 15)
                                                // y값이 기준값 위면 색상 변경
                                                    .fill(positions[index].y < num
                                                          ?  Color("green") : Color("lightGray"))
                                                
                                            }
                                            .position(positions[index])
                                            .gesture(dragGesture(row: rowIndex, col:colIndex))
                                    }
                                    
                                }
                            }
                        }
                    }
            }
            Spacer()
            // 저장 버튼
            StoreButtonView(isActive: isActiveQ3)
        }
    }
}



struct QuestionView03_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView03()
    }
}

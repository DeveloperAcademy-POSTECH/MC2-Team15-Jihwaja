//
//  QuestionView06.swift
//  Jihwaja
//
//  Created by ffffff on 2023/05/02.
//

import SwiftUI
import Foundation

struct QuestionView06 : View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: JihwajaStore
    
    @State var isShowingEraseView = false
    @State var showModal = true
    @State var isActive = false
    
    @State var habit : String = ""
    @State private var lines = [Line]()
    @State private var deletedLines = [Line]()
    
    var body : some View {
        if isShowingEraseView == true || store.jihwaja.isCompleted[5] == true {
            VStack{
                QuestionView(question: "⚒️ \(store.jihwaja.A1)씨의 습관이\n고쳐지길 바라면서 지워주세요")
                EraseView(lines: $lines)
                
                Button(action:{
                    store.jihwaja.A6L = lines
                    store.jihwaja.isCompleted[5] = true
                    self.presentationMode.wrappedValue.dismiss()
                    
                }) {
                    // lines.isEmpty == false 이면 isActive true
                    StoreButtonView(isActive: !lines.isEmpty)
                }.opacity(store.jihwaja.isCompleted[5] ? 0 : 1)
            }
            .onAppear{
                lines = store.jihwaja.A6L
            }
            .sheet(isPresented: store.jihwaja.isCompleted[5] ? .constant(false) : $showModal)
            { HalfModalView(imageName:"Q6_motion",
                            title: "힘껏 문지르기",
                            content: "글씨를 문질러서 지워주세요",
                            showModal: $showModal)
            }
            
            
        } else if isShowingEraseView == false {
            VStack {
               
                    // 질문 뷰
                    QuestionView(question: "⚒️ \(store.jihwaja.A1)씨가 고치고 싶은\n습관을 적어주세요!")
                    
                    // 답변 TextEditor
                    TextEditor(text: $habit)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .cornerRadius(15)
                        .frame(width: getWidth() * 0.78, height: getHeight() * 0.15)
                    
                    Spacer()
                }
                
                // 저장 버튼
                Button(action:{
                    store.jihwaja.A6 = habit
                    isShowingEraseView.toggle()
                }) {
                        // habit이 비어있지 않으면 isActive true
                        StoreButtonView(isActive: !habit.isEmpty )
                
            } // Vstack
            .onAppear {
                habit = store.jihwaja.A6
                if !store.jihwaja.isCompleted[5] {
                    habit = ""
                }
                // View가 로드될 때 키보드를 자동으로 띄워줌
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
                }
            }
            
            .onTapGesture {
                // 키보드 외 영역 터치 시 키보드를 내리도록 함
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        } // else
    } // body
} // View


struct EraseView: View {
    
    @State var isActive : Bool = false
    @EnvironmentObject var store: JihwajaStore
    
    @Binding var lines : [Line]
    @State private var deletedLines = [Line]()
    @State private var brushColor: Color = .white
    @State private var brushWidth: CGFloat = 30
    
    var body: some View {
        
        VStack {
            ScrollView {
                
                ZStack{
                    Text("\(store.jihwaja.A6)")
                        .frame(width: getWidth() * 0.78, height: getHeight() * 0.5)
                        .font(.system(size: 38))
                        .fontWeight(.black)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("green"))
                    
                    // DrawingShape 호출
                    ForEach(lines) { line in
                        DrawingShape(points: line.points)
                            .stroke(line.color, style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round, lineJoin: .round))
                    }
                }.frame(width: getWidth(), height: getHeight()/2)
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
                    let newPoint = value.location
                    if value.translation.width + value.translation.height == 0 {
                        lines.append(Line(points: [newPoint], color: brushColor, lineWidth: brushWidth))
                    } else {
                        let index = lines.count - 1
                        lines[index].points.append(newPoint)
                    }
                }).onEnded({ value in
                    if let lastLine = lines.last?.points, lastLine.isEmpty { lines.removeLast() }
                }))
                .disabled(store.jihwaja.isCompleted[5])
            }
            .scrollDisabled(true)
        }
    }
}

struct QuestionView06_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView06()
    }
}

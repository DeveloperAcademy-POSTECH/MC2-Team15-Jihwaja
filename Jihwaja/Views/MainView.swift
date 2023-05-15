//
//  MainView.swift
//  Jihwaja
//
//  Created by ffffff on 2023/05/02.
//
 
import SwiftUI

struct MainView: View {

    @Environment(\.presentationMode) var presentationMode
    
    // 사용자가 화면을 이탈하는지 감시할 변수
    
    
    // 앱 내에서 계속 읽고 쓸 데이터 원본 from JihwajaApp.swift
    @EnvironmentObject var store: JihwajaStore
    
    @State var isReportViewShowing : Bool = false
    
    var body: some View {
        
        let remainingQ = 12 - store.jihwaja.isCompleted.filter { $0 }.count

        
        NavigationView{
            VStack {
                
                //문구
                HStack {
                    Text(store.jihwaja.A1)
                        .font(.title)
                    Text("님, 반가워요!")
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
                
                
                // 화투패 12개
                VStack {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                        // 각 카드들
                        ForEach(0..<12, id: \.self) { index in
                            
                            NavigationLink(
                                destination: self.destinationView(for: index + 1),
                                label: {
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
                                            .opacity(store.jihwaja.isFlipped[index] ? 1 : 0)
                                    }
                                    .onAppear{
                                        if store.jihwaja.isCompleted[index] == true && store.jihwaja.isFlipped[index] == false {
                                            withAnimation(Animation.easeInOut(duration: 0.5)){
                                                store.jihwaja.isFlipped[index] = true
                                            }
                                        }
                                    }
                                    .rotation3DEffect(.init(degrees: store.jihwaja.isFlipped[index] != false ? 180 : 0), axis: (x: 0.0, y: 1.0, z: 0.0), anchor: .center, anchorZ: 0.0, perspective: 0.2)
                                }
                            )
                        } // ForEach
                    }
                }
                
                // 결과 버튼
                NavigationLink(destination: ReportView(), isActive: $isReportViewShowing){
                    Button(remainingQ == 0 ? "축하합니다! 결과를 보러 가 볼까요?" : "아직 \(remainingQ)개의 질문이 남아있어요!"){
                        isReportViewShowing.toggle()
                    }
                    .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
                    .background(remainingQ == 0 ? Color("green") : Color("grayButton"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.top, getWidth() * 0.04)
                    .padding(.bottom, getWidth() * 0.12)
                }.disabled(remainingQ != 0)
            } //VStack
            .frame(width: getWidth() * 0.76)
        } .tint(Color("green"))//NavigationView
    } // Body
    

    func destinationView(for qnum: Int) -> some View {
        switch qnum {
        case 1:
            return AnyView(QuestionView01(isFirstLaunching:.constant(false)))
        case 2:
            return AnyView(QuestionView02())
        case 3:
            return AnyView(QuestionView03())
        case 4:
            return AnyView(QuestionView04())
        case 5:
            return AnyView(QuestionView05())
        case 6:
            return AnyView(QuestionView06())
        case 7:
            return AnyView(QuestionView07())
        case 8:
            return AnyView(QuestionView08())
        case 9:
            return AnyView(QuestionView09())
        case 10:
            return AnyView(QuestionView10())
        case 11:
            return AnyView(QuestionView11())
        case 12:
            return AnyView(QuestionView12())
        default:
            return AnyView(EmptyView())
        }
    }
} // View

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
        MainView()
    }
}


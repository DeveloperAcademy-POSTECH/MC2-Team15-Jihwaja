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
    @Environment(\.scenePhase) private var scenePhase
    
    // 앱 내에서 계속 읽고 쓸 데이터 원본 from JihwajaApp.swift
    @Binding var jihwajaData : jihwajaData
    
    let saveAction: ()->Void
    
    var body: some View {
        
        var remainingQ = 12 - jihwajaData.isCompleted.filter { $0 }.count
        
        NavigationView{
            VStack {
                
                //문구
                HStack {
                    Text(jihwajaData.A1)
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
                                            .opacity(jihwajaData.isFlipped[index] != false ? 1 : 0)
                                    }
                                    .rotation3DEffect(.init(degrees: jihwajaData.isFlipped[index] != false ? 180 : 0), axis: (x: 0.0, y: 1.0, z: 0.0), anchor: .center, anchorZ: 0.0, perspective: 0.2)
//                                    .onTapGesture(perform: {
//                                        print(index + 1)
//                                        withAnimation(Animation.easeInOut(duration: 0.5)) {
//                                                                if isFlipped[index] == false {
//                                                                    // 카드가 아직 뒤집히지 않았을 경우
//                                                                    isFlipped[index] = true
//                                                                    // isFlipped를 뒤집힌 상태로 변경
//                                                                   
//                                                                }
//                                                            }})
                                    
                                }
                            )
                            
                        } // ForEach
                    }
                }
                
                // 결과 버튼
                Button(remainingQ == 0 ? "결과 보러가기" : "아직 \(remainingQ)개의 질문이 남아있어요"){
                    
                }
                .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
                .background(remainingQ == 0 ? Color("green") : Color("grayButton"))
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.top, getWidth() * 0.04)
                .padding(.bottom, getWidth() * 0.12)
                
            } //VStack
            .frame(width: getWidth() * 0.76)
            .onChange(of: scenePhase) { phase in
                        if phase == .inactive { saveAction() }
                    }
            
        } //NavigationView
    } // Body
    

    func destinationView(for qnum: Int) -> some View {
        switch qnum {
        case 1:
            return AnyView(NavigationView {QuestionView01(jihwajaData:$jihwajaData)})
        case 2:
            return AnyView(NavigationView {QuestionView02(jihwajaData:$jihwajaData)})
        case 3:
            return AnyView(NavigationView {QuestionView03(jihwajaData:$jihwajaData)})
        case 4:
            return AnyView(NavigationView {QuestionView04(jihwajaData:$jihwajaData)})
        case 5:
            return AnyView(NavigationView {QuestionView05(jihwajaData:$jihwajaData)})
        case 6:
            return AnyView(NavigationView {QuestionView06(jihwajaData:$jihwajaData)})
        case 7:
            return AnyView(NavigationView {QuestionView07(jihwajaData:$jihwajaData)})
        case 8:
            return AnyView(QuestionView08())
        case 9:
            return AnyView(NavigationView {QuestionView09(jihwajaData:$jihwajaData)})
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
        MainView(jihwajaData:.constant(jihwajaData.emptyData), saveAction: {})
    }
}

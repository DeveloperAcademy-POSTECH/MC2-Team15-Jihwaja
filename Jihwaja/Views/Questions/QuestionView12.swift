//
//  QuestionView12.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI


// Q12 1st View
struct QuestionView12: View {
    @EnvironmentObject var store: JihwajaStore
    @Environment(\.presentationMode) var presentationMode
    
    @State private var items: [String] = ["", "", "", ""]
    @State private var showSecondView = false
    
    
    var body: some View {
        NavigationView{
            VStack{
                QuestionView(question: "😎 주변에서 \(store.jihwaja.A1)씨를 부를 때 사용하는 호칭들을 작성해주세요!")
                Spacer()
                
                List {
                    ForEach(items.indices, id: \.self) { index in
                        TextField("호칭 \(index+1)", text: $items[index])
                            .background(Color.clear)
                    }
                }
                //                .listStyle(InsetGroupedListStyle())
                
                
                NavigationLink(destination: QuestionView12Second(items: $items), isActive: $showSecondView) {
                    Button {
                        store.jihwaja.A12S = items
                        showSecondView.toggle()
                    } label: {
                        Text("작성완료")
                            .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
                        // 버튼이 활성화되면 초록색, 비활성화되면 회색 배경색
                            .background(items.allSatisfy { !$0.isEmpty } ? Color("green") : Color("grayButton"))
                            .accentColor(.white)
                            .cornerRadius(10)
                            .padding(.top, getWidth() * 0.04)
                            .padding(.bottom, getWidth() * 0.08)
                            .disabled(!items.allSatisfy { !$0.isEmpty })
                    }
                }
            }
            .padding(.horizontal)
            
            .onAppear {
                // View가 로드될 때 키보드를 자동으로 띄워줌
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
                }
            }
            
            .onTapGesture {
                // 키보드 외 영역 터치 시 키보드를 내리도록 함
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
}

// Q12 2nd 뷰
struct QuestionView12Second: View {
    @EnvironmentObject var store: JihwajaStore
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isActiveQ12 = true
    
    @Binding var items: [String]
    @State private var isLiked: [Bool] = [false, false, false, false]
    
    var body: some View {
        NavigationView {
            VStack{
                QuestionView(question: "😎 앞으로도 \(store.jihwaja.A1)씨가 불려지고 싶은 호칭을 선택해주세요!")
                Spacer()
                
                List {
                    ForEach(items.indices, id: \.self){ index in
                        HStack {
                            TextField("호칭 \(index+1)", text: $items[index])
                                .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                isLiked[index].toggle()
                            }) {
                                Image(systemName: isLiked[index] ? "heart.fill" : "heart")
                                    .foregroundColor(isLiked[index] ? .red : .gray)
                            }.disabled(store.jihwaja.isCompleted[11])
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                
                Button(action: {
                    store.jihwaja.A12B = isLiked
                    store.jihwaja.isCompleted[11] = true
                    self.presentationMode.wrappedValue.dismiss()
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    StoreButtonView(isActive: isActiveQ12)
                }).disabled(!isActiveQ12)
                    .opacity(store.jihwaja.isCompleted[11] == true ? 0: 1)
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            isLiked = store.jihwaja.A12B
        }
    }
}



struct QuestionView12_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView12()
    }
}


//
//  QuestionView12.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

struct QuestionView12: View{
    @EnvironmentObject var store: JihwajaStore
    @Environment(\.presentationMode) var presentationMode
    @State private var showSecondView = false
    @State private var items: [String] = ["", "", "", ""]
    @State private var isLiked: [Bool] = [false, false, false, false]
    @State private var isActiveQ12 = true
    
    var body : some View {
        if store.jihwaja.isCompleted[11] == false && showSecondView == false {
            VStack{
                QuestionView(question: "😎 주변에서 \(store.jihwaja.A1)씨를 어떻게 부르나요?\n그 호칭들을 적어주세요!")
                
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("gray"), lineWidth: 2)
                    .foregroundColor(.clear)
                    .frame(width: getWidth() * 0.75, height: getHeight() * 0.225)
                    .overlay{
                        List {
                            ForEach(items.indices, id: \.self) { index in
                                TextField("호칭 \(index+1)", text: $items[index])
                                    .background(Color.clear)
                                    
                            }
                            
                        }.scrollContentBackground(.hidden)
                            .padding(.top, -getHeight()*0.03)
                            Spacer()
                    }
                Spacer()
            
                    Button {
                        store.jihwaja.A12S = items
                        showSecondView.toggle()
                    } label: {
                        Text("작성완료")
                            .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
                        // 버튼이 활성화되면 초록색, 비활성화되면 회색 배경색
                            .background(items.allSatisfy { !$0.isEmpty } ? Color("green") : Color("grayButton"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.top, getWidth() * 0.04)
                            .padding(.bottom, getWidth() * 0.08)
                            
                    }
                    .disabled(!items.allSatisfy { !$0.isEmpty })
                
            }
           
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
            
        } else if store.jihwaja.isCompleted[11] == true || showSecondView == true {
            VStack{
                QuestionView(question: "😎 앞으로도 \(store.jihwaja.A1)씨가 듣고 싶은 호칭을 모두 선택해주세요!")
                
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("gray"), lineWidth: 2)
                    .foregroundColor(.clear)
                    .frame(width: getWidth() * 0.75, height: getHeight() * 0.225)
                    .overlay{
                        List {
                            ForEach(items.indices, id: \.self) { index in
                                HStack {
                                    Text("\(items[index])")
                                    Spacer()
                                    
                                    Button(action: {
                                        isLiked[index].toggle()
                                    }) {
                                        Image(systemName: isLiked[index] ? "heart.fill" : "heart")
                                            .foregroundColor(isLiked[index] ? .red : .gray)
                                    }.disabled(store.jihwaja.isCompleted[11])
                                }
                                    
                            }
                            
                        }.scrollContentBackground(.hidden)
                            .padding(.top, -getHeight()*0.03)
                    }
                Spacer()
                
                
                Button(action: {
                    store.jihwaja.A12B = isLiked
                    store.jihwaja.isCompleted[11] = true
                    self.presentationMode.wrappedValue.dismiss()
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    StoreButtonView(isActive: isActiveQ12)
                }).disabled(!isActiveQ12)
                    .opacity(store.jihwaja.isCompleted[11] == true ? 0: 1)
                
                
            }.onAppear{
                items = store.jihwaja.A12S
                isLiked = store.jihwaja.A12B
            }
            
        }
    }
}



// Q12 1st View
struct QuestionView12First: View {
    @EnvironmentObject var store: JihwajaStore
    @Environment(\.presentationMode) var presentationMode
    
    @State private var items: [String] = ["", "", "", ""]
    @State private var showSecondView = false
    
    var body: some View {
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

// Q12 2nd View
struct QuestionView12Second: View {
    @EnvironmentObject var store: JihwajaStore
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isActiveQ12 = true

    
    @Binding var items: [String]
    @State private var isLiked: [Bool] = [false, false, false, false]
    
    var body: some View {
            VStack{
                QuestionView(question: "😎 앞으로도 \(store.jihwaja.A1)씨가 불려지고 싶은 호칭을 선택해주세요!")
                Spacer()
                
                List {
                    ForEach(items.indices, id: \.self){ index in
                        HStack {
                            Text("호칭 \(items[index])")
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


//
//  FinalView.swift
//  Jihwaja
//
//  Created by SY AN on 2023/05/17.
//

import SwiftUI

struct FinalView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: JihwajaStore
    
    @Binding var isFirstLaunching : Bool
    var body: some View {
        VStack{
            ProfileView()
            
//                ZStack{
//                    Circle()
//                        .stroke(Color("green"), lineWidth: 3)
//                        .frame(width: getWidth() * 0.3, height: getWidth() * 0.3)
//                    Image("SplashImg")
//                        .resizable()
//                        .frame(width: getWidth() * 0.1, height: getHeight() * 0.1)
//                }
//                .padding(.vertical)
                
            Group{
                HStack{
                    Text("\(store.jihwaja.A1)")
                        .fontWeight(.bold)
                        .font(.title)
                    Text("님의 답변 모아보기")
                        .font(.title)
                    Spacer()
                }
                .padding(.vertical)
                
                //Q2
                HStack{
                    ZStack {
                        Image("background")
                            .resizable()
                            .scaledToFill()
                            .frame(width: getWidth() * 0.08, height: getWidth() * 0.1)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        
                        
                        Image("cardDesign01")
                            .resizable()
                            .scaledToFill()
                            .frame(width: getWidth() * 0.06, height: getWidth() * 0.08)
                            .cornerRadius(7)
                    }
                    
                    Text("\(store.jihwaja.A1)씨는 지금까지\n진정으로 원하는 삶을 살았나요?")
                    
                    Spacer()
                }
                
                Text("네!")
                    .font(.system(size:(10 * (store.jihwaja.A2/5))))
                    .foregroundColor(Color("green"))
                    .padding(.bottom, 20)
                
                //Q3
                Group{
//                    HStack{
//                        ZStack {
//                            Image("background")
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: getWidth() * 0.08, height: getWidth() * 0.1)
//                                .cornerRadius(10)
//                                .shadow(radius: 5)
//
//
//                            Image("cardDesign02")
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: getWidth() * 0.06, height: getWidth() * 0.08)
//                                .cornerRadius(7)
//                        }
//
//                        Text("\(store.jihwaja.A1)씨에게\n가장 중요한 5가지 가치는")
//                        Spacer()
//                    }
                    FinalQ3()
                }
                .padding(.bottom, 20)
                
                //Q4
                Group{
                    HStack{
                        ZStack {
                            Image("background")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.08, height: getWidth() * 0.1)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            
                            Image("cardDesign03")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.06, height: getWidth() * 0.08)
                                .cornerRadius(7)
                        }
                        Text("\(store.jihwaja.A1)씨가 훗날 기억되길 원하는 문구는")
                        Spacer()
                    }
                    Image("gravestone")
                        .overlay {
                            // 이미지의 크기에 맞춰 비율로 TextEditor 조정
                            GeometryReader{ geometry in
                                TextEditor(
                                    text: $store.jihwaja.A4
                                )
                                
                                .padding(.top, geometry.size.height * 0.1)
                                .scrollContentBackground(.hidden)
                                .multilineTextAlignment(.center)
                                .frame(width: geometry.size.width * 0.7, height: geometry.size.height/2, alignment: .center)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .disabled(store.jihwaja.isCompleted[3])
                            }
                        }
                        .padding()
                }.padding(.bottom, 20)
                
                //Q5
                Group{
                    HStack{
                        ZStack {
                            Image("background")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.08, height: getWidth() * 0.1)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            
                            Image("cardDesign04")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.06, height: getWidth() * 0.08)
                                .cornerRadius(7)
                        }
                        Text("지금 \(store.jihwaja.A1)씨가 느끼고 있는 행복의 크기는")
                        Spacer()
                    }
                    ZStack{
                        
                        // 작은 원
                        Circle()
                            // scale 값에 따라 크기 변경됨
                            .frame(width:getWidth() * 0.2 * store.jihwaja.A5)
                            .foregroundColor(Color("green"))
                        
                        // % 텍스트
                        Text("\(Int(store.jihwaja.A5 * 25))")
                                        .padding()
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                        
                        
                        // 큰 원
                        Circle()
                            .foregroundColor(Color("green"))
                            .opacity(0.1)
                            .frame(width: getWidth() * 0.8)
                            // 확대 축소 제스쳐
                            .gesture(!store.jihwaja.isCompleted[4] ?
                                    MagnificationGesture().onChanged { value in
                                        store.jihwaja.A5 = min(value, 4.0)
                                        
                                    } : nil)
                    }
                }
                
            }.padding(.bottom, 20)
            
            Group{
                Group{
                    //Q6
                    HStack{
                        ZStack {
                            Image("background")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.08, height: getWidth() * 0.1)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            
                            Image("cardDesign05")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.06, height: getWidth() * 0.08)
                                .cornerRadius(7)
                        }
                        Text("\(store.jihwaja.A1)씨의 고치고 싶은 습관은")
                        Spacer()
                    }
                    Text("\(store.jihwaja.A6)")
                        //.frame(width: getWidth() * 0.78, height: getHeight() * 0.5)
                        .font(.system(size: 38))
                        .fontWeight(.black)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("green"))
                }.padding(.bottom, 20)
                //Q7
                Group{
                    HStack{
                        ZStack {
                            Image("background")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.08, height: getWidth() * 0.1)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            
                            Image("cardDesign06")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.06, height: getWidth() * 0.08)
                                .cornerRadius(7)
                        }
                        Text("\(store.jihwaja.A1)씨의 추억이 담긴 음식과 그 추억은")
                        Spacer()
                    }
                    Text("\(store.jihwaja.A7)")
                        .font(.title)
                        .foregroundColor(Color("green"))
                        .padding()
                        
                }.padding(.bottom, 20)
                
                //Q8
                Group{
                    HStack{
                        ZStack {
                            Image("background")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.08, height: getWidth() * 0.1)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            
                            Image("cardDesign07")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.06, height: getWidth() * 0.08)
                                .cornerRadius(7)
                        }
                        Text("\(store.jihwaja.A1)씨가 지금 당장 떠나고 싶은 곳은")
                        Spacer()
                    }
                    Text("\(store.jihwaja.A8)")
                        .font(.title)
                        .foregroundColor(Color("green"))
                        .padding()
                }.padding(.bottom, 20)
                
                //Q9
                Group{
//                    HStack{
//                        ZStack {
//                            Image("background")
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: getWidth() * 0.08, height: getWidth() * 0.1)
//                                .cornerRadius(10)
//                                .shadow(radius: 5)
//
//
//                            Image("cardDesign08")
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: getWidth() * 0.06, height: getWidth() * 0.08)
//                                .cornerRadius(7)
//                        }
//                        Text("\(store.jihwaja.A1)씨가 기억되고 싶은 표정은")
//                        Spacer()
//                    }
                    FinalQ9()
                }.padding(.bottom, 20)
                
                //Q10
                Group{
                    HStack{
                        ZStack {
                            Image("background")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.08, height: getWidth() * 0.1)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            
                            Image("cardDesign09")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.06, height: getWidth() * 0.08)
                                .cornerRadius(7)
                        }
                        Text("\(store.jihwaja.A1)씨가 선호하는 취미는")
                        Spacer()
                    }
                    Image(store.jihwaja.A10)
                }.padding(.bottom, 20)
                
                //Q11
                Group{
                    HStack{
                        ZStack {
                            Image("background")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.08, height: getWidth() * 0.1)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            
                            Image("cardDesign10")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.06, height: getWidth() * 0.08)
                                .cornerRadius(7)
                        }
                        Text("각 나이대별로 \(store.jihwaja.A1)씨가 행복했던 정도는")
                        Spacer()
                    }
                    ZStack{
                        Image("Q11GraphBg")
                            .resizable()
                            .frame(width: getWidth() * 0.9, height: getWidth() * 1)
                        //하드코딩....
                            .padding(.top, -18)
                        
                        
                        // 슬라이더 핸들들이 이어진 Path
                        Path { path in
                            path.move(to: CGPoint(x: 44, y: 250))
                            path.addLine(to: CGPoint(x: 68+37, y: CGFloat(store.jihwaja.A11[0]) + 250))
                            path.addLine(to: CGPoint(x: 142+35, y: CGFloat(store.jihwaja.A11[1]) + 250))
                            path.addLine(to: CGPoint(x: 216+35, y: CGFloat(store.jihwaja.A11[2]) + 250))
                            path.addLine(to: CGPoint(x: 290+35, y: CGFloat(store.jihwaja.A11[3]) + 250))
                        }
                        .stroke(Color.green, lineWidth: 3)

                        // 슬라이더 핸들들
                        HStack {
                            SliderView(height: 300, value: $store.jihwaja.A11[0])
                                .frame(width: getWidth() * 0.17)
                                .disabled(store.jihwaja.isCompleted[10])
                            SliderView(height: 300, value: $store.jihwaja.A11[1])
                                .frame(width: getWidth() * 0.17)
                                .disabled(store.jihwaja.isCompleted[10])
                            SliderView(height: 300, value: $store.jihwaja.A11[2])
                                .frame(width: getWidth() * 0.17)
                                .disabled(store.jihwaja.isCompleted[10])
                            SliderView(height: 300, value: $store.jihwaja.A11[3])
                                .frame(width: getWidth() * 0.17)
                                .disabled(store.jihwaja.isCompleted[10])
                                
                            
                        }
                        .frame(height: 500)
                        .padding(.horizontal, 20)
                        .offset(x: 36)
                        

                        
                    }
                }.padding(.bottom, 20)
                
                //Q12
                Group{
                    HStack{
                        ZStack {
                            Image("background")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.08, height: getWidth() * 0.1)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            
                            Image("cardDesign11")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.06, height: getWidth() * 0.08)
                                .cornerRadius(7)
                        }
                        Text("앞으로도 \(store.jihwaja.A1)씨가 듣고 싶은 호칭은")
                        Spacer()
                    }
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("gray"), lineWidth: 2)
                        .foregroundColor(.clear)
                        .frame(width: getWidth() * 0.75, height: getHeight() * 0.225)
                        .overlay{
                            List {
                                ForEach(store.jihwaja.A12S.indices, id: \.self) { index in
                                    HStack {
                                        Text("\(store.jihwaja.A12S[index])")
                                        Spacer()
                                        
                                        Button(action: {
                                            store.jihwaja.A12B[index].toggle()
                                        }) {
                                            Image(systemName: store.jihwaja.A12B[index] ? "heart.fill" : "heart")
                                                .foregroundColor(store.jihwaja.A12B[index] ? .red : .gray)
                                        }.disabled(store.jihwaja.isCompleted[11])
                                    }
                                        
                                }
                                
                            }.scrollContentBackground(.hidden)
                                .padding(.top, -getHeight()*0.03)
                        }
                }
            }.padding(.bottom, 20)
            
            Button(action:{
                // MainView 로 넘어가는 코드
                store.jihwaja = jihwajaData.emptyData
                isFirstLaunching = true
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("다시하기")
                    .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
                // 버튼이 활성화되면 초록색, 비활성화되면 회색 배경색
                    .background( Color("green"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.top, getWidth() * 0.04)
                    .padding(.bottom, getWidth() * 0.12)
            }
            
        }.padding()
    }
}

struct ProfileView: View {
    @EnvironmentObject var store: JihwajaStore
    @State private var lines = [Line]()
    
    var body: some View {
        ZStack {
            ForEach(lines) { line in
                DrawingShape(points: line.points)
                    .stroke(line.color, style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round, lineJoin: .round))
            }
        }.onAppear {
            lines = store.jihwaja.A9
        }
    }
}
struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView(isFirstLaunching: .constant(true))
    }
}

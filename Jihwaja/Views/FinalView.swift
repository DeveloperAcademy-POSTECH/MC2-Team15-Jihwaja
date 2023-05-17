//
//  FinalView.swift
//  Jihwaja
//
//  Created by SY AN on 2023/05/17.
//

import SwiftUI

struct FinalView: View {
    @EnvironmentObject var store: JihwajaStore
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
                    
                    Text("\(store.jihwaja.A1)씨가 훗날\n기억되고 싶은 표정은")
                    
                    Spacer()
                }
                
                Text("네!")
                // 슬라이더에서 변경되는 $yes에 따라 font size 변경
                    .font(.system(size:(10 * (store.jihwaja.A2/5))))
                    .foregroundColor(Color("green"))
                
                Rectangle()
                    .frame(width: getWidth() * 0.74, height: getHeight() * 0.45)
                    .foregroundColor(Color.black.opacity(0.06))
                    .cornerRadius(10)
                
                //Q4
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
                
                //Q5
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
                
            }
            
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
                
                //Q7
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
                
                //Q8
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
                
                //Q9
                HStack{
                    ZStack {
                        Image("background")
                            .resizable()
                            .scaledToFill()
                            .frame(width: getWidth() * 0.08, height: getWidth() * 0.1)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        
                        
                        Image("cardDesign08")
                            .resizable()
                            .scaledToFill()
                            .frame(width: getWidth() * 0.06, height: getWidth() * 0.08)
                            .cornerRadius(7)
                    }
                    Text("\(store.jihwaja.A1)씨에게\n가장 중요한 5가지 가치는")
                    Spacer()
                }
                
                //Q10
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
                
                //Q11
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
                
                //Q12
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
        FinalView()
    }
}

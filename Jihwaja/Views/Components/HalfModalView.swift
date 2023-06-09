//
//  HalfModalView.swift
//  Jihwaja
//
//  Created by 안수린 on 2023/05/08.
//

import SwiftUI

struct HalfModalView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var imageName: String
    var title: String
    var content: String
    @Binding var showModal : Bool
    
    var body: some View {
        Group {
            VStack{
               Image(systemName: "minus")
                  .padding(.top, getWidth() * 0.02)
                  .imageScale(.large)
                  .font(Font.title.weight(.heavy))
                  .foregroundColor(Color(UIColor.tertiaryLabel))
                Spacer()
                
                Text(title)
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .padding(.bottom, getWidth() * 0.02)
                
                AnimatedManager(fileName: "\(imageName)")
                    .frame(width: getWidth() * 0.78, height: getWidth() * 0.62)
                Spacer()
                
                
                Text(content)
                    .font(.system(size: 20))
                    .padding(.bottom, getWidth() * 0.02)
                
                Button(action: {
                    
                    self.showModal.toggle()
                    self.presentationMode.wrappedValue.dismiss()
                    
                }) {
                    Text("확인했습니다")
                        .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
                        .background(Color("green"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.top, getWidth() * 0.06)
                        .padding(.bottom, getWidth() * 0.08)
                }
          
            
            }
        }
        .presentationDetents([.height(getWidth() * 1.4)])
      .multilineTextAlignment(.center)
    }
  }


struct HalfModalView_Previews: PreviewProvider {
    static var previews: some View {
        HalfModalView(imageName: "", title: "", content: "", showModal : .constant(true))
        
    }
}

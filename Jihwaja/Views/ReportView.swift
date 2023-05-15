//
//  ReportView.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI
import OpenAISwift

struct ReportView: View {
    @ObservedObject var viewModel = ViewModel()
    let translateManager = TranslateManager()
    @EnvironmentObject var store: JihwajaStore
    @Environment(\.presentationMode) var presentationMode
    
    @State var text = ""
    @State var models = [String]()

    var body: some View {
        VStack {
            if text == "" {
                VStack {
                    QuestionView(question: "\(store.jihwaja.A1)님의 소중한 결과를\n불러오고 있는 중입니다")
                    Spacer()
                    ProgressView("조금만 기다려 주세요").foregroundColor(Color("greenvie"))
                        .frame(width: getWidth() * 0.2)
                    Spacer()
                    Image("SplashImg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: getWidth() * 0.2, height: getWidth() * 0.4)
                    
                    Spacer()
                    
                    Button(action: {
                        send()
                    }, label: {
                        Text("다시 불러오기")
                            .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
                            .background(Color("green"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.top, getWidth() * 0.04)
                            .padding(.bottom, getWidth() * 0.12)
                    })
                }.onAppear { send() }
            } else {
                ScrollView {
                    Text("\(store.jihwaja.A1)님이 답해주신 내용을 바탕으로,\n")
                        .font(.body)
                        .foregroundColor(Color("grayText"))
                    
                    HStack{
                    Text("\(store.jihwaja.A1)")
                        .font(.body)
                        .fontWeight(.bold)
                         
                    Text("님에 대한")
                        .font(.body)
                        .foregroundColor(Color("grayText"))
                         }
                         
                    Text("짧은 이야기를 들려드릴게요!")
                    
                    Spacer()
                    Text("네!")
                    // 슬라이더에서 변경되는 $yes에 따라 font size 변경
                        .font(.system(size:(10 * (store.jihwaja.A2/5))))
                        .foregroundColor(Color("green"))
                        .padding()
                    Spacer()
                    
                    Text(text)
                        .font(.body)
                        .frame(width: getWidth() * 0.8)
                    
                    
                    ForEach(store.jihwaja.A6L) { line in
                        DrawingShape(points: line.points)
                            .stroke(line.color, style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round, lineJoin: .round))
                    }
                    
                    Image(store.jihwaja.A8)
                        .padding(.horizontal)
                    Image(store.jihwaja.A10)
                        .padding(.horizontal)
                    
                }
                
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("완료")
                        .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
                        .background(Color("green"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.top, getWidth() * 0.04)
                        .padding(.bottom, getWidth() * 0.12)
                })
            }
        }.onAppear {
            print("A1: \(store.jihwaja.A1)")
            print("A2: \(store.jihwaja.A2)")
            print("A4: \(store.jihwaja.A4)")
            print("A5: \(store.jihwaja.A5)")
            print("A6: \(store.jihwaja.A6)")
            print("A7: \(store.jihwaja.A7)")
            print("A8: \(store.jihwaja.A8)")
            print("A10: \(store.jihwaja.A10)")
            print("A11: \(store.jihwaja.A11)")
            print("A12s:\(store.jihwaja.A12S)")
            viewModel.setup()
        }
    }

    func send() {
        let textStore = "Write a warm story about my self in ENGLISH! My name is \(store.jihwaja.A1). I have a memory of \(store.jihwaja.A6). I have lived the life she really wanted at around 20% (Q2), and she felt -30% (Q11-1) in adolescence, 80% (Q11-2) in youth, and 40% (Q11-3) in middle age. I am currently feeling 40% (Q5) happiness, and important values are health, leisure time, and hobby search (Q3). The habit I want to break is constantly \(store.jihwaja.A6). My preferred hobby is \(store.jihwaja.A10), and the places she wants to leave right away are \(store.jihwaja.A8). I want to be called \(store.jihwaja.A10) in the future, and I want to be remembered as a \(store.jihwaja.A4)."
        print("===============문구 잘 들어갔는지======================")
        print(textStore)
        let realText = textStore.withoutPunctuations
        
        print("real: \(realText)")
        
        //var result: String = ""
        print("send!")

        let group = DispatchGroup()
        group.enter()
        
        viewModel.send(text: realText) { response in
            DispatchQueue.main.async {
                //print(response)
                //result = response
                print(response)
                print(type(of:  response))
                
                group.leave()
                
                text = translateManager.getTranslateText(papago: Papago(source: "en", target: "ko", text: "\(response.replacingOccurrences(of: "\n\n", with: "").replacingOccurrences(of: "\n", with: ""))"))
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                    print("text: \(text)")
                    print(translateManager.koreaText.value)
                    text = translateManager.koreaText.value
                }
            }
            print("waiting..")
            group.wait()
            //print(result)
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}

final class ViewModel: ObservableObject {
    init() {}

    private var client: OpenAISwift?

    func setup() {
        client = OpenAISwift(authToken: "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")
    }

    func send(text: String, completion: @escaping (String) -> Void) {
        client?.sendCompletion(with: text,
                               maxTokens: 800,
                               temperature: 0.8,
                               completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices?.first?.text ?? ""
                completion(output)
            case .failure:
                break
            }
        })
    }
}

extension String {
  var withoutPunctuations: String {
    return self.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
  }
}

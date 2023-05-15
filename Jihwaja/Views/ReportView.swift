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
    @State var text = ""
    @State var models = [String]()

    var body: some View {
        VStack {
            if text == "" {
                VStack {
                    QuestionView(question: "곽애숙님의 소중한 결과를\n불러오고 있는 중입니다")
                    
                    ProgressView("조금만 기다려 주세요").foregroundColor(Color("greenvie"))
                    
                    Image("SplashImg")
                        .resizable()
                        .frame(width: getWidth() * 0.4, height: getWidth() * 0.8)
                    
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
                    Text(text)
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(width: getWidth() * 0.8)
                }
            }
        }.onAppear {
            viewModel.setup()
        }
    }

    func send() {
        //var result: String = ""
        print("send!")

        let group = DispatchGroup()
        group.enter()
        
        viewModel.send(text: "Write a warm fairy tale about an ordinary person. My name is Kwak Ae-sook (Q1), and I have a memory of my mom's kimchi jjim set meal~~~~~(Q7), so I am thinking of memories with this food. Kwak Ae-sook has lived the life she really wanted at around 20% (Q2), and she felt -30% (Q11-1) in adolescence, 80% (Q11-2) in youth, and 40% (Q11-3) in middle age. Kwak Ae-sook (Q1) is currently feeling 40% (Q5) happiness, and important values are health, leisure time, and hobby search (Q3). The habit I want to break is constantly shaking my legs (Q6). Kwak Ae-sook's preferred hobby is fishing (Q10), and the places she wants to leave right away are Egypt, Korea, and China (Q8). Kwak Ae-sook (Q1) wants to be called 00 mother and Kwak Ae-sook (Q12) in the future, and Kwak Ae-sook wants to be remembered as a warm person to everyone (Q4).") { response in
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
                               maxTokens: 500,
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

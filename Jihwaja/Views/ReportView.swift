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
    @Binding var isFirstLaunching : Bool
    
    @State var text = ""
    @State var models = [String]()

    var body: some View {
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
                            .frame(width: getWidth() * 0.3, height: getWidth() * 0.6)
                        
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
                }.onAppear {
                    viewModel.setup()
                    send()}
            } else {
                ScrollView {
                    VStack {
                        ZStack{
                            Circle()
                                .stroke(Color("green"), lineWidth: 3)
                                .frame(width: getWidth() * 0.3, height: getWidth() * 0.3)
                            Image("SplashImg")
                                .resizable()
                                .frame(width: getWidth() * 0.1, height: getHeight() * 0.1)
                        }
                        .padding(.vertical)
                        
                        HStack{
                            Text("\(store.jihwaja.A1)")
                                .fontWeight(.bold)
                                .font(.title)
                                .padding(.horizontal)
                            Text("님의 이야기")
                                .font(.title)
                            Spacer()
                        }
                        .padding(.vertical)
                        
                        Text(text).frame(width: getWidth() * 0.8)
                        //FinalView(isFirstLaunching: $isFirstLaunching)
                        FinalView(isFirstLaunching: $isFirstLaunching)
                    }
                }
            }
    }

    func send() {
        let textStore = "Can you write a story about me, portraying me as the protagonist of an exciting fairy tale?\nMy name is \(store.jihwaja.A1).I have the following memories from the past:\(store.jihwaja.A4). And when I think about how happy I've been from the past until now: During my teenage years, it was \(store.jihwaja.A11[0]). In my twenties, it was \(store.jihwaja.A11[1]). In my thirties, it was \(store.jihwaja.A11[2]). And now, it's \(store.jihwaja.A11[3]), in terms of happiness.And at this very moment, I'm as happy as \(store.jihwaja.A5). The habit I want to change right now, in my current state, is \(store.jihwaja.A6).I also have a desire to travel to \(store.jihwaja.A7). My hobby is \(store.jihwaja.A10). So far, I have lived with a satisfaction level of \(store.jihwaja.A2). I would like to leave a phrase on my tombstone saying, '\(store.jihwaja.A4)"
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
        ReportView(isFirstLaunching: .constant(true))
    }
}

final class ViewModel: ObservableObject {
    init() {}

    private var client: OpenAISwift?

    func setup() {
        print("[setup]")
        client = OpenAISwift(authToken: "")
    }

    func send(text: String, completion: @escaping (String) -> Void) {
        print("[send]")
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

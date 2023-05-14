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
            ForEach(models, id: \.self) { string in
                Text(string)
            }
            Button("Send") {
                send()
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
        
        viewModel.send(text: "Write a warm fairy tale about an ordinary person. His name is Kwak Ae-sook, and he is in his 50s. I'm living with about 80 percent of happiness. Important values are health, leisure time, and finding hobbies. He wants to be remembered as a warm person by everyone in the future. The habit I want to fix is shaking my legs. The food that brings back memories is the kimchi jjim set meal that my mom made for me. The place she wants to leave right now is 이집트. She wants to go 낚시 as a new hobby.") { response in
            DispatchQueue.main.async {
                //print(response)
                //result = response
                print(response)
                print(type(of:  response))
                
                group.leave()
                
                let input: () = translateManager.getTranslateText(papago: Papago(source: "en", target: "ko", text: "\(response.replacingOccurrences(of: "\n\n", with: "").replacingOccurrences(of: "\n", with: ""))"))
                print(input)
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
                               maxTokens: 100,
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

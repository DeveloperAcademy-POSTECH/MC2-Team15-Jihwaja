//
//  TranslateManager.swift
//  Jihwaja
//
//  Created by geee3 on 2023/05/15.
//

import Foundation
import Alamofire
import Combine

struct Papago: Codable {
    var source: String
    var target: String
    var text: String
}

class TranslateManager {
    
    let koreaText = CurrentValueSubject<String,Error>("")
    var subscription = Set<AnyCancellable>()
    
    init(){
        koreaText.sink(receiveCompletion: { completion in
            switch completion {
                
            case .finished:
                print("FIN")
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }, receiveValue: { str in
            print("korea \(str)")
        })
        .store(in: &subscription)
    }
    
    func getTranslateText(papago: Papago) -> String {
        print(papago)
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        var urlRequest = URLRequest(url: URL(string: url)!)
        var returnValue: String = ""
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/x-www-form-urlencoded; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("FJ2V_KhTZCpQoeD0n57R", forHTTPHeaderField: "X-Naver-Client-Id")
        urlRequest.setValue("LTfCp5kujA", forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let parameter = "source=\(papago.source)&target=\(papago.target)&text=\(papago.text)"
        let parameterData = parameter.data(using: .utf8)
        urlRequest.httpBody = parameterData
        
        AF.request(urlRequest).responseString {[weak self] response in
            
            guard let self else {return}
            
            switch response.result {
            case .success:
                Task.detached{
                    guard let response = response.value,let decode = self.jsonDecoder(String(response))else  {
                        print(response)
                        return
                    }
                    
                    let text = decode.message.result.translatedText
                    print("Res :\(text)")
                    self.koreaText.send(text)
                    
                }
            case .failure(let error):
                print("Alamofire Request Error: \(error)")
                returnValue = "Alamofire Request Error: \(error)"
            }
        }
        return ""
    }
    
    func jsonDecoder(_ data: String) -> TranslateResponseBody? {
        let decoder = JSONDecoder()
        guard let jsonData = data.data(using: .utf8) else { return nil }
        
        do {
            let decoded: TranslateResponseBody = try decoder.decode(TranslateResponseBody.self, from: jsonData)
            return decoded
        } catch {
            print("jsonDecoder Decoding Error")
        }
        
        return nil
    }
}

struct TranslateResponseBody: Decodable {
    struct Message: Decodable {
        let result: Result
    }
    
    struct Result: Decodable {
        let translatedText: String
    }
    
    let message: Message
}

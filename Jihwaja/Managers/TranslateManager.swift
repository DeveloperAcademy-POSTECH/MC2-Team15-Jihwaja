//
//  TranslateManager.swift
//  Jihwaja
//
//  Created by geee3 on 2023/05/15.
//

import Foundation
import Alamofire

struct Papago: Codable {
    var source: String
    var target: String
    var text: String
}

class TranslateManager {
    func getTranslateText(papago: Papago) {
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        var urlRequest = URLRequest(url: URL(string: url)!)
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/x-www-form-urlencoded; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("nMAIuBlgt3nlC0q24ECP", forHTTPHeaderField: "X-Naver-Client-Id")
        urlRequest.setValue("fKDEsqPjqq", forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let parameter = "source=\(papago.source)&target=\(papago.target)&text=\(papago.text)"
        let parameterData = parameter.data(using: .utf8)
        urlRequest.httpBody = parameterData
        
        AF.request(urlRequest).responseString { response in
            switch response.result {
            case .success:
                let decoded = self.jsonDecoder(String(response.value!))
                print(decoded!.message.result.translatedText)
            case .failure(let error):
                print("Alamofire Request Error: \(error)")
            }
        }
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

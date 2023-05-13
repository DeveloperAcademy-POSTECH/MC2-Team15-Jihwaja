//
//  JIhwajaStore.swift
//  Jihwaja
//
//  Created by SY AN on 2023/05/13.
//

import Foundation
import SwiftUI

@MainActor

class JihwajaStore : ObservableObject {
    @Published var jihwaja : jihwajaData = jihwajaData.emptyData
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        // to return the URL of a file named scrums.data.
        .appendingPathComponent("jihwaja.data")
    }
    
    
    func load() async throws {
        let task = Task <jihwajaData, Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return jihwajaData.emptyData
            }
            
            let jihwaja = try JSONDecoder().decode(jihwajaData.self, from: data)
            
            return jihwaja
        }
        let decodedJihwaja = try await task.value
        
        // 즉 저장되어있던 [DailyShower]를 file 경로에서 접근하여 decode하고, load한 배열로 showers : [DailyShower] 룰 업데이트 하게 된다.
        self.jihwaja = decodedJihwaja
    }
    
    func save(jihwaja: jihwajaData) async throws{
         
        let task = Task {
            let data = try JSONEncoder().encode(jihwaja)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        
        _ = try await task.value
    }
    
    
}

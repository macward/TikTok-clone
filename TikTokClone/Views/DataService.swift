//
//  DataService.swift
//  TikTokClone
//
//  Created by Max Ward on 02/08/2023.
//

import Foundation

enum NetworkError: Error {
    case BadResponse
    case BadFormat
    case Unknown
}

class Api {
    
    static func feed() async throws -> [VideoScheme] {
        
        let request = URLRequest(url: URL(string: URL_FEED)!)

        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            let decodedData = try JSONDecoder().decode([VideoScheme].self, from: data)
            return decodedData
        } catch {
            throw NetworkError.BadFormat
        }
    }
    
}

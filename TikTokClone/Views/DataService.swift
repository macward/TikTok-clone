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

class DataService {
    
    func feedInformation() async throws -> [VideoScheme] {
        
        let urlStrnig =  "https://firebasestorage.googleapis.com/v0/b/switchat-1d16f.appspot.com/o/media%2Fmedia_response.json?alt=media&token=c19c5f0c-78dc-4a5d-b231-2608b11f049d"
        
        let queryItems = [URLQueryItem(name: "alt", value: "media")]
        
        var urlComponents = URLComponents(string: urlStrnig)!
        urlComponents.queryItems = queryItems
        
        let request = URLRequest(url: urlComponents.url!)

        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            let decodedData = try JSONDecoder().decode([VideoScheme].self, from: data)
            return decodedData
        } catch {
            throw NetworkError.BadFormat
        }
    }
    
}

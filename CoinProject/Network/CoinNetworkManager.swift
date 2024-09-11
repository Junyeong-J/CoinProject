//
//  CoinNetworkManager.swift
//  CoinProject
//
//  Created by 전준영 on 9/11/24.
//

import Foundation

struct CoinAPI {
    
    private init() { }
    
    static func fetchSearchCoin(completion: @escaping (CoinSearchResponse) -> Void) {
        
        let url = URL(string: APIURL.coinSearchURL)!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(CoinSearchResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData)
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
}


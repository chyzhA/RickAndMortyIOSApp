//
//  RMNetworkManager.swift
//  RickAndMotryApp
//
//  Created by Artem Chyzh on 01.02.2023.
//

import Foundation

//extension NetworkManager {
//    enum ServerURL {
//        //
//        static let charactersURLp1 = "https://rickandmortyapi.com/api/character/"
//
//    }
//}

extension NetworkManager {
    // Edit fetch method
    static func fetchCharacters(from urlString: String,
                           withCompletion completion: @escaping ((RMCharactersModel) -> Void)) {
        let session = URLSession(configuration: .default)
        guard let url = URL(string: urlString) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if error == nil {
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                print("TRYING TO DECODE DATA:")
                let decoder = JSONDecoder()
                if let data = data {
                    do {
                        let decodedObject = try decoder.decode(RMCharactersModel.self, from: data)
                        completion(decodedObject)
                        print("DECODED \(RMCharacter.self) SUCCESSFULLY")
                        print(decodedObject)
                    } catch let DecodingError.dataCorrupted(context) {
                        print(context)
                    } catch let DecodingError.keyNotFound(key, context) {
                        print("Key '\(key)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.valueNotFound(value, context) {
                        print("Value '\(value)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.typeMismatch(type, context)  {
                        print("Type '\(type)' mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch {
                        print("error: ", error)
                    }
                }
            } else {
                print("URL Session Task Failed: %@", error!.localizedDescription)
            }
            //log(response: response as? HTTPURLResponse, data: data, error: error)
        })
        task.resume()
    }
    
}

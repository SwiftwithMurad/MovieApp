//
//  NetwokManager.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation
import Alamofire

class NetworkManager {
    func getAPIRequest<T: Codable>(path: String,
                                   model: T.Type,
                                   method: HTTPMethod = .get,
                                   params: Parameters? = nil,
                                   encoding: EncodingType = .url,
                                   completion: @escaping ((T?, String?) -> Void)) {
        AF.request(path,
                   method: method,
                   parameters: params,
                   encoding: encoding == .url ? URLEncoding.default: JSONEncoding.default,
                   headers: NetworkHelper.shared.header).responseDecodable(of: model.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}

//
//  NetwokManager.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation
import Alamofire

class NetwokManager {
    func getAPIRequest<T: Codable>(endPoint: EndPoints,
                                   model: T.Type,
                                   method: HTTPMethod = .get,
                                   params: Parameters? = nil,
                                   encoding: EncodingType = .url,
                                   completion: @escaping ((T?, String?) -> Void)) {
        AF.request("\(NetworkHelper.baseURL)/\(endPoint.rawValue)",
                   method: method,
                   parameters: params,
                   encoding: encoding == .url ? URLEncoding.default: JSONEncoding.default,
                   headers: NetworkHelper.header).responseDecodable(of: model.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}

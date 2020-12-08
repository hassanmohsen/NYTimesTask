//
//  APIRequestManager.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import Moya


class APIRequestManager: NetworkManagerProtocol {
    
    
    
    func sendRequest<T:Codable , R: NetworkTargetType>(responseModel : T.Type , targetMoya : R , completion : @escaping (_ response : Response<T>)-> Void) -> Void {
        
        //        if repoRequest.
        let provider = MoyaProvider<R>()
        debugPrint("url : >>", targetMoya.baseURL.absoluteString + targetMoya.path)
        debugPrint("===============================")
        debugPrint("header : >> " , targetMoya.headers ?? [:])
        debugPrint("===============================")
        debugPrint("Body : >>", targetMoya.task)
        debugPrint("===============================")
        if targetMoya.showLoader {
            ARSLineProgress.show()
        }
        
        
        _ = provider.request(targetMoya, completion: { (result) in
            
            if targetMoya.showLoader{
                ARSLineProgress.hide()
            }
            
            switch result {
                
            case .success(let response):
                if response.response?.statusCode == 401 {
                    print("not authorized")
                    AlertManagerLayer.showAlert(withModel: .error(message: "Unauthorized Account",
                                                                  done: "OK",
                                                                  cancel: nil))
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let fff = try JSONSerialization.jsonObject(with: response.data, options: .mutableContainers)
                    debugPrint("🚀 response Json 🚀")
                    debugPrint(fff)
                    debugPrint("========End =======")
                    let modelDecoded = try decoder.decode(responseModel.self, from: response.data)
                    print(modelDecoded)
                    
                    completion(.success(modelDecoded))
                    
                }catch{
                    debugPrint("data : \(response.data)")
                    debugPrint("debug description : \(response.debugDescription)")
                    debugPrint("status code : \(response.statusCode)")
                    debugPrint(error)
                    completion(.error(error))
                }
            case .failure(let error):
                print(error)
                completion(.error(error))
            
                
            }
            
            
        })
        
        
    }
    
    
    
}

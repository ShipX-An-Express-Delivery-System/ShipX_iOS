//
//  ShippingProcessDataRequest.swift
//  ShipX
//
//  Created by Fahim Rahman on 17/7/22.
//

import Foundation
import Alamofire

// MARK:- Public Network Calls are here

// get shipping process data API request
func getShippingProcessRequest(email: String, accessToken: String, URLString: String, completion: @escaping (ShippingProcessResponseModel?, Error?) -> ()) {
    
    guard let shippingProcessURL = URL(string: URLString + email) else {
        print("Shipping Process URL Invalid")
        return
    }
    
    let headers: HTTPHeaders = ["Authorization": "Bearer \(accessToken)", "Content-Type": "application/json"]
    
    do {
        let request = try URLRequest(url: shippingProcessURL, method: .get, headers: headers)
        AF.request(request).responseDecodable(of: ShippingProcessResponseModel.self) { data in
            if data.value?.success == true && data.value?.shippingProcessData != nil  {
                completion(data.value, data.error)
            }
        }
    } catch {
        print("Could Not Get Shipping Process Data")
    }
}

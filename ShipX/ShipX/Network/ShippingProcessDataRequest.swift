//
//  ShippingProcessDataRequest.swift
//  ShipX
//
//  Created by Fahim Rahman on 17/7/22.
//

import Foundation
import Alamofire

// get shipping process data API request
func getShippingProcessRequest(email: String, accessToken: String, completion: @escaping (ShippingProcessResponseModel?, Error?) -> ()) {
    
    guard let shippingProcessURL = URL(string: String.shippingProcessDataURL() + email) else {
        print("location URL Invalid")
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

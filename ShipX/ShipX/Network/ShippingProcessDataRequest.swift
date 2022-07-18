//
//  ShippingProcessDataRequest.swift
//  ShipX
//
//  Created by Fahim Rahman on 17/7/22.
//

import Foundation
import Alamofire

// MARK:- Common Network Calls are here

// get shipping process data API request
func getShippingProcessRequest(email: String, accessToken: String, URLString: String, completion: @escaping (ShippingProcessResponseModel?, Error?) -> ()) {
    
    guard let shippingProcessURL = URL(string: URLString + email) else {
        print("Location URL Invalid")
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



// get profile data API request
func getProfileDataRequest(email: String, accessToken: String, completion: @escaping (ProfileDataResponseModel?, Error?) -> ()) {
    
    guard let profileDataURL = URL(string: String.userProfileDataRequestURL() + email) else {
        print("Profile Data URL Invalid")
        return
    }
    
    let headers: HTTPHeaders = ["Authorization": "Bearer \(accessToken)", "Content-Type": "application/json"]
    
    do {
        let request = try URLRequest(url: profileDataURL, method: .get, headers: headers)
        AF.request(request).responseDecodable(of: ProfileDataResponseModel.self) { data in
            if data.value?.success == true && data.value?.profileData != nil  {
                completion(data.value, data.error)
            }
        }
    } catch {
        print("Could Not Get Profile Data")
    }
}

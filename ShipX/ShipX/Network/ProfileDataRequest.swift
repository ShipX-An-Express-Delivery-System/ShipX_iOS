//
//  ProfileDataRequest.swift
//  ShipX
//
//  Created by Fahim Rahman on 19/7/22.
//

import Foundation
import Alamofire

// MARK:- Public Network Calls are here

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

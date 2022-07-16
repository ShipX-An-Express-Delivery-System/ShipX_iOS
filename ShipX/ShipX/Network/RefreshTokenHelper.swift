//
//  RefreshTokenHelper.swift
//  ShipX
//
//  Created by Fahim Rahman on 14/7/22.
//

import Foundation
import Alamofire

// refresh token response model
struct RefreshTokenResponseModel: Codable {
    let status: String?
    let success: Bool?
    let accessToken: String?
}

// refresh token request model
struct RefreshTokenRequestModel: Codable {
    let email, refreshToken: String?
}

// refresh token
public func refreshTokenRequest(completion: @escaping () -> ()) {
    
    guard let refreshTokenURL = URL(string: String.refreshTokenURL()) else {
        print("Refresh token URL Invalid")
        return
    }
    
    let parameters = RefreshTokenRequestModel(email: UserDefaults.standard.string(forKey: "email"), refreshToken: UserDefaults.standard.string(forKey: "refreshToken"))
    
    let request = AF.request(refreshTokenURL, method: .post, parameters: parameters, encoder: .json)
    
    request.responseDecodable(of: RefreshTokenResponseModel.self) { data in
        if data.value?.success == true {
            UserDefaults.standard.set(data.value?.accessToken, forKey: "accessToken")
            print("Refeshed Token")
            completion()
        }
        else {
            print("Refreshing Token Failed!")
        }
    }
}

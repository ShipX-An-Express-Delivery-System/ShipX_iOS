//
//  LoginResponseModel.swift
//  ShipX
//
//  Created by Fahim Rahman on 14/7/22.
//

import Foundation

// MARK: - LoginResponseModel
struct LoginResponseModel: Codable {
    let success: Bool?
    let status, error, accessToken, refreshToken: String?
}

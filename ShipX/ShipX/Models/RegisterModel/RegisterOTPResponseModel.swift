//
//  RegisterOTPResponseModel.swift
//  ShipX
//
//  Created by Fahim Rahman on 13/7/22.
//

import Foundation

// MARK: - RegisterOTPResponseModel
struct RegisterOTPResponseModel: Codable {
    let error: String?
    let status: String?
    let success: Bool?
}

//
//  RegisterResponseModel.swift
//  ShipX
//
//  Created by Fahim Rahman on 12/7/22.
//

import Foundation

// MARK: - RegisterResponseModel
struct RegisterResponseModel: Codable {
    let error: String?
    let success: Bool?
    let status: String?
}

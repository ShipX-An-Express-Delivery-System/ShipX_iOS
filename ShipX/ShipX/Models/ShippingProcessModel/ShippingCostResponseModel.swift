//
//  ShippingCostResponseModel.swift
//  ShipX
//
//  Created by Fahim Rahman on 21/7/22.
//

import Foundation

// MARK: - ShippingCostResponseModel
struct ShippingCostResponseModel: Codable {
    let costs: [Cost]?
    let success: Bool?
}

// MARK: - Cost
struct Cost: Codable {
    let id, productType, cost: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case productType, cost
    }
}

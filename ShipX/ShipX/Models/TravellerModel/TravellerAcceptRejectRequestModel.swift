//
//  TravellerAcceptRejectRequestModel.swift
//  ShipX
//
//  Created by Fahim Rahman on 18/7/22.
//

import Foundation

// MARK: - TravellerAcceptRejectRequestModel
struct TravellerAcceptRejectRequestModel: Codable {
    let shippingProcessID: String?

    enum CodingKeys: String, CodingKey {
        case shippingProcessID = "shippingProcessId"
    }
}

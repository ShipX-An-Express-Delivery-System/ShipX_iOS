//
//  SenderShippingRequestModel.swift
//  ShipX
//
//  Created by Fahim Rahman on 21/7/22.
//

import Foundation


// MARK: - SenderShippingRequestModel
struct SenderShippingRequestModel: Codable {
    let shippingProcessID, receiverEmail: String?
    let isPaid, requestForTraveller: Bool?
    let productType, shippingCost: String?

    enum CodingKeys: String, CodingKey {
        case shippingProcessID = "shippingProcessId"
        case receiverEmail, isPaid, requestForTraveller, productType, shippingCost
    }
}

//
//  ShippingProcessResponseModel.swift
//  ShipX
//
//  Created by Fahim Rahman on 17/7/22.
//

import Foundation

// MARK: - ShippingProcessResponseModel
struct ShippingProcessResponseModel: Codable {
    let status: String?
    let success: Bool?
    let shippingProcessData: [ShippingProcessData]?
}

// MARK: - ShippingProcessData
struct ShippingProcessData: Codable, Identifiable {
    
    let travellerLocationFrom, travellerLocationTo: TravellerRequestLocationModel?
    let id, travellerEmail, travellingTimeAndDate: String?
    let shippingStatus, trackingID: String?
    let isPaid, isDelivered, isTravellerAvailable, requestForTraveller: Bool?
    let confirmationOTP, updatedAt: String?
    let v: Int?
    let productType, receiverEmail, senderEmail, shippingCost: String?

    enum CodingKeys: String, CodingKey {
        case travellerLocationFrom, travellerLocationTo
        case id = "_id"
        case travellerEmail, travellingTimeAndDate, shippingStatus, trackingID, isPaid, isDelivered, isTravellerAvailable, requestForTraveller, confirmationOTP, updatedAt
        case v = "__v"
        case productType, receiverEmail, senderEmail, shippingCost
    }
}

// MARK: - Traveller Request Location Model
struct TravellerRequestLocationModel: Codable {
    let division, district, upazila, cityCorpArea, additionalLocationNote: String?
}

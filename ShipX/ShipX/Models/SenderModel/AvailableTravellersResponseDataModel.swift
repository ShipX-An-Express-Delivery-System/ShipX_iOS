//
//  AvailableTravellersResponseDataModel.swift
//  ShipX
//
//  Created by Fahim Rahman on 21/7/22.
//

import Foundation

// MARK: - AvailableTravellersDataModel
struct AvailableTravellersResponseDataModel: Codable {
    let success: Bool?
    let availableTravellersData: [AvailableTravellersData]?
}

// MARK: - AvailableTravellersData
struct AvailableTravellersData: Codable, Identifiable {
    let travellerLocationFrom, travellerLocationTo: TravellerLocation?
    let id, travellerEmail, travellingTimeAndDate, shippingStatus: String?
    let trackingID: String?
    let isPaid, isDelivered, isTravellerAvailable, requestForTraveller: Bool?
    let confirmationOTP, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case travellerLocationFrom, travellerLocationTo
        case id = "_id"
        case travellerEmail, travellingTimeAndDate, shippingStatus, trackingID, isPaid, isDelivered, isTravellerAvailable, requestForTraveller, confirmationOTP, updatedAt
        case v = "__v"
    }
}

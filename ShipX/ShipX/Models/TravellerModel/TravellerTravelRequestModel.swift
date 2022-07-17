//
//  TravellerTravelRequestModel.swift
//  ShipX
//
//  Created by Fahim Rahman on 16/7/22.
//

import Foundation

// MARK: - TravellerTravelRequestModel
struct TravellerTravelRequestModel: Codable {
    let travellingTimeAndDate: String?
    let isTravellerAvailable: Bool?
    let travellerLocationFrom, travellerLocationTo: TravellerLocation?
}

// MARK: - TravellerLocation
struct TravellerLocation: Codable {
    let division, district, upazila, cityCorpArea: String?
    let additionalLocationNote: String?
}

//
//  TravellerTravelFormViewModel.swift
//  ShipX
//
//  Created by Fahim Rahman on 21/7/22.
//

import Foundation

class TravellerTravelFormViewModel: ObservableObject {

    @Published var divisionFrom = String()
    @Published var districtFrom = String()
    @Published var upazilaFrom = String()
    @Published var cityCorpAreaFrom = String()
    @Published var additionalNoteFrom = String()

    @Published var divisionTo = String()
    @Published var districtTo = String()
    @Published var upazilaTo = String()
    @Published var cityCorpAreaTo = String()
    @Published var additionalNoteTo = String()

    @Published var travellingTimeAndDate = Date.now
    
    static let shared = TravellerTravelFormViewModel()
    
    func clear() {
        divisionFrom = ""
        districtFrom = ""
        upazilaFrom = ""
        cityCorpAreaFrom = ""
        additionalNoteFrom = ""
        
        divisionTo = ""
        districtTo = ""
        upazilaTo = ""
        cityCorpAreaTo = ""
        additionalNoteTo = ""
    }
}

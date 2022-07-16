//
//  LocationSearchViewTo.swift
//  ShipX
//
//  Created by Fahim Rahman on 16/7/22.
//


import SwiftUI
import Alamofire

struct LocationSearchViewTo: View {
    
    @ObservedObject private var travellerTravelFormModel = TravellerTravelFormViewModel.shared
    
    @State var queryForSearchURL: String = String()
    @Binding var navigationTitle: String
    @Binding var searchURL: String
    
    @State var locations = [LocationModel]()
    
    var body: some View {
        VStack {
            List(locations) { location in
                Button {
                    // list item pressed
                    print("List Item Pressed")
                    
                    self.travellerTravelFormModel.divisionTo = location.divisionName ?? self.travellerTravelFormModel.divisionTo

                    self.travellerTravelFormModel.districtTo = location.districtName ?? self.travellerTravelFormModel.districtTo

                    self.travellerTravelFormModel.upazilaTo = location.upazilaName ?? self.travellerTravelFormModel.upazilaTo

                    self.travellerTravelFormModel.cityCorpAreaTo = location.cityCorpAreaName ?? self.travellerTravelFormModel.cityCorpAreaTo
                    
                } label: {
                    Text((location.divisionName ?? location.districtName ?? location.upazilaName ?? location.cityCorpAreaName) ?? "")
                        .padding()
                }
            }
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.large)
        .searchable(text: $queryForSearchURL, placement: .navigationBarDrawer(displayMode: .always))
        .onChange(of: queryForSearchURL.lowercased()) { query in
            // search api call
            getLocationRequest()
        }
    }
    
    // get location data API request
    func getLocationRequest() {
        guard let locationURL = URL(string: searchURL + queryForSearchURL) else {
            print("location URL Invalid")
            return
        }
        
        let request = AF.request(locationURL)
        
        request.responseDecodable(of: [LocationModel].self) { data in
            if data.value != nil {
                self.locations = data.value!
            }
        }
    }
}


struct LocationSearchViewTo_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchViewFrom(navigationTitle: .constant(""), searchURL: .constant(""))
    }
}

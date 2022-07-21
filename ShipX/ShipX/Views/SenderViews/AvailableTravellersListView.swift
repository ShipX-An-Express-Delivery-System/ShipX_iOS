//
//  AvailableTravellersListView.swift
//  ShipX
//
//  Created by Fahim Rahman on 21/7/22.
//

import SwiftUI
import Alamofire

struct AvailableTravellersListView: View {
    
    @ObservedObject private var travellerTravelFormModel = TravellerTravelFormViewModel.shared
    
    @State private var availableTravellers: AvailableTravellersResponseDataModel?
    
    @State private var upazilaFrom = String()
    @State private var upazilaTo = String()
    
    @State private var listButtonPressed = false
    
    // view
    var body: some View {
        // vstack
        VStack(spacing: 0) {
            
            Text("Available Travellers")
                .foregroundColor(.customRed)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding(.bottom)
            
            Divider()
            
            // list
            List(availableTravellers?.availableTravellersData ?? [AvailableTravellersData](), id: \.id) { travellers in
                
                // nav link
                NavigationLink(destination: SenderRequestView(shippingProcessId: travellers.id ?? ""), isActive: self.$listButtonPressed) {
                    // button
                    Button {
                        // traveller list button pressed
                        print("Traveller List Button Pressed")
                        self.listButtonPressed = true
                    } label: {
                        // vstack
                        VStack(alignment: .leading, spacing: 0) {
                            // group
                            Group {
                                
                                Text("Traveller Email:")
                                    .foregroundColor(.customRed)
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .padding(0)
                                
                                Text(travellers.travellerEmail ?? "")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                    .padding(.bottom)
                                
                                Text("Travelling Time:")
                                    .foregroundColor(.customRed)
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .padding(0)
                                
                                Text(travellers.travellingTimeAndDate ?? "")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                    .padding(.bottom)
                            } //: group
                            
                            // group
                            Group {
                                Text("Location From:")
                                    .foregroundColor(.customRed)
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .padding(0)
                                
                                Text(travellers.travellerLocationFrom?.division ?? "")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                    .padding(0)
                                
                                Text(travellers.travellerLocationFrom?.district ?? "")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                    .padding(0)
                                
                                Text(travellers.travellerLocationFrom?.upazila ?? "")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                    .padding(0)
                                
                                Text("Location To:")
                                    .foregroundColor(.customRed)
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .padding(.top)
                                
                                Text(travellers.travellerLocationTo?.division ?? "")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                    .padding(0)
                                
                                Text(travellers.travellerLocationTo?.district ?? "")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                    .padding(0)
                                
                                Text(travellers.travellerLocationTo?.upazila ?? "")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                    .padding(0)
                            } //: group
                        } //: vstack
                        .padding()
                    } //: button
                } //: nav link
            } //: list
        } //: vstack
        .onAppear {
            if travellerTravelFormModel.upazilaFrom != "" {
                self.upazilaFrom = "&upazilaFrom=\(travellerTravelFormModel.upazilaFrom)"
            }
            else { self.upazilaFrom = "" }
            if travellerTravelFormModel.upazilaTo != "" {
                self.upazilaTo = "&upazilaTo=\(travellerTravelFormModel.upazilaTo)"
            }
            else { self.upazilaTo = "" }
            
            findAvailableTravellers(accessToken: UserDefaults.standard.string(forKey: "accessToken") ?? "", URLString: String.findTravellersURL(divisionFrom: travellerTravelFormModel.divisionFrom, districtFrom: travellerTravelFormModel.districtFrom, upazilaFrom: self.upazilaFrom, divisionTo: travellerTravelFormModel.divisionTo, districtTo: travellerTravelFormModel.districtTo, upazilaTo: self.upazilaTo)) { response, error in
                if error == nil && response?.success == true {
                    self.availableTravellers = response
                }
            }
        }
    } //: view
    
    
    // find available travellers API request
    func findAvailableTravellers(accessToken: String, URLString: String, completion: @escaping (AvailableTravellersResponseDataModel?, Error?) -> ()) {
        
        guard let availableTravellersURL = URL(string: URLString) else {
            print("Available Travellers URL Invalid")
            return
        }
        
        let headers: HTTPHeaders = ["Authorization": "Bearer \(accessToken)", "Content-Type": "application/json"]
        
        do {
            let request = try URLRequest(url: availableTravellersURL, method: .get, headers: headers)
            AF.request(request).responseDecodable(of: AvailableTravellersResponseDataModel.self) { data in
                if data.value?.success == true && data.value?.availableTravellersData != nil  {
                    completion(data.value, data.error)
                }
            }
        } catch {
            print("Could Not Get Shipping Process Data")
        }
    }
}


struct AvailableTravellersListView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableTravellersListView()
    }
}

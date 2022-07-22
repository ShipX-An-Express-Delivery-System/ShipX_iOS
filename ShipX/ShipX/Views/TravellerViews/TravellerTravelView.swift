//
//  TravellerTravelView.swift
//  ShipX
//
//  Created by Fahim Rahman on 15/7/22.
//

import SwiftUI
import Alamofire

struct TravellerTravelView: View {
    
    @ObservedObject private var travellerTravelFormModel = TravellerTravelFormViewModel.shared
    
    @State private var showingAlert = false
    @State private var responseMessage = String()
    @State private var alertTitle = String()
    
    @State private var divisionFromButtonPressed = false
    @State private var districtFromButtonPressed = false
    @State private var upazilaFromButtonPressed = false
    @State private var cityCorpAreaFromButtonPressed = false
    
    @State private var divisionToButtonPressed = false
    @State private var districtToButtonPressed = false
    @State private var upazilaToButtonPressed = false
    @State private var cityCorpAreaToButtonPressed = false
    
    @State var searchURL: String = String()
    @State var navigationTitle: String = String()
    
    // view
    var body: some View {
        // vstack
        VStack(spacing: 0) {
            // vstack
            VStack(alignment: .center) {
                // group
                Group {
                    Image("shipxlogo")
                        .padding(.top, 5)
                    Spacer()
                } //: group
            } //: vstack
            
            // vstack
            VStack(alignment: .leading) {
                // group
                Group {
                    // hstack
                    HStack(spacing: 0) {
                        Text("I'm going to travel, From:")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.customRed)
                            .padding()
                        
                        Spacer()
                        
                        Button {
                            print("Clear all fields button pressed")
                            self.travellerTravelFormModel.clear()
                        } label: {
                            Image(systemName: "clear.fill")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(.customRed)
                                .padding(10)
                        }
                    } //: hstack
                    
                    // hstack
                    HStack {
                        Text("Division:              ")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            //.foregroundColor(.customRed)
                            .padding(10)
                        
                        Text(travellerTravelFormModel.divisionFrom)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .padding(10)
                        
                        Spacer()
                        
                        // nav link
                        NavigationLink(destination: LocationSearchViewFrom(navigationTitle: $navigationTitle, searchURL: $searchURL), isActive: $divisionFromButtonPressed) {
                            Button {
                                // division from action
                                print("Division From Button Pressed")
                                self.navigationTitle = "Search Division"
                                self.searchURL = String.divisionURL()
                                self.divisionFromButtonPressed = true
                            } label: {
                                Image(systemName: "arrow.right")
                            }
                            .padding(10)
                        } //: nav link
                    } //: hstack
                    
                    Divider()
                    
                    // hstack
                    HStack {
                        Text("District:                ")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            //.foregroundColor(.customRed)
                            .padding(10)
                        
                        Text(self.travellerTravelFormModel.districtFrom)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .padding(10)
                        
                        Spacer()
                        
                        // nav link
                        NavigationLink(destination: LocationSearchViewFrom(navigationTitle: $navigationTitle, searchURL: $searchURL), isActive: $districtFromButtonPressed) {
                            Button {
                                // district from action
                                print("District From Button Pressed")
                                self.navigationTitle = "Search District"
                                self.searchURL = String.districtURL()
                                self.districtFromButtonPressed = true
                            } label: {
                                Image(systemName: "arrow.right")
                            }
                            .padding(10)
                        } //: nav link
                    } //: hstack
                    
                    Divider()
                    
                    // hstack
                    HStack {
                        Text("Upazila:                ")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            //.foregroundColor(.customRed)
                            .padding(10)
                        
                        Text(self.travellerTravelFormModel.upazilaFrom)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .padding(10)
                        
                        Spacer()
                        
                        // nav link
                        NavigationLink(destination: LocationSearchViewFrom(navigationTitle: $navigationTitle, searchURL: $searchURL), isActive: $upazilaFromButtonPressed) {
                            Button {
                                // upazila from action
                                print("Upazila From Button Pressed")
                                self.navigationTitle = "Search Upazila"
                                self.searchURL = String.upazilaURL()
                                self.upazilaFromButtonPressed = true
                            } label: {
                                Image(systemName: "arrow.right")
                            }
                            .padding(10)
                        } //: nav link
                    } //: hstack
                    
                    Divider()
                    
                    // hstack
                    HStack {
                        Text("City Corp. Area:")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            //.foregroundColor(.customRed)
                            .padding(10)
                        
                        Text(self.travellerTravelFormModel.cityCorpAreaFrom)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .padding(10)
                        
                        Spacer()
                        
                        // nav link
                        NavigationLink(destination: LocationSearchViewFrom(navigationTitle: $navigationTitle, searchURL: $searchURL), isActive: $cityCorpAreaFromButtonPressed) {
                            Button {
                                // city corp area from action
                                print("City Corp. Area From Button Pressed")
                                self.navigationTitle = "Search City Corp. Area"
                                self.searchURL = String.cityCorpURL()
                                self.cityCorpAreaFromButtonPressed = true
                            } label: {
                                Image(systemName: "arrow.right")
                            }
                            .padding(10)
                        } //: nav link
                    } //: hstack
                    
                    Divider()
                    
                    // hstack
                    HStack {
                        TextField("Additional Note: ", text: $travellerTravelFormModel.additionalNoteFrom)
                            .padding()
                    } //: hstack
                } //: group
                
                Divider()
                
                // group
                Group {
                    Text("To:")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.customRed)
                        .padding()
                    
                    // hstack
                    HStack {
                        Text("Division:              ")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            //.foregroundColor(.customRed)
                            .padding(10)
                        
                        Text(self.travellerTravelFormModel.divisionTo)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .padding(10)
                        
                        Spacer()
                        
                        // nav link
                        NavigationLink(destination: LocationSearchViewTo(navigationTitle: $navigationTitle, searchURL: $searchURL), isActive: $divisionToButtonPressed) {
                            Button {
                                // divsion to action
                                print("Division To Button Pressed")
                                self.navigationTitle = "Search Division"
                                self.searchURL = String.divisionURL()
                                self.divisionToButtonPressed = true
                            } label: {
                                Image(systemName: "arrow.right")
                            }
                            .padding(10)
                        } //: nav link
                    } //: hstack
                    
                    Divider()
                    
                    // hstack
                    HStack {
                        Text("District:                ")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            //.foregroundColor(.customRed)
                            .padding(10)
                        
                        Text(self.travellerTravelFormModel.districtTo)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .padding(10)
                        
                        Spacer()
                        
                        // nav link
                        NavigationLink(destination: LocationSearchViewTo(navigationTitle: $navigationTitle, searchURL: $searchURL), isActive: $districtToButtonPressed) {
                            Button {
                                // district to action
                                print("District To Button Pressed")
                                self.navigationTitle = "Search District"
                                self.searchURL = String.districtURL()
                                self.districtToButtonPressed = true
                            } label: {
                                Image(systemName: "arrow.right")
                            }
                            .padding(10)
                        } //: nav link
                    } //: hstack
                    
                    Divider()
                    
                    // hstack
                    HStack {
                        Text("Upazila:                ")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            //.foregroundColor(.customRed)
                            .padding(10)
                        
                        Text(self.travellerTravelFormModel.upazilaTo)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .padding(10)
                        
                        Spacer()
                        
                        // nav link
                        NavigationLink(destination: LocationSearchViewTo(navigationTitle: $navigationTitle, searchURL: $searchURL), isActive: $upazilaToButtonPressed) {
                            Button {
                                // upazila to action
                                print("Upazila To Button Pressed")
                                self.navigationTitle = "Search Upazila"
                                self.searchURL = String.upazilaURL()
                                self.upazilaToButtonPressed = true
                            } label: {
                                Image(systemName: "arrow.right")
                            }
                            .padding(10)
                        } //: nav link
                    } //: hstack
                    
                    Divider()
                    
                    // hstack
                    HStack {
                        Text("City Corp. Area:")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            //.foregroundColor(.customRed)
                            .padding(10)
                        
                        Text(self.travellerTravelFormModel.cityCorpAreaTo)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .padding(10)
                        
                        Spacer()
                        
                        // nav link
                        NavigationLink(destination: LocationSearchViewTo(navigationTitle: $navigationTitle, searchURL: $searchURL), isActive: $cityCorpAreaToButtonPressed) {
                            Button {
                                // upazila to action
                                print("City Corp. Area To Button Pressed")
                                self.navigationTitle = "Search City Corp. Area"
                                self.searchURL = String.cityCorpURL()
                                self.cityCorpAreaToButtonPressed = true
                            } label: {
                                Image(systemName: "arrow.right")
                            }
                            .padding(10)
                        } //: nav link
                    } //: hstack
                    
                    Divider()
                    
                    // hstack
                    HStack {
                        TextField("Additional Note: ", text: $travellerTravelFormModel.additionalNoteTo)
                            .padding()
                    } //: hstack
                } //: group
                Divider()
            } //: vstack
            
            // group
            Group {
                // vstack
                VStack {
                    Text("Travelling Time and Date")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.customRed)
                        .padding()
                    
                    DatePicker("", selection:$travellerTravelFormModel.travellingTimeAndDate, in: Date.now...)
                        .environment(\.timeZone, TimeZone(secondsFromGMT: 0)!)
                        .labelsHidden()
                        .padding()
                } //: vstack
            } //: group
            
            // button
            Button {
                // action
                print("Post Button Pressed")
                postTravellerTravelRequest()
            } label: {
                Text("Post")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.screenWidth - 50, height: 50, alignment: .center)
                    .background(Color.customRed)
                    .cornerRadius(10)
            } //: button
            .padding(30)
        } //: vstack
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .alert(self.alertTitle, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(responseMessage)
        }
    } //: view
    
    
    // post traveller travel post API request
    func postTravellerTravelRequest() {
        
        guard let travellerTravelURL = URL(string: String.travellerShippingRequestURL()) else {
            print("Traveller Travel URL Invalid")
            return
        }
        
        let parameters = TravellerTravelRequestModel(travellingTimeAndDate: Date().dateToString(fromDate: travellerTravelFormModel.travellingTimeAndDate),
                                                     isTravellerAvailable: true,
                                                     travellerLocationFrom: TravellerLocation(division: travellerTravelFormModel.divisionFrom, district: travellerTravelFormModel.districtFrom, upazila: travellerTravelFormModel.upazilaFrom, cityCorpArea: travellerTravelFormModel.cityCorpAreaFrom, additionalLocationNote: travellerTravelFormModel.additionalNoteFrom), travellerLocationTo: TravellerLocation(division: travellerTravelFormModel.divisionTo, district: travellerTravelFormModel.districtTo, upazila: travellerTravelFormModel.upazilaTo, cityCorpArea: travellerTravelFormModel.cityCorpAreaTo, additionalLocationNote: travellerTravelFormModel.additionalNoteTo))
        
        let headers: HTTPHeaders = ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessToken") ?? "")", "Content-Type": "application/json"]
        
        let request = AF.request(travellerTravelURL, method: .post, parameters: parameters, encoder: .json, headers: headers)
        
        request.responseDecodable(of: TravellerTravelResponseModel.self) { data in
            if data.value?.success == false {
                self.alertTitle = "Server Request Error!"
                self.responseMessage = data.value?.status ?? "Unknown Error"
                self.showingAlert = true
            }
            else {
                self.alertTitle = "Success!"
                self.responseMessage = data.value?.status ?? "Travelling request placed successfully"
                self.showingAlert = true
            }
        }
    }
}


struct TravellerTravelView_Previews: PreviewProvider {
    static var previews: some View {
        TravellerTravelView()
            .previewLayout(.sizeThatFits)
    }
}

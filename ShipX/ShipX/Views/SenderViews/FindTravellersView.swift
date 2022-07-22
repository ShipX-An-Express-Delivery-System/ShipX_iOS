//
//  FindTravellersView.swift
//  ShipX
//
//  Created by Fahim Rahman on 20/7/22.
//

import SwiftUI

struct FindTravellersView: View {
    
    @ObservedObject private var travellerTravelFormModel = TravellerTravelFormViewModel.shared
    
    @State private var divisionFromButtonPressed = false
    @State private var districtFromButtonPressed = false
    @State private var upazilaFromButtonPressed = false
    
    @State private var divisionToButtonPressed = false
    @State private var districtToButtonPressed = false
    @State private var upazilaToButtonPressed = false
    
    @State private var findTravellerButtonPressed = false
    
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
                        Text("Find Traveller, From:")
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
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        //.foregroundColor(.customRed)
                            .padding(10)
                        
                        Text(travellerTravelFormModel.divisionFrom)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
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
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        //.foregroundColor(.customRed)
                            .padding(10)
                        
                        Text(self.travellerTravelFormModel.districtFrom)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
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
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        //.foregroundColor(.customRed)
                            .padding(10)
                        
                        Text(self.travellerTravelFormModel.upazilaFrom)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
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
                } //: group
                
                // group
                Group {
                    Text("To:")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.customRed)
                        .padding()
                    
                    // hstack
                    HStack {
                        Text("Division:              ")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        //.foregroundColor(.customRed)
                            .padding(10)
                        
                        Text(self.travellerTravelFormModel.divisionTo)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
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
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        //.foregroundColor(.customRed)
                            .padding(10)
                        
                        Text(self.travellerTravelFormModel.districtTo)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
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
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        //.foregroundColor(.customRed)
                            .padding(10)
                        
                        Text(self.travellerTravelFormModel.upazilaTo)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
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
                } //: group
            } //: vstack
            
            // nav link
            NavigationLink(destination: AvailableTravellersListView(), isActive: $findTravellerButtonPressed) {
                // button
                Button {
                    // action
                    print("Find Travellers Button Pressed")
                    self.findTravellerButtonPressed = true
                } label: {
                    Text("Find Travellers")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.screenWidth - 50, height: 50, alignment: .center)
                        .background(Color.customRed)
                        .cornerRadius(10)
                } //: button
                .padding(30)
            } //: nav link
        } //: vstack
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    } //: view
}


struct FindTravellersView_Previews: PreviewProvider {
    static var previews: some View {
        FindTravellersView()
    }
}

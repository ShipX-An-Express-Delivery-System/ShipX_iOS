//
//  TravellerTravelView.swift
//  ShipX
//
//  Created by Fahim Rahman on 15/7/22.
//

import SwiftUI

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
}


struct TravellerTravelView: View {
    
    @ObservedObject private var travellerTravelFormModel = TravellerTravelFormViewModel.shared
    
    @State private var showingAlert = false
    @State private var responseMessage = String()
    @State private var alertTitle = String()
    
    @State var divisionFromButtonPressed = false
    @State var districtFromButtonPressed = false
    @State var upazilaFromButtonPressed = false
    @State var cityCorpAreaFromButtonPressed = false
    
    @State var divisionToButtonPressed = false
    @State var districtToButtonPressed = false
    @State var upazilaToButtonPressed = false
    @State var cityCorpAreaToButtonPressed = false
    
    @State var searchURL: String = String()
    @State var navigationTitle: String = String()
    
    // view
    var body: some View {
        // vstack
        VStack {
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
                    Text("I am going to travel, From:")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundColor(.customRed)
                        .padding()
                    
                    // hstack
                    HStack {
                        Text("Division:              ")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.customRed)
                            .padding(8)
                        
                        Text(travellerTravelFormModel.divisionFrom)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .padding(8)
                        
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
                            .padding(8)
                            .padding(.trailing, 10)
                        } //: nav link
                    } //: hstack
                    
                    Divider()
                    
                    // hstack
                    HStack {
                        Text("District:                ")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.customRed)
                            .padding(8)
                        
                        Text(self.travellerTravelFormModel.districtFrom)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .padding(8)
                        
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
                            .padding(8)
                            .padding(.trailing, 10)
                        } //: nav link
                    } //: hstack
                    
                    Divider()
                    
                    // hstack
                    HStack {
                        Text("Upazila:                ")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.customRed)
                            .padding(8)
                        
                        Text(self.travellerTravelFormModel.upazilaFrom)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .padding(8)
                        
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
                            .padding(8)
                            .padding(.trailing, 10)
                        } //: nav link
                    } //: hstack
                    
                    Divider()
                    
                    // hstack
                    HStack {
                        Text("City Corp. Area:")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.customRed)
                            .padding(8)
                        
                        Text(self.travellerTravelFormModel.cityCorpAreaFrom)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .padding(8)
                        
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
                            .padding(8)
                            .padding(.trailing, 10)
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
                Divider()
                
                // group
                Group {
                    Text("To:")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundColor(.customRed)
                        .padding()
                    
                    // hstack
                    HStack {
                        Text("Division:              ")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.customRed)
                            .padding(8)
                        
                        Text(self.travellerTravelFormModel.divisionTo)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .padding(8)
                        
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
                            .padding(8)
                            .padding(.trailing, 10)
                        } //: nav link
                    } //: hstack
                    
                    Divider()
                    
                    // hstack
                    HStack {
                        Text("District:                ")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.customRed)
                            .padding(8)
                        
                        Text(self.travellerTravelFormModel.districtTo)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .padding(8)
                        
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
                            .padding(8)
                            .padding(.trailing, 10)
                        } //: nav link
                    } //: hstack
                    
                    Divider()
                    
                    // hstack
                    HStack {
                        Text("Upazila:                ")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.customRed)
                            .padding(8)
                        
                        Text(self.travellerTravelFormModel.upazilaTo)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .padding(8)
                        
                        Spacer()
                        
                        // nav link
                        NavigationLink(destination: LocationSearchViewTo(navigationTitle: $navigationTitle, searchURL: $searchURL), isActive: $upazilaToButtonPressed) {
                            Button {
                                // upazila to action
                                print("Upazila To Button Pressed")
                                self.navigationTitle = "Search District"
                                self.searchURL = String.upazilaURL()
                                self.upazilaToButtonPressed = true
                            } label: {
                                Image(systemName: "arrow.right")
                            }
                            .padding(8)
                            .padding(.trailing, 10)
                        } //: nav link
                    } //: hstack
                    
                    Divider()
                    
                    // hstack
                    HStack {
                        Text("City Corp. Area:")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.customRed)
                            .padding(8)
                        
                        Text(self.travellerTravelFormModel.cityCorpAreaTo)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .padding(8)
                        
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
                            .padding(8)
                            .padding(.trailing, 10)
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
                Divider()
            } //: vstack
            
            // group
            Group {
                // vstack
                VStack {
                    Text("Travelling Time and Date")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
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
                print(travellerTravelFormModel.travellingTimeAndDate)
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
        .navigationBarTitleDisplayMode(.inline)
        .alert(self.alertTitle, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(responseMessage)
        }
    } //: view
}


struct TravellerTravelView_Previews: PreviewProvider {
    static var previews: some View {
        TravellerTravelView()
            .previewLayout(.sizeThatFits)
    }
}

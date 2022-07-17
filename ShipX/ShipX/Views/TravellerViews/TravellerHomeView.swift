//
//  TravellerHomeView.swift
//  ShipX
//
//  Created by Fahim Rahman on 14/7/22.
//

import SwiftUI

struct TravellerHomeView: View {
    
    @State private var selectedTab = "travel"
    
    // view
    var body: some View {
        // navigation view
        NavigationView {
            TabView(selection: $selectedTab) {
                ScrollView(showsIndicators: false) {
                    TravellerTravelView()
                }
                .clipped()
                .tabItem {
                    Label("Travel", systemImage: "bus")
                }
                .onTapGesture {
                    selectedTab = "travel"
                }
                TravellerRequestsView()
                    .tabItem {
                        Label("Requests", systemImage: "person.crop.rectangle.stack")
                    }
                    .onTapGesture {
                        selectedTab = "requests"
                    }
                
                Text("Details")
                    .tabItem {
                        Label("Details", systemImage: "newspaper")
                    }
                    .onTapGesture {
                        selectedTab = "details"
                    }
                
                Text("Profile")
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
                    .onTapGesture {
                        selectedTab = "profile"
                    }
            }
            .accentColor(.customRed)
        } //: navigation view
    } //: view
}


struct TravellerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TravellerHomeView()
    }
}

//
//  ShippingDetailsView.swift
//  ShipX
//
//  Created by Fahim Rahman on 20/7/22.
//

import SwiftUI

struct ShippingDetailsView: View {
    
    @State private var shippingDetailsData: [ShippingProcessData]?
    
    @State private var senderProfileData: ProfileDataResponseModel?
    @State private var receiverProfileData: ProfileDataResponseModel?
    @State private var travellerProfileData: ProfileDataResponseModel?
    
    @State private var hideViewBecauseOfNoData = true
    
    @State private var showingAlert = false
    @State private var responseMessage = String()
    @State private var alertTitle = String()
    
    var body: some View {
        
        // scroll view
        ScrollView(showsIndicators: false) {
            // group
            Group {
                // vstack
                VStack {
                    Text("Shipping Details")
                        .foregroundColor(.customRed)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .padding(.bottom)
                    
                    Divider()
                    
                    // sender group
                    Group {
                        // hstack
                        HStack {
                            Text("Sender Information")
                                .foregroundColor(.customRed)
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .padding()
                            Spacer()
                        } //: hstack
                        
                        Divider()
                        
                        // hstack
                        HStack {
                            // sender image
                            AsyncImage(url: URL(string: self.senderProfileData?.profileData?.photo?.url ?? "")) { image in
                                        image
                                          .resizable()
                                    } placeholder: {
                                        ProgressView()
                                            .progressViewStyle(.circular)
                                    }
                                    .frame(width: 60, height: 60, alignment: .center)
                                    .clipShape(Circle())
                                    .padding()
                                    .padding(.leading, 10)
                            
                            Spacer()
                            
                            // vstack
                            VStack(alignment: .trailing, spacing: 0) {
                                Text(self.senderProfileData?.profileData?.name ?? "")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .padding(5)
                                    .padding(.trailing, 10)
                                
                                Text(self.senderProfileData?.profileData?.phone ?? "")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .padding(5)
                                    .padding(.trailing, 10)
                                
                                Text(self.shippingDetailsData?.first?.senderEmail ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .padding(5)
                                    .padding(.trailing, 10)
                            } //: vstack
                        } //: hstack
                        Divider()
                    } //: sender group
                    .hidden(self.hideViewBecauseOfNoData)
                    
                    
                    // receiver group
                    Group {
                        // hstack
                        HStack {
                            Text("Receiver Information")
                                .foregroundColor(.customRed)
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .padding()
                            Spacer()
                        } //: hstack
                        
                        Divider()
                        
                        // hstack
                        HStack {
                            // receiver image
                            AsyncImage(url: URL(string: self.receiverProfileData?.profileData?.photo?.url ?? "")) { image in
                                        image
                                          .resizable()
                                    } placeholder: {
                                        ProgressView()
                                            .progressViewStyle(.circular)
                                    }
                                    .frame(width: 60, height: 60, alignment: .center)
                                    .clipShape(Circle())
                                    .padding()
                                    .padding(.leading, 10)
                            
                            Spacer()
                            
                            // vstack
                            VStack(alignment: .trailing, spacing: 0) {
                                Text(self.receiverProfileData?.profileData?.name ?? "")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .padding(5)
                                    .padding(.trailing, 10)
                                
                                Text(self.receiverProfileData?.profileData?.phone ?? "")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .padding(5)
                                    .padding(.trailing, 10)
                                
                                Text(self.shippingDetailsData?.first?.receiverEmail ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .padding(5)
                                    .padding(.trailing, 10)
                            } //: vstack
                        } //: hstack
                        Divider()
                    } //: receiver group
                    .hidden(self.hideViewBecauseOfNoData)
                    
                    
                    // traveller group
                    Group {
                        // hstack
                        HStack {
                            Text("Traveller Information")
                                .foregroundColor(.customRed)
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .padding()
                            Spacer()
                        } //: hstack
                        
                        Divider()
                        
                        // hstack
                        HStack {
                            // receiver image
                            AsyncImage(url: URL(string: self.travellerProfileData?.profileData?.photo?.url ?? "")) { image in
                                        image
                                          .resizable()
                                    } placeholder: {
                                        ProgressView()
                                            .progressViewStyle(.circular)
                                    }
                                    .frame(width: 60, height: 60, alignment: .center)
                                    .clipShape(Circle())
                                    .padding()
                                    .padding(.leading, 10)
                            
                            Spacer()
                            
                            // vstack
                            VStack(alignment: .trailing, spacing: 0) {
                                Text(self.travellerProfileData?.profileData?.name ?? "")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .padding(5)
                                    .padding(.trailing, 10)
                                
                                Text(self.travellerProfileData?.profileData?.phone ?? "")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .padding(5)
                                    .padding(.trailing, 10)
                                
                                Text(self.shippingDetailsData?.first?.travellerEmail ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .padding(5)
                                    .padding(.trailing, 10)
                            } //: vstack
                        } //: hstack
                        Divider()
                    } //: traveller group
                    .hidden(self.hideViewBecauseOfNoData)
                    
                    
                    // product info group
                    Group {
                        // hstack
                        HStack {
                            Text("Product Information")
                                .foregroundColor(.customRed)
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .padding()
                            Spacer()
                        } //: hstack
                        
                        Divider()
                        
                        // vstack
                        VStack(spacing: 10) {
                            // hstack
                            HStack {
                                Text("Shipping Status:")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .padding(.horizontal)
                                
                                Spacer()
                                
                                Text(self.shippingDetailsData?.first?.shippingStatus ?? "")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .foregroundColor(.customRed)
                                    .padding(.horizontal)
                            } //: hstack
                            // hstack
                            HStack {
                                Text("Payment Status:")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .padding(.horizontal)
                                
                                Spacer()
                                
                                Text(self.shippingDetailsData?.first?.isPaid ?? false ? "Paid" : "Pending")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .foregroundColor(.customRed)
                                    .padding(.horizontal)
                            } //: hstack
                            // hstack
                            HStack {
                                Text("Product Type:")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .padding(.horizontal)
                                
                                Spacer()
                                
                                Text(self.shippingDetailsData?.first?.productType ?? "")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .padding(.horizontal)
                            } //: hstack
                            // hstack
                            HStack {
                                Text("Shipping Cost:")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .padding(.horizontal)
                                
                                Spacer()
                                
                                Text("\(self.shippingDetailsData?.first?.shippingCost ?? "") BDT")
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .padding(.horizontal)
                            } //: hstack
                            
                            Divider()
                            
                            // hstack
                            HStack {
                                Text("Delivery Location:")
                                    .font(.system(size: 13, weight: .bold, design: .rounded))
                                    .padding(.horizontal)
                                
                                Spacer()
                                
                                VStack(alignment: .trailing) {
                                    Text(self.shippingDetailsData?.first?.travellerLocationTo?.district ?? "")
                                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                                        .padding(.horizontal)
                                    Text(self.shippingDetailsData?.first?.travellerLocationTo?.district ?? "")
                                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                                        .padding(.horizontal)
                                    Text(self.shippingDetailsData?.first?.travellerLocationTo?.upazila ?? "")
                                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                                        .padding(.horizontal)
                                    Text(self.shippingDetailsData?.first?.travellerLocationTo?.cityCorpArea ?? "")
                                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                                        .padding(.horizontal)
                                    Text(self.shippingDetailsData?.first?.travellerLocationTo?.additionalLocationNote ?? "")
                                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                                        .padding(.horizontal)
                                }
                            } //: hstack
                        } //: vstack
                    } //: product info group
                    .hidden(self.hideViewBecauseOfNoData)
                    
                    Divider()
                    
                } //: vstack
            } //: group
            .alert(self.alertTitle, isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(responseMessage)
            }
            .onAppear {
                getShippingDetailsData()
            }
        } //: scroll view
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .tint(.black)
        .clipped()
    }
    
    
    // get shipping details API request
    func getShippingDetailsData() {
        getShippingProcessRequest(email: UserDefaults.standard.string(forKey: "email") ?? "", accessToken: UserDefaults.standard.string(forKey: "accessToken") ?? "", URLString: String.shippingProcessDataURL(), completion: { (response, error) in
            
            if error == nil && response?.success == true {
                self.shippingDetailsData = response?.shippingProcessData

                if self.shippingDetailsData?.count != 0 {
                    self.hideViewBecauseOfNoData = false
                    
                    // sender
                    getProfileDataRequest(email: self.shippingDetailsData?.first?.senderEmail ?? "", accessToken: UserDefaults.standard.string(forKey: "accessToken") ?? "") { (response, error) in
                        self.senderProfileData = response
                    }
                    
                    // receiver
                    getProfileDataRequest(email: self.shippingDetailsData?.first?.receiverEmail ?? "", accessToken: UserDefaults.standard.string(forKey: "accessToken") ?? "") { (response, error) in
                        self.receiverProfileData = response
                    }
                    
                    // traveller
                    getProfileDataRequest(email: self.shippingDetailsData?.first?.travellerEmail ?? "", accessToken: UserDefaults.standard.string(forKey: "accessToken") ?? "") { (response, error) in
                        self.travellerProfileData = response
                    }
                }
                else {
                    self.hideViewBecauseOfNoData = true
                }
            }
        })
    }
}


struct ShippingDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingDetailsView()
    }
}

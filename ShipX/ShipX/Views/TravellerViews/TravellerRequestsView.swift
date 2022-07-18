//
//  TravellerRequestsView.swift
//  ShipX
//
//  Created by Fahim Rahman on 17/7/22.
//

import SwiftUI
import Alamofire

struct TravellerRequestsView: View {
    
    @State var shippingProcessData: [ShippingProcessData]?
    
    @State private var shippingProcessId = String()
    
    @State private var showingAlert = false
    @State private var responseMessage = String()
    @State private var alertTitle = String()
        
    // view
    var body: some View {
        
        // vstack
        VStack {
            
            Text("Requests")
                .foregroundColor(.customRed)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding(.bottom)

            Divider()
            
            // list
            List(self.shippingProcessData ?? [ShippingProcessData](), id: \.id) { data in
                
                // vstack
                VStack(alignment: .leading, spacing: 0) {
                    // group
                    Group {
                        
                        Text("Sender Email:")
                            .foregroundColor(.customRed)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .padding(.top)
                        
                        Text(data.senderEmail ?? "")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .padding(.bottom)
                        
                        Text("Sender Location:")
                            .foregroundColor(.customRed)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        
                        Text(data.travellerLocationFrom?.division ?? "")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .padding(0)
                        
                        Text(data.travellerLocationFrom?.district ?? "")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .padding(0)
                        
                        Text(data.travellerLocationFrom?.upazila ?? "")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .padding(0)
                        
                        Text(data.travellerLocationFrom?.cityCorpArea ?? "")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .padding(0)
                        
                        Text(data.travellerLocationFrom?.additionalLocationNote ?? "")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .padding(.bottom)
                    } //: group
                    
                    // group
                    Group {
                        Text("Receiver Email:")
                            .foregroundColor(.customRed)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        
                        Text(data.receiverEmail ?? "")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .padding(.bottom)
                        
                        Text("Receiver Location:")
                            .foregroundColor(.customRed)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        
                        Text(data.travellerLocationTo?.division ?? "")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .padding(0)
                        
                        Text(data.travellerLocationTo?.district ?? "")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .padding(0)
                        
                        Text(data.travellerLocationTo?.upazila ?? "")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .padding(0)
                        
                        Text(data.travellerLocationTo?.cityCorpArea ?? "")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .padding(0)
                        
                        Text(data.travellerLocationTo?.additionalLocationNote ?? "")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .padding(.bottom)
                        
                    } //: group
                    
                    // group
                    Group {
                        Text("Shipping Time and Date")
                            .foregroundColor(.customRed)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        
                        Text(data.travellingTimeAndDate ?? "")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .padding(.bottom)
                        
                        Text("Tracking ID:")
                            .foregroundColor(.customRed)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        
                        Text(data.trackingID ?? "")
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .padding(.bottom)
                    } //: group
                    
                    // group
                    Group {
                        // hstack
                        HStack {
                            // button
                            Button {
                                // action
                                print("Accept Button Pressed")
                                self.shippingProcessId = data.id ?? ""
                                postAcceptRequest()
                                self.shippingProcessData?.removeAll()
                                getShippingProcess()
                            } label: {
                                Text("Accept")
                                    .frame(width: UIScreen.screenWidth / 3, height: 50, alignment: .center)
                                    .foregroundColor(.white)
                                    .background(Color.green)
                                    .cornerRadius(10)
                                    .padding()
                            } //: button
                            .buttonStyle(BorderlessButtonStyle())
                            
                            Spacer()
                            
                            // button
                            Button {
                                // action
                                print("Reject Button Pressed")
                                self.shippingProcessId = data.id ?? ""
                                postRejectRequest()
                                self.shippingProcessData?.removeAll()
                                getShippingProcess()
                            } label: {
                                Text("Reject")
                                    .frame(width: UIScreen.screenWidth / 3, height: 50, alignment: .center)
                                    .foregroundColor(.white)
                                    .background(Color.customRed)
                                    .cornerRadius(10)
                                    .padding()
                            } //: button
                            .buttonStyle(PlainButtonStyle())
                        } //: hstack
                    } //: group
                } //: vstack
            } //: list
            .onTapGesture { return }
        } //: vstact
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            getShippingProcess()
        }
        .alert(self.alertTitle, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(responseMessage)
        }
    } //: view
    
    
    // get shipping process API request
    func getShippingProcess() {
        getShippingProcessRequest(email: UserDefaults.standard.string(forKey: "email") ?? "", accessToken: UserDefaults.standard.string(forKey: "accessToken") ?? "", URLString: .shippingProcessDataURL(), completion: { response, error in
            if error == nil && response?.success == true {
                self.shippingProcessData = response?.shippingProcessData
            }
        })
    }
    
    
    // post accept API request
    func postAcceptRequest() {
        
        guard let acceptRequestURL = URL(string: String.acceptRequestURL()) else {
            print("Accept Request URL Invalid")
            return
        }
        
        let parameters = TravellerAcceptRejectRequestModel(shippingProcessID: self.shippingProcessId)
        
        let headers: HTTPHeaders = ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessToken") ?? "")", "Content-Type": "application/json"]
        
        let request = AF.request(acceptRequestURL, method: .post, parameters: parameters, encoder: .json, headers: headers)
        
        request.responseDecodable(of: TravellerAcceptResponseModel.self) { data in
            if data.value?.success == true {
                print("Request Accepted")
                self.alertTitle = "Server Request Success!"
                self.responseMessage = data.value?.status ?? "Accepted"
                self.showingAlert = true
            }
            else {
                print("Accept Failed")
                self.alertTitle = "Server Request Error!"
                self.responseMessage = data.value?.status ?? "Couldn't Accept"
                self.showingAlert = true
            }
        }
    }
    
    
    // post reject API request
    func postRejectRequest() {
        
        guard let rejectRequestURL = URL(string: String.rejectRequestURL()) else {
            print("Reject Request URL Invalid")
            return
        }
        
        let parameters = TravellerAcceptRejectRequestModel(shippingProcessID: self.shippingProcessId)
        
        let headers: HTTPHeaders = ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessToken") ?? "")", "Content-Type": "application/json"]
        
        let request = AF.request(rejectRequestURL, method: .post, parameters: parameters, encoder: .json, headers: headers)
        
        request.responseDecodable(of: TravellerAcceptResponseModel.self) { data in
            if data.value?.success == true {
                print("Request Rejected")
                self.alertTitle = "Server Request Success!"
                self.responseMessage = data.value?.status ?? "Rejected"
                self.showingAlert = true
            }
            else {
                print("Reject Failed")
                self.alertTitle = "Server Request Error!"
                self.responseMessage = data.value?.status ?? "Couldn't Reject"
                self.showingAlert = true
            }
        }
    }
}


struct TravellerRequestsView_Previews: PreviewProvider {
    static var previews: some View {
        TravellerRequestsView()
    }
}

//
//  SenderRequestView.swift
//  ShipX
//
//  Created by Fahim Rahman on 21/7/22.
//

import SwiftUI
import Alamofire

struct SenderRequestView: View {

    let shippingProcessId: String
    
    @State var receiverEmail = String()
    
    @State private var showingAlert = false
    @State private var responseMessage = String()
    @State private var alertTitle = String()
    
    @State private var selectedIndex = 0
    
    let productTypes = ["Documents", "Packages", "Electronics", "Gifts", "Perishable", "Foods"]
    let shippingCosts = ["50", "70", "60", "40", "90", "100"]
    
    // view
    var body: some View {
        // vstack
        VStack(spacing: 0) {
            
            Text("Send Request")
                .foregroundColor(.customRed)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding(.bottom)
            
            Divider()
            
            // form
            Form {
                // section
                Section {
                    TextField("Receiver Email", text: $receiverEmail)
                } //: section
                // section
                Section {
                    // picker
                    Picker("Please choose a category", selection: $selectedIndex) {
                        // foreach
                        ForEach(0 ..< productTypes.count, id: \.self) {
                            Text(self.productTypes[$0])
                        } //: foreach
                    } //: picker
                } //: section
            } //: form
             
            // button
            Button {
                // send sender request button pressed
                print("Sender Request Button Pressed")
                postShippingRequest()
            } label: {
                Text("Send Request")
                    .frame(width: UIScreen.screenWidth - 50, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.customRed)
                    .cornerRadius(10)
                    .padding()
            } //: button
            Spacer()
        } //: vstack
        .alert(self.alertTitle, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(responseMessage)
        }
    } //: view
    

    // Post Shipping API request
    func postShippingRequest() {
        
        guard let senderShippingRequestURL = URL(string: String.senderShippingRequestURL()) else {
            print("Sender Shipping Request URL Invalid")
            return
        }
        
        let parameters = SenderShippingRequestModel(shippingProcessID: self.shippingProcessId, receiverEmail: self.receiverEmail, isPaid: true, requestForTraveller: true, productType: self.productTypes[self.selectedIndex], shippingCost: self.shippingCosts[self.selectedIndex])
        
        let headers: HTTPHeaders = ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessToken") ?? "")", "Content-Type": "application/json"]
        
        let request = AF.request(senderShippingRequestURL, method: .post, parameters: parameters, encoder: .json, headers: headers)
        
        request.responseDecodable(of: SenderShippingResponseModel.self) { data in
            if data.value?.success == true {
                print("Request Successful")
                self.alertTitle = "Server Request Success!"
                self.responseMessage = data.value?.status ?? "Request Successful"
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
}


struct SenderRequestView_Previews: PreviewProvider {
    static var previews: some View {
        SenderRequestView(shippingProcessId: "")
    }
}

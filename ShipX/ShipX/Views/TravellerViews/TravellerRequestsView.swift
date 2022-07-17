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
    
    // view
    var body: some View {
        
        // vstack
        VStack {
            
            Text("Requests")
                .foregroundColor(.customRed)
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .padding()
            
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
                            } label: {
                                Text("Reject")
                                    .frame(width: UIScreen.screenWidth / 3, height: 50, alignment: .center)
                                    .foregroundColor(.white)
                                    .background(Color.customRed)
                                    .cornerRadius(10)
                                    .padding()
                            } //: button
                            .buttonStyle(BorderlessButtonStyle())
                        } //: hstack
                    } //: group
                } //: vstack
            } //: list
        } //: vstact
        .navigationBarHidden(true)
        .onAppear {
            getShippingProcessRequest(email: UserDefaults.standard.string(forKey: "email") ?? "", accessToken: UserDefaults.standard.string(forKey: "accessToken") ?? "", completion: { response, error in
                if error == nil && response?.success == true {
                    self.shippingProcessData = response?.shippingProcessData
                }
            })
        }
    } //: view
}


struct TravellerRequestsView_Previews: PreviewProvider {
    static var previews: some View {
        TravellerRequestsView()
    }
}

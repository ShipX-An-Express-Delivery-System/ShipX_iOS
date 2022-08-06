//
//  ProfileView.swift
//  ShipX
//
//  Created by Fahim Rahman on 19/7/22.
//

import SwiftUI
import Alamofire
import PhotosUI

struct ProfileView: View {
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool?
    
    @ObservedObject private var travellerTravelFormModel = TravellerTravelFormViewModel.shared
    @State private var myProfileData: ProfileDataResponseModel?
    
    @State private var showingAlert = false
    @State private var responseMessage = String()
    @State private var alertTitle = String()
    
    @State private var inputImage: UIImage?
    @State private var showImagePicker = false
    
    @State private var totalEarned = ((Int.random(in: 60...100) * 15) / 100)
    
    // view
    var body: some View {
        // vstack
        VStack {
            
            Text("Profile")
                .foregroundColor(.customRed)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding(.bottom)
            
            Divider()
            
            // group
            Group {
                AsyncImage(url: URL(string: self.myProfileData?.profileData?.photo?.url ?? "")) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(Circle())
                .padding()
                .onTapGesture {
                    print("Tapped On Photo")
                    self.showImagePicker = true
                }
            } //: group
            
            Divider()
            
            // group
            Group {
                HStack {
                    Text("Name:")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .padding()
                    
                    Spacer()
                    
                    Text(self.myProfileData?.profileData?.name ?? "")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .padding()
                }
                HStack {
                    Text("Phone:")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .padding()
                    
                    Spacer()
                    
                    Text(self.myProfileData?.profileData?.phone ?? "")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .padding()
                }
                HStack {
                    Text("Email:")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .padding()
                    
                    Spacer()
                    
                    Text(self.myProfileData?.profileData?.email ?? "")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .padding()
                }
                HStack {
                    Text("Role:")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .padding()
                    
                    Spacer()
                    
                    Text(self.myProfileData?.profileData?.role?.capitalized ?? "")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .padding()
                }
                HStack {
                    Text("Total Earned:")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .padding()
                    
                    Spacer()
                    
                    Text("\(totalEarned) BDT")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .padding()
                }
            } //: group
            
            Divider()
            
            // group
            Group {
                // button
                Button {
                    // role changed button pressed
                    print("Switch Role Button Pressed")
                    self.travellerTravelFormModel.clear()
                    postLogoutRequest()
                } label: {
                    Text("Switch Role")
                        .foregroundColor(.black)
                        .frame(width: UIScreen.screenWidth - 50, height: 50, alignment: .center)
                        .background(Color.customBackground)
                        .cornerRadius(10)
                        .padding([.top, .horizontal])
                } //: button
                // button
                Button {
                    // logout button pressed
                    print("Logout Button Pressed")
                    self.travellerTravelFormModel.clear()
                    postLogoutRequest()
                } label: {
                    Text("Logout")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.screenWidth - 50, height: 50, alignment: .center)
                        .background(Color.customRed)
                        .cornerRadius(10)
                        .padding([.bottom, .horizontal])
                } //: button
            } //: group
            Spacer()
        } //: vstack
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .onAppear {
            // get profile data
            getProfileDataRequest(email: UserDefaults.standard.string(forKey: "email") ?? "", accessToken: UserDefaults.standard.string(forKey: "accessToken") ?? "") { response, error in
                if error == nil && response?.success == true {
                    self.myProfileData = response
                }
            }
            // demo price increase
            self.totalEarned += Int.random(in: 20...40)
        }
        .onChange(of: inputImage) { _ in uploadImage(uploadImageURL: String.uploadProfilePictureURL()) }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .alert(self.alertTitle, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(responseMessage)
        }
    } //: view
    
    
    // post logout API request
    func postLogoutRequest() {
        
        guard let logoutURL = URL(string: String.loginURL()) else {
            print("Logout URL Invalid")
            return
        }
        
        let parameters = ["email": UserDefaults.standard.string(forKey: "email"), "refreshToken": UserDefaults.standard.string(forKey: "refreshToken")]
        
        let request = AF.request(logoutURL, method: .post, parameters: parameters, encoder: .json)
        
        request.responseDecodable(of: LogoutResponseModel.self) { data in
            if data.value?.success == false {
                self.alertTitle = "Server Request Error!"
                self.responseMessage = data.value?.status ?? data.value?.status ?? "Unknown Error"
                self.showingAlert = true
            }
            else {
                print("Logged Out")
                self.isLoggedIn = false
            }
        }
    }
    
    
    // upload image
    func uploadImage(uploadImageURL: String) {
        
        guard let inputImage = inputImage else { return }
        
        let imageData = inputImage.jpegData(compressionQuality: 1)
        
        let headers: HTTPHeaders = ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessToken") ?? "")", "Content-Type": "multipart/form-data"]
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData!, withName: "image", fileName: "file.jpeg", mimeType: "image/jpeg")
        }, to: uploadImageURL, method: .post, headers: headers)
        .responseDecodable(of: ImageUploadResponseModel.self) { response in
            if response.value?.success == true {
                // get profile data
                getProfileDataRequest(email: UserDefaults.standard.string(forKey: "email") ?? "", accessToken: UserDefaults.standard.string(forKey: "accessToken") ?? "") { response, error in
                    if error == nil && response?.success == true {
                        self.myProfileData = response
                    }
                }
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

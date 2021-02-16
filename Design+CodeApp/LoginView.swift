//
//  LoginView.swift
//  Design+CodeApp
//
//  Created by Matthew Garlington on 2/15/21.
//

import SwiftUI

struct LoginView: View {

    @State var email = ""
    @State var password = ""
    @State var isFocused = false
    @State var showAlert = false
    @State var alertMessage = "Something Went Wrong"
    
    
    func hideKeyBoard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
    }
    
    var body: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            
            ZStack(alignment: .top) {
           
                
                Color("background2")
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .edgesIgnoringSafeArea(.bottom)
                
                CoverView()
                
                VStack {
                    HStack {
                        
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)))
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
                            .padding(.leading)
                            
                        
                        TextField("Your Email".uppercased(), text: $email)
                            .keyboardType(.emailAddress)
                            .font(.subheadline)
                            .frame(height: 44)
                            .onTapGesture {
                                self.isFocused = true
                            }
                    }
                    Divider().padding(.leading, 80)
                  
                    HStack {
                        
                        Image(systemName: "lock.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)))
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
                            .padding(.leading)
                            
                        
                        SecureField("Password".uppercased(), text: $password)
                            .keyboardType(.default)
                            .font(.subheadline)
                            .frame(height: 44)
                            .onTapGesture {
                                self.isFocused = true
                            }
                       
                    }
                }
                .frame(height: 136)
                .frame(maxWidth: .infinity)
                .background(BlurView(style: .systemMaterial))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 20)
                .padding(.horizontal)
                .offset(y: 460)
                
              
                    HStack {
                        Text("Forgot password?")
                        
                        Spacer()
                        
                        Button(action: {
                            
                            self.showAlert = true
                            
                            // This allows the KeyBoard and Full screen when Login is hit to show alert and nothing else 
                            self.hideKeyBoard()
                            self.isFocused = false
                            
                        }) {
                        Text("Log in")
                    }
                        .padding(12)
                        .padding(.horizontal, 30)
                        .background(Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
                        .alert(isPresented: $showAlert, content: {
                            Alert(title: Text("Error"), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
                        })
                    
                }
                
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding()
                
            }
            // This moves the entire screen up to focus on the text and password field
            .offset(y: isFocused ? -300 : 0)
            // This helps fix the bug presented where the animation for the parlax effect stutters after isFocused is set from true to false
            .animation(isFocused ? .easeInOut : nil)
            .onTapGesture {
                self.isFocused = false
                // This gives the ability to hide the keyboard upon clicking outside of the email text field through the function created
                self.hideKeyBoard()
            }
        }
       
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CoverView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var isDragging = false
    var body: some View {
        VStack {
            GeometryReader { geomtry in
                Text("Learn design & Code.\nFrom scratch.")
                    .font(.system(size: geomtry.size.width / 10, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: 375, maxHeight: 100)
            .padding(.horizontal, 16)
            .offset(x: viewState.width / 15, y: viewState.height / 15)
            
            Text("80 hours of courses for SwiftUI, React, and design tools.")
                .font(.subheadline)
                .frame(width: 250)
                .offset(x: viewState.width / 20, y: viewState.height / 20)
            
            
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(.top, 100)
        .frame(height: 477)
        .background(
            
            ZStack {
                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                    .offset(x: -150, y: -200)
                    // Added Rotation for the blob
                    .rotationEffect(Angle(degrees:  show ? 360 : 90))
                    .blendMode(.plusDarker)
                    // Animation Rotates
                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                    // Triggers the the show varible upon the blob appearing
                    .onAppear { self.show = true }
                
                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                    .offset(x: -200, y: -250)
                    .rotationEffect(Angle(degrees:  show ? 360 : 0), anchor: .leading)
                    .blendMode(.overlay)
                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
            }
            
        )
        .background(Image(uiImage: #imageLiteral(resourceName: "Card3"))
                        .offset(x: viewState.width / 15, y: viewState.height / 15),
                    alignment: .bottom)
        
        .background(Color(#colorLiteral(red: 0.4117647059, green: 0.4705882353, blue: 0.9725490196, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .scaleEffect(isDragging ? 0.9 : 1 )
        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
        .rotation3DEffect(
            Angle(degrees: 5),
            axis: (x: viewState.width, y: viewState.height, z: 0.0))
        
        .gesture(
            
            DragGesture().onChanged { value in
                self.viewState = value.translation
                self.isDragging = true
                
            }
            
            .onEnded { value in
                
                self.viewState = .zero
                self.isDragging = false
                
            }
            
        )
    }
}
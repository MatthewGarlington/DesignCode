//
//  LoginView.swift
//  Design+CodeApp
//
//  Created by Matthew Garlington on 2/15/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            Color("background2")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                GeometryReader { geomtry in
                    Text("Learn design & Code.\nFrom scratch.")
                        .font(.system(size: geomtry.size.width / 10, weight: .bold))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 375, maxHeight: 100)
                .padding(.horizontal, 16)
                
                Text("80 hours of courses for SwiftUI, React, and design tools.")
                    .font(.subheadline)
                    .frame(width: 250)
                   
                
                Spacer()
            }
            .multilineTextAlignment(.center)
            .padding(.top, 100)
            .frame(height: 477)
            .background(
                
                ZStack {
                    Image(uiImage: #imageLiteral(resourceName: "Blob"))
                                .offset(x: -150, y: -200)
                        .blendMode(.plusDarker)
                    
                    Image(uiImage: #imageLiteral(resourceName: "Blob"))
                                .offset(x: -200, y: -250)
                        .blendMode(.overlay)
                }
            
            )
            .background(Image(uiImage: #imageLiteral(resourceName: "Card3")), alignment: .bottom)
            .background(Color(#colorLiteral(red: 0.4117647059, green: 0.4705882353, blue: 0.9725490196, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .edgesIgnoringSafeArea(.top)
        }
       
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//
//  CourseList.swift
//  Design+CodeApp
//
//  Created by Matthew Garlington on 2/13/21.
//

import SwiftUI

struct CourseList: View {
  
    
    
    var body: some View {
        VStack {
            CourseView()
        }
   
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @State var show = false
  
    
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("SwiftUI Advanced")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color.white)
                    Text("20 Sections")
                        .foregroundColor(Color.white.opacity(0.7))
                }
                Spacer()
                Image(uiImage: #imageLiteral(resourceName: "Logo1"))
            }
            Spacer()
            Image(uiImage: #imageLiteral(resourceName: "Card2"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 140, alignment: .top)
        }
        .padding(show ? 30 : 20)
        .padding(show ? 30 : 0)
        .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity :  CGFloat(280))
        .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 20)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .onTapGesture {
            self.show.toggle()
        }
        .ignoresSafeArea(.all)
    }
}

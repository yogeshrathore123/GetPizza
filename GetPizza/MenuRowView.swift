//
//  MenuRowView.swift
//  GetPizza
//
//  Created by Yogesh Rathore on 28/01/25.
//

import SwiftUI

struct MenuRowView: View {
    
    var item: MenuItem
   // @State var rating: Int = 0
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            if let image = UIImage(named: "\(item.id)_sm") {
                Image(uiImage: image)
                    .clipShape(Circle())
                    .padding(.trailing, -20)
                    .padding(.leading, -15)
            } else {
                Image("surfboard_sm")
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.price, format: .currency(code: "INR"))
                }
                RatingsView(rating: item.rating)
            }
            
            Spacer()
        }
    }
}

#Preview {
    MenuRowView(item: testMenuItem)
}

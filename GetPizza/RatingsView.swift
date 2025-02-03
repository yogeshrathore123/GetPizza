//
//  RatingsView.swift
//  GetPizza
//
//  Created by Yogesh Rathore on 29/01/25.
//

import SwiftUI

struct RatingsView: View {
    
//    @Binding var rating: Int
    
    @State var rating: Int = 2
    
    var body: some View {
        HStack {
            
            ForEach(1...5, id: \.self) { index in
                Image(systemName: (index <= rating) ? "star.fill" : "star")
                    .font(.system(size: 20))
                    .foregroundStyle(LinearGradient(colors: [.white, .yellow, .orange], startPoint: .topTrailing, endPoint: .bottomLeading))
                    .onTapGesture {
                        rating = index
                    }
            }
        }
    }
}

#Preview {

    RatingsView(rating: 2)
}

//
//  OrderRowView.swift
//  GetPizza
//
//  Created by Yogesh Rathore on 28/01/25.
//

import SwiftUI

struct OrderRowView: View {
    
    @Binding var order: OrderItem
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(order.item.name)
                    .fontWeight(.regular)
                Text("\(order.quantity) @ \(order.item.price, format: .currency(code: "INR"))")
            }
            
            Spacer()
            Text(order.extPrice, format: .currency(code: "INR"))
                .fontWeight(.semibold)
        }
        .padding()
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 8)
        
       
    }
}

#Preview {
    OrderRowView(order: .constant(testOrderItem))
}

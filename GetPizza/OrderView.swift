//
//  OrderView.swift
//  GetPizza
//
//  Created by Yogesh Rathore on 28/01/25.
//

import SwiftUI

struct OrderView: View {
    
    @ObservedObject var orders: OrderModel
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                
                ScrollView {
                    ForEach($orders.orderItems) { order in
                        
                        OrderRowView(order: order)
                            .padding(.bottom, 5)
                            .padding([.leading, .trailing], 7)
                    }
                }
                .padding(.top, 70)
                
                HStack {
                    Text("Order Pizza")
                        .font(.title)
                    
                    Spacer()
                    
                 
                }
                .padding()
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 10)
                
                
                
            }
            .padding()
            
            Button("Delete Order") {
                if  !orders.orderItems.isEmpty {
                    orders.removeLast()
                }
            }
            .padding(10)
            .background(.regularMaterial, in: Capsule())
            .padding(7)
        }
        .background(Color("Surf"))
    }
}


#Preview {
    OrderView(orders: OrderModel())
}

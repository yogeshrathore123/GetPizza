//
//  OrderItemView.swift
//  GetPizza
//
//  Created by Yogesh Rathore on 03/02/25.
//

import SwiftUI

struct OrderItemView: View {
    
    @Binding var orderItem: OrderItem
    @State private var quantity = 1
    @State private var doubleIngredients: Bool = false
    @State var pizzaCrust: PizzaCrust
    
    init(orderItem: Binding<OrderItem>) {
        self._orderItem = orderItem
        self.pizzaCrust = orderItem.item.crust.wrappedValue
    }
    
    var body: some View {
        VStack {
            Toggle(isOn: $doubleIngredients) {
                Text("Double Ingredients" + (doubleIngredients ? " Yes" : " No"))
            }
            
            Stepper(value: $quantity, in: 1...10) {
                Text("\(quantity) " + (quantity == 1 ? "Pizza" : "Pizzas"))
            }
            
            Picker(selection: $pizzaCrust) {
                ForEach(PizzaCrust.allCases, id: \.self) { crust in
                    Text(crust.rawValue).tag(crust)
                }
            } label: {
                Text("Pizza Crust")
            }
            .pickerStyle(.menu)

            
            Text("Choose from Picker = \(pizzaCrust.rawValue)")
            
            Spacer()
        }
    }
}

#Preview {
    OrderItemView(orderItem: .constant(testOrderItem))
}

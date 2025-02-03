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
    @State private var name: String
    @State private var comments: String = ""
    
    init(orderItem: Binding<OrderItem>) {
        self._orderItem = orderItem
        self.pizzaCrust = orderItem.item.crust.wrappedValue
        self.name = orderItem.wrappedValue.name
    }
    
    var body: some View {
        VStack {
            
           // TextField("Name", text: $name)
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
    
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

            VStack {
                Text("comments").font(.caption)
                    .foregroundStyle(.secondary)
                TextEditor(text: $comments)
            }
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .shadow(radius: 1)
            
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    OrderItemView(orderItem: .constant(testOrderItem))
}

//
//  ContentView.swift
//  GetPizza
//
//  Created by Yogesh Rathore on 28/01/25.
//

import SwiftUI

struct ContentView: View {

    var menu:[MenuItem]
    @StateObject var orders: OrderModel = OrderModel()
    @State private var showOrders: Bool = false
    @State private var selectedItem: MenuItem = noMenuItem
    
    var body: some View {
        VStack {
            
            HeaderView()
                .shadow(radius: 5)
                .environment(\.colorScheme, .light)
                 
            StatusBarView(showOrders: $showOrders)
            
            if showOrders {
                OrderView(orders: orders)
            } else {
                MenuItemView(item: $selectedItem, orders: orders)
                    .padding(5)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                    
                MenuView(menu: menu, selectedItem: $selectedItem)
            }
            
            Spacer()
        }
        .padding()
        .background(LinearGradient(colors: [.cyan, Color("Surf"), Color("Sky"), .white], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orders)
        
    }
}

extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element { reduce(.zero, +) }
}

#Preview {
    ContentView(menu: MenuModel().menu)
}


//
//  MenuGridView.swift
//  GetPizza
//
//  Created by Yogesh Rathore on 03/02/25.
//

import SwiftUI

struct MenuGridView: View {
    
    @State private var favourite:[Int] = [-1]
    
    func menu(id: Int) -> MenuItem {
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }
    
    var menu: [MenuItem]
    @Binding var selectedItem: MenuItem
    
    let columnLayout = Array(repeating: GridItem(spacing: 16), count: 2)
    let columnLayout2 = Array(repeating: GridItem(), count: 5)
    
    @Namespace private var nSpace
    var body: some View {
        VStack {
            
            LazyVGrid(columns: columnLayout2) {
                ForEach(favourite.sorted(), id: \.self) { item in
                    FavoriteTileView(menuItem: menu(id: item))
                        .matchedGeometryEffect(id: item, in: nSpace)
                        .onTapGesture {
                            selectedItem = menu(id: item)
                        }
                        .onLongPressGesture {
                            if let index = favourite.firstIndex(where: {$0 == item}) {
                                favourite.remove(at: index)
                            }
                        }
                }
            }
            
            //Text("\(selectedItem.name)")
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(menu) { menu in
                        if !favourite.contains(menu.id) {
                            MenuItemTileView(menuItem: menu)
                                .matchedGeometryEffect(id: menu.id, in: nSpace)
                                .animation(.easeOut, value: favourite)
                                .onTapGesture(count: 2, perform: {
                                    if !favourite.contains(menu.id) {
                                        favourite.append(menu.id)
                                    }
                                })
                                .onTapGesture {
                                    selectedItem = menu
                                }
                                .onLongPressGesture {
                                    selectedItem = noMenuItem
                                }
                        }
                    }
                }
                
            }
            
        }
        .animation(.easeOut(duration: 0.5), value: favourite)
        .padding()
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu, selectedItem: .constant(testMenuItem))
}

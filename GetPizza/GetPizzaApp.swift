//
//  GetPizzaApp.swift
//  GetPizza
//
//  Created by Yogesh Rathore on 28/01/25.
//

import SwiftUI

@main
struct GetPizzaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(menu: MenuModel().menu)
        }
    }
}

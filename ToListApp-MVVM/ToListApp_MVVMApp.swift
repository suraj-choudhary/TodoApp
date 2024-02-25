//
//  ToListApp_MVVMApp.swift
//  ToListApp-MVVM
//
//  Created by suraj kumar on 19/02/24.
//

import SwiftUI

@main
struct ToListApp_MVVMApp: App {
    
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}

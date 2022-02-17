//
//  SwiftUIToDoListApp.swift
//  SwiftUIToDoList
//
//  Created by Caroline Davis on 17/2/22.
//

import SwiftUI

/* MVVM
 model - data points
 view - ui
 viewmodel moanages models for view
 */

@main
struct SwiftUIToDoListApp: App {

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

//
//  ItemModel.swift
//  SwiftUIToDoList
//
//  Created by Caroline Davis on 17/2/22.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}

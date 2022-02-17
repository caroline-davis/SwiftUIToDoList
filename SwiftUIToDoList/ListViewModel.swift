//
//  ListViewModel.swift
//  SwiftUIToDoList
//
//  Created by Caroline Davis on 17/2/22.
//

import Foundation

class ListViewModel: ObservableObject {

    @Published var items: [ItemModel] = []

    init() {
        getItems()
    }

    func getItems() {
        let newItems = [
            ItemModel(title: "This is the first title", isCompleted: false),
            ItemModel(title: "This is the second title", isCompleted: true),
            ItemModel(title: "This is the third title", isCompleted: false),
        ]
        items.append(contentsOf: newItems)
    }

    // as onDelete needs an indexSet we can use this easily
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    // onMove needs this type from: IndexSet, to: Int so we can use this
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)

    }

}

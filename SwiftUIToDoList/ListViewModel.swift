//
//  ListViewModel.swift
//  SwiftUIToDoList
//
//  Created by Caroline Davis on 17/2/22.
//

import Foundation

/* CRUD
 Create
 Read
 Update
 Delete
 */

class ListViewModel: ObservableObject {

    // did set gets called anytime we change this items array
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"

    init() {
        getItems()
    }

    func getItems() {

        // unpack the json data
        // we want it to be the type of [itemModel] not an actual [itemModel] so we put .self
        // can combine both these into 1 guard let instead of 2
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }

        self.items = savedItems

    }

    // as onDelete needs an indexSet we can use this easily
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    // onMove needs this type from: IndexSet, to: Int so we can use this
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }

    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }

    // generally this type of data would be saved in coredata but this is how you save stuff in userdefaults. need to convert data to json
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue((encodedData), forKey: itemsKey)
        }
    }

}

//
//  ListView.swift
//  SwiftUIToDoList
//
//  Created by Caroline Davis on 17/2/22.
//

import SwiftUI

struct ListView: View {

    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first title", isCompleted: false),
        ItemModel(title: "This is the second title", isCompleted: true),
        ItemModel(title: "This is the third title", isCompleted: false),
    ]


    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List📝")
        .navigationBarItems(leading: EditButton(),
                            trailing:
                                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}

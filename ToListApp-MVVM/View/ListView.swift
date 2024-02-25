//
//  ListView.swift
//  ToListApp-MVVM
//
//  Created by suraj kumar on 19/02/24.
//

import SwiftUI
struct ListView: View {
    @EnvironmentObject var lisViewModel: ListViewModel

    var body: some View {
        ZStack {
            if lisViewModel.items.isEmpty {
                NoItemsView()
            } else {
                List {
                    ForEach(lisViewModel.items) { item in
                      ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    lisViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: lisViewModel.deleteItem)
                    .onMove(perform: lisViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink(destination: {
                AddView()
            }, label: {
                Text("Add")
            }))
        .navigationTitle("Todo List📝")
    }
}
#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}

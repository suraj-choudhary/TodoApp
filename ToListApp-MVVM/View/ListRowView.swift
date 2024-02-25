//
//  ListRowView.swift
//  ToListApp-MVVM
//
//  Created by suraj kumar on 19/02/24.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle": "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout){
    Group {
        ListRowView(item: ItemModel(title: "suraj", isCompleted: true))
        ListRowView(item: ItemModel(title: "suraj", isCompleted: false))
    }
}

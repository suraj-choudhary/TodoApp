//
//  ListViewModel.swift
//  ToListApp-MVVM
//
//  Created by suraj kumar on 21/02/24.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        
        didSet {
            saveItems()
        }
    }
    
    let itemKey: String = "item_list"
    
    init() {
       getItem()
    }
    
    /// Description
    func getItem() {
        
        guard let data = UserDefaults.standard.data(forKey: itemKey) else { return }
        
       guard let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        
        self.items = savedItem
        
        
    }
    
    /// Description
    /// - Parameter indexSet: indexSet description
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    /// Description
    /// - Parameters:
    ///   - from: from description
    ///   - to: to description
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    /// Description
    /// - Parameter title: title description
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    /// Description
    /// - Parameter item: item description
    func updateItem(item: ItemModel) {
//        let index = items.firstIndex { (existingItem) in
//            return existingItem.id == item.id
//        }
        
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    
    func saveItems() {
        
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedData, forKey: itemKey)
        }
    }
}

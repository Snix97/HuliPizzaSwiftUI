//
//  MenuGridView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 09/09/2024.
//

import SwiftUI

struct MenuGridView: View {
    
    var menu: [MenuItem]
    let columnLayout = Array(repeating: GridItem(spacing: 8), count: 3)
    
    // Not private
    @State var selectedItem: MenuItem = noMenuItem
    
    var body: some View {
        
            VStack {
                Text(selectedItem.name)
                ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(menu ) { item in
                        MenuItemTileView(menuItem: item)
                    }
                }
            }
        }
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu)
}

//
//  MenuViewTwo.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 12/09/2024.
//

import SwiftUI

struct MenuViewTwo: View {
    
    var menu: [MenuItem]
    @State private var selectedItem: MenuItem? = nil
    
    var body: some View {
        //NavigationSplitView requires a detailView
        NavigationSplitView {
            List(menu, selection: $selectedItem) { item in
                // Use navigationLink to determine the selection
                NavigationLink(value: item) {
                    MenuRowView(item: item)
                }
              }
            } detail: {
                MenuDetailView(item: $selectedItem)
            }
        }
}

#Preview {
    MenuViewTwo(menu: MenuModel().menu)
}

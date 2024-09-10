//
//  MenuGridView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 09/09/2024.
//

import SwiftUI

struct MenuGridView: View {
    
    @State private var favourites: [Int] = [-1]
    
    func menu(id: Int) -> MenuItem {
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }
    
    var menu: [MenuItem]
    let columnLayout = Array(repeating: GridItem(spacing: 8), count: 3)
    
    let columnLayout2 = Array(repeating: GridItem(spacing: 8), count: 5)
    
    // Not private
    @State var selectedItem: MenuItem = noMenuItem
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columnLayout2) {
            ForEach(favourites.sorted(), id:\.self  ) { item in
                FavoriteTileView(menuItem: menu(id: item))
                    .onLongPressGesture {
                        if let index = favourites.firstIndex(where: { $0 == item }) {
                            favourites.remove(at: index)
                        }
                    }
                }
            }
            Spacer()
            Text(selectedItem.name)
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(menu ) { item in
                        if !favourites.contains(item.id) {
                            MenuItemTileView(menuItem: item)
                        
                            // order matters here! doubleTap, singleTap then long press
                                .onTapGesture(count: 2) {
                                    if !favourites.contains(item.id) {
                                        //Animation conected to specific action
                                        //withAnimation(.easeInOut(duration: 4.0)) {
                                            favourites.append(item.id)
                                        //}
                                        
                                   }
                                }
                            
                                .onTapGesture {
                                    selectedItem = item
                                }
                                .onLongPressGesture {
                                    selectedItem = noMenuItem
                                }
                        }
                    }
                }
            }
        } 
        //Animation isn't linked to State changes, it has its own triggers. This is only 1 way! Another is to set it on a specific action e.g the tap - see above.
        .animation(.easeOut(duration: 0.6), value: favourites)
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu)
}

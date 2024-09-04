//
//  MenuView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct MenuView: View {
    
    var menu: [MenuItem]
    @Binding var selectedItem: MenuItem
    
    var body: some View {
        
        // The id: \.self part is required so that SwiftUI can identify array elements uniquely.  This was before using identifiable / binding
       /* ScrollView {
            ForEach(1...25,id:\.self){ item in
                MenuRowView(item: item)
            }
        } */
        
        //Need id:\.self as MenuCatergory isnt identifiable
        List(MenuCategory.allCases, id:\.self ) { category in
            
            //Put section around the ForEach to group Menu sections by category
            Section {
                //ForEach(menu) { item in
                ForEach(menu.filter({$0.category == category})) { item in
                    MenuRowView(item: item)
                    //Put gesture here to seect
                        .onTapGesture {
                            selectedItem = item
                        }
                }
            }  header: {
                Text(category.rawValue)
            }
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menu: MenuModel().menu, selectedItem: .constant(testMenuItem))
    }
}

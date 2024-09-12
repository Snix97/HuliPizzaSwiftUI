//
//  ContentView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct OrderListScreen: View {
    
    var menu: [MenuItem] //Static it never changes
    
    //@State private var orders: [OrderItem] = testOrders
    
    @StateObject var orders: OrderModel = OrderModel()
    
    //State shouldn't be changed externally hence add private
    @State private var showOrders: Bool = false
    
    @State private var selectedItem: MenuItem = noMenuItem
    
    //To swict between menuView and menuGridview
    @State private var presentGrid: Bool = false
    
    var body: some View {
        TabView {
            VStack{
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\ .colorScheme, .light )
                StatusBarView(showOrders: $showOrders, presentGrid: $presentGrid)
                MenuItemView(item: $selectedItem, orders: orders)
                    .padding(5)
                    .background(.thinMaterial, in:RoundedRectangle(cornerRadius: 12))
                
                if presentGrid {
                    MenuGridView(selectedItem: $selectedItem, menu: menu)
                } else {
                    MenuView(menu: menu, selectedItem: $selectedItem)
                }
               
            } .tabItem {
                Label("Menu", systemImage: "list.bullet")
            }
            VStack {
            //No param here it gets directly to the view due to using environment variable
            HeaderView()
                .shadow(radius: 5)
                .environment(\ .colorScheme, .light )
            StatusBarView(showOrders: $showOrders, presentGrid: $presentGrid)
    
 //           if showOrders {
                //$ sign means var is binding
                OrderView(orders: orders)
            } .tabItem {
                Label("Order", systemImage: "cart")
            }
        }
        .padding()
        .background(.linearGradient(colors: [.cyan, Color("Surf"), Color("Sky"), .white], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orders)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListScreen(menu: MenuModel().menu)
    }
}

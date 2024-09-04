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
    
    var body: some View {
        
        VStack {
            //No param here it gets directly to the view due to using environment variable
            HeaderView()
                .shadow(radius: 5)
                .environment(\ .colorScheme, .light )
            HStack {
                Text("\(orders.orderItems.count) Orders")
                Spacer()
                Button{
                    showOrders.toggle()
                } label:{
                    Image(systemName: showOrders ? "cart" : "menucard")
                        .font(.title2)
                }
            }
            .foregroundStyle(.white).font(.title2)
            
            if showOrders {
                //$ sign means var is binding
                OrderView(orders: orders)
            } else {
                MenuItemView(item: $selectedItem, orders: orders)
                    .padding(5)
                    .background(.thinMaterial, in:RoundedRectangle(cornerRadius: 12))
                MenuView(menu: menu, selectedItem: $selectedItem)
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

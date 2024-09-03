//
//  ContentView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct OrderListScreen: View {
    
    var orders = [1, 2, 3, 4, 6]
    
    var body: some View {
        
        VStack {
            
            HeaderView()
            OrderView(orders: orders)
            MenuItemView()
            MenuView()
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListScreen()
    }
}

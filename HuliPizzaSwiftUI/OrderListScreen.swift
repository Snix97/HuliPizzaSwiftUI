//
//  ContentView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct OrderListScreen: View {
    
    var orders = [1, 2, 3]
    
    var body: some View {
        VStack {
           // OrderView()
            ZStack {
                HeaderView()
            }
            Label{
                Text(59.99,format: .currency(code: "GBP"))
            }
            icon:{
            Image(systemName: orders.isEmpty ? "cart" : "cart.circle.fill")

           }
            
            HStack {
                //If no spacer here text will be centered
                //Spacer() //Makes trailing text
                Text("Order Pizza")
                    .font(.title)
                Spacer() //Makes Leading text
            }
            ScrollView{ //Good practise to use with ForEach
                ForEach(orders,id:\.self){ order in
                    HStack(alignment:.firstTextBaseline){
                        Text("Your Order item \(order)")
                        Spacer()
                        Text(19.90, format: .currency(code: "GBP"))
                    }
                }
                
            }
            VStack {
                //UIImage will be an optional
                if let image = UIImage(named:"0_lg") {
                    Image(uiImage: image)
                } else {
                    Image("surfboard_lg")
                }
                Text("Margherita")
                Text("Description")
            }
            ScrollView{
                //The id: \.self part is required so that SwiftUI can identify array elements uniquely
                ForEach(1...15,id:\.self){ item in
                    HStack(alignment:.top,spacing:15) {
                        if let image = UIImage(named:"\(item)_sm") {
                            Image(uiImage: image)
                        } else {
                            Image("surfboard_sm")
                        }
                        VStack(alignment:.leading) {
                            Text("Margherita")
                            Text("Description")
                        }
                    }
                }
            }
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

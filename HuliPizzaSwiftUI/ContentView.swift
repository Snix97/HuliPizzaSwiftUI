//
//  ContentView.swift
//  HuliPizzaSwiftUI
//
//  Created by Claire Roughan on 14/08/2024.
//

import SwiftUI

struct ContentView: View {
    var orders:[Int] = [1,2,3,4,6]
    
    var body: some View {
        VStack {
            
            
            ZStack {
                Image("surfBanner")
                    .resizable()
                    .scaledToFit()
                    Text("Huli Pizza Company")
                    .background()
            }
            Image(systemName: orders.isEmpty ? "cart" : "cart.circle.fill")
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
                        Text(19.90, format: .currency(code: "USD"))
                    }
                }
                
            }
            VStack {
                Image(systemName: "rectangle.fill").font(.largeTitle)
                Text("Margherita")
                Text("Description")
            }
            ScrollView{
                //The id: \.self part is required so that SwiftUI can identify array elements uniquely
                ForEach(1...25,id:\.self){ item in
                    HStack(alignment:.top,spacing:15) {
                        Image(systemName:"\(item).circle.fill").font(.largeTitle)
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
        ContentView()
            
    }
}

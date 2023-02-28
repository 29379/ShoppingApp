//
//  ContentView.swift
//  Shop255356
//
//  Created by stud on 16/01/2023.
//

import SwiftUI

struct ContentView: View {
        
    var d_gora: [String: Int] = ["tshirt1":1, "tshirt2":2]
    
    var d_dol: [String: Int] = ["dol1":1, "dol2":2]
    
    var m_gora: [String: Int] = ["tshirt1":1, "tshirt2":2]
    
    var m_dol: [String: Int] = ["dol1":1, "dol2":2]
    
    var a_zegarki: [String: Int] = ["zeg1":1, "zeg2":2]
    
    var a_czapki: [String: Int] = ["czapka1":1, "czapka2":2]
    
    
    @State private var showApp: Bool = false
    @State private var showCart: Bool = false
    @State private var chosenCategory: String = ""
    @State private var cart = [String: Int]()
    @State private var wholePrice: Int = 0
    
    func SaveToCart(name: String, price: Int){
        self.cart[name] = price
        wholePrice += price
    }
    
    func DeleteFromCart(name: String, price: Int){
        self.cart.removeValue(forKey: name)
        wholePrice -= price
    }
    
    func BuyStuff(){
        Text("buy things here")
    }
    
    var body: some View {
    
        if (!showApp){
             VStack{
                Image("logo")
                    .scaledToFit()
                    .foregroundColor(.accentColor)
                    .onTapGesture{self.showApp = true}
            }
            .padding()
            Text("Shop app - 255356")
        }
        else{
            if (!showCart){
                VStack {
                    HStack{
                        Menu("MENU") {
                            Button("Strona główna", action: {chosenCategory = ""})
                            Menu("Meskie") {
                                Button("Góra", action: {chosenCategory = "m_gora"})
                                Button("Dół", action: {chosenCategory = "m_dol"})
                            }
                            Menu("Damskie") {
                                Button("Góra", action: {chosenCategory = "d_gora"})
                                Button("Dół", action: {chosenCategory = "d_dol"})
                            }
                            Menu("Akcesoria") {
                                Button("Zegarki", action: {chosenCategory = "a_zegarki"})
                                Button("Czapki", action: {chosenCategory = "a_czapki"})
                            }
                            Button("Koszyk", action: {self.showCart = true})
                            
                        }
                
                    }
                    Image("logo")
                        .scaledToFit()
                        .foregroundColor(.accentColor)
                        .onTapGesture{self.showApp = true}
                    
                    // - - - - - - - - - - - - - - - - - - - - - - - - -
                    
                    
                    if (chosenCategory == "m_gora"){
                        //  Text("m_gora")
                        List{
                            
                            ForEach(m_gora.sorted(by: >), id: \.key) { key, value in
                                
                                VStack {
                                    
                                    Image(key)
                                        .resizable()
                                        .scaledToFit()
                                    Text(key)
                                    Text(String(value))
                                    Text("")
                                    Button("Dodaj do koszyka", action: {SaveToCart(name: key, price: value)})
                                    Text("")
                                }
                                
                            }
                        }
                    }
                    else if (chosenCategory == "m_dol"){
                        //  Text("m_dol")
                        List{
                            
                            ForEach(m_dol.sorted(by: >), id: \.key) { key, value in
                                
                                VStack {
                                    
                                    Image(key)
                                        .resizable()
                                        .scaledToFit()
                                    Text(key)
                                    Text(String(value) + "\n")
                                    Button("Dodaj do koszyka", action: {SaveToCart(name: key, price: value)})
                                    Text("")
                                }
                                
                            }
                        }
                    }
                    else if (chosenCategory == "d_gora"){
                        //  Text("d_gora")
                        List{
                            
                            ForEach(d_gora.sorted(by: >), id: \.key) { key, value in
                                
                                VStack {
                                    
                                    Image(key)
                                        .resizable()
                                        .scaledToFit()
                                    Text(key)
                                    Text(String(value) + "\n")
                                    Button("Dodaj do koszyka", action: {SaveToCart(name: key, price: value)})
                                    Text("")
                                }
                                
                            }
                        }
                    }
                    else if (chosenCategory == "d_dol"){
                        //  Text("d_dol")
                        List{
                            
                            ForEach(d_dol.sorted(by: >), id: \.key) { key, value in
                                
                                VStack {
                                    
                                    Image(key)
                                        .resizable()
                                        .scaledToFit()
                                    Text(key)
                                    Text(String(value) + "\n")
                                    Button("Dodaj do koszyka", action: {SaveToCart(name: key, price: value)})
                                    Text("")
                                }
                                
                            }
                        }
                    }
                    else if (chosenCategory == "a_zegarki"){
                        //  Text("a_zegarki")
                        List{
                            
                            ForEach(a_zegarki.sorted(by: >), id: \.key) { key, value in
                                
                                VStack {
                                    
                                    Image(key)
                                        .resizable()
                                        .scaledToFit()
                                    Text(key)
                                    Text(String(value) + "\n")
                                    Button("Dodaj do koszyka", action: {SaveToCart(name: key, price: value)})
                                    Text("")
                                }
                                
                            }
                        }
                    }
                    else if (chosenCategory == "a_czapki"){
                        //  Text("a_czapki")
                        List{
                            
                            ForEach(a_czapki.sorted(by: >), id: \.key) { key, value in
                                
                                VStack {
                                    
                                    Image(key)
                                        .resizable()
                                        .scaledToFit()
                                    Text(key)
                                    Text(String(value) + "\n")
                                    Button("Dodaj do koszyka", action: {SaveToCart(name: key, price: value)})
                                    Text("")
                                }
                                
                            }
                        }
                    }
                    
                }
            }
            else{
                List{
                    ForEach(cart.sorted(by: >), id: \.key) { key, value in
                        VStack {
                            Image(key)
                                .resizable()
                                .scaledToFit()
                            Text(key)
                            Text(String(value) + "\n")
                            Button("Usuń z koszyka", action: {DeleteFromCart(name: key, price: value)})
                        }
                    }
                }
                Button("Powrót do sklepu", action: {self.showCart = false})
                Text("Do zapłacenia: " + String(wholePrice))
                Button("Sfinalizuj płatność", action: {BuyStuff()})
            }
        }
        
    }
}

    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


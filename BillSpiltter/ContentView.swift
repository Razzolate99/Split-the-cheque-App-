//
//  ContentView.swift
//  BillSpiltter
//
//  Created by Aaron Ward on 2022-12-02.
//

import SwiftUI

struct ContentView: View {
    @State private var chequeAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson: Double {
        // Calculations
        // Converting types
        let peopleCount = Double(numberOfPeople + 2) // +2 Since
        let tipSelected = Double(tipPercentage)
        
        let tipValue = chequeAmount / 100 * tipSelected
        let grandTotal = chequeAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var body: some View {
            NavigationView {
                Form{
                    Section{
                        TextField("Amount", value: $chequeAmount, format:
                                .currency(code: Locale.current.currencyCode ?? "CAD"))
                        .keyboardType(.decimalPad)
                        
                        Picker("Number of people", selection: $numberOfPeople){
                            ForEach(2..<100){
                                Text("\($0) people")
                            }
                        }
                    }
                    
                    Section{
                        Picker("Tip Pecentage", selection: $tipPercentage){
                            ForEach(tipPercentages, id: \.self){
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                        
                    } header: {
                        Text("Tip percentage?")
                            .textCase(nil)
                            .font(.system(size: 18))
                    }

                    

                    
                    Section{
                        Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "CAD "))
                    }
                }
                .navigationTitle("We Split")
                .navigationBarTitleDisplayMode(.inline)
                
                
                
                
            }

}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

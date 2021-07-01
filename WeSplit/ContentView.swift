//
//  ContentView.swift
//  WeSplit
//
//  Created by Theodore Mantz on 7/1/21.
//

import SwiftUI

struct ContentView: View {
//    Initialize the view with default state variables
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
//    Array of acceptable tip percentages
    let tipPercentages = [10, 15, 20, 25, 0]
    
//    Variable returning type Double
    var totalPerPerson: Double {
        
//        Conversion of user inputted values to type Double
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
//        Calculations to return amount per person
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
//        Return the calculated amount type: Double
        return amountPerPerson
    }
    
    var body: some View {
//        Add navigation view to provide buffer space at top of app
//        Additionally, navigation view allows for secondary views for Pickers
        NavigationView {
//            Form for user inputs
            Form {
//                Section for check amount, number of people
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
//                Picker for tip percentages, provided by ForEach statement
//                Which iterates over the tipPercentages array
                Section(header: Text("How much tip would you like to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
//                    Segmented Picker provides the horizontal view in place of
//                    new view for picker items
                    .pickerStyle(SegmentedPickerStyle())
                }
                
//                Section to display the calculated total per person
                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

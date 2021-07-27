//
//  ContentView.swift
//  Challenge day
//
//  Created by MAC on 11/5/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var nputValue = ""
    @State private var outputValue = ""
    @State private var nputunitValue = 2
    let inputUnit = ["meters" , "kilometers","feet","miles"]
    @State private var outunitValue = 2
    let outputUnit = ["meters", "kilometers" , "feet" , "miles"]
    
    
    
   
    var nputconvert : String {
        var output = ""
        var input = Measurement(value: 0, unit: UnitLength.meters)
        switch inputUnit[nputunitValue]{
        case "meters":
            input = Measurement(value: Double(nputValue) ?? 0, unit: UnitLength.meters)
        case "kilometers":
            input = Measurement(value: Double(nputValue) ?? 0, unit: UnitLength.kilometers)
        case "feet":
            input = Measurement(value: Double(nputValue) ?? 0, unit: UnitLength.feet)
            
        case "miles)":
            input = Measurement(value: Double(nputValue) ?? 0, unit: UnitLength.miles)
        default :
         input = Measurement(value: Double(nputValue) ?? 0, unit: UnitLength.miles)
            
        }
        switch outputUnit[outunitValue]{
        case "meters":
            output = String(describing: input.converted(to:UnitLength.meters))
        case "kilometers":
            output = String(describing: input.converted(to:UnitLength.kilometers))
        case "feet":
            output = String(describing: input.converted(to:UnitLength.feet))
            
        case "miles)":
            output = String(describing: input.converted(to:UnitLength.miles))
        default :
            output = String(describing: input.converted(to:UnitLength.meters))
            
        }
        return output
        
        
        
    }
    
    

    
    
   
    
    var body: some View {
        Form{
            Section{
                TextField("Value in Meter", text:$nputValue)
                    .keyboardType(.decimalPad)
            }
            Section{
                Picker("output unit",selection:$nputunitValue){
                    ForEach(0..<inputUnit.count){
                        Text("\(self.inputUnit[$0])")
                        
                    }
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                
            }
            Section{
                Picker("output unit",selection:$outunitValue){
                    ForEach(0..<outputUnit.count){
                        Text("\(self.outputUnit[$0])")
                        
                    }
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                
            }
            
            Section{
                Text("\(nputconvert  )")
                
            }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

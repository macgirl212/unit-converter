//
//  ContentView.swift
//  unit-converter
//
//  Created by Melody Davis on 1/11/23.
//

import SwiftUI

enum Units: String {
    case meters = "m"
    case kilometers = "km"
    case feet = "ft"
    case yards = "yd"
    case miles = "mi"
    
    static let allValues = [meters, kilometers, feet, yards, miles]
}

struct ContentView: View {
    @State private var initialValue: Double = 0
    @State private var initialUnit: Units = .feet
    @State private var convertedUnit: Units = .meters
    @FocusState private var isFocused: Bool
    
    var convertedValue: String {
        switch initialUnit {
        case .meters:
            return convertMiles(initialValue, to: convertedUnit)
        case .kilometers:
            return convertKilometers(initialValue, to: convertedUnit)
        case .feet:
            return convertFeet(initialValue, to: convertedUnit)
        case .yards:
            return convertYards(initialValue, to: convertedUnit)
        case .miles:
            return convertMiles(initialValue, to: convertedUnit)
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Initial Value", value: $initialValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                    Picker("Initial Unit", selection: $initialUnit) {
                        ForEach(Units.allValues, id: \.self) {
                            Text("\($0.rawValue.uppercased())")
                        }
                    } .pickerStyle(.segmented)
                        
                }
                Section {
                    Picker("Converted Unit", selection: $convertedUnit) {
                        ForEach(Units.allValues, id: \.self) {
                            Text("\($0.rawValue.uppercased())")
                        }
                    } .pickerStyle(.segmented)
                } header: {
                    Text("Please select the converted unit")
                }
                Section {
                    Text(convertedValue)
                } header: {
                    Text("New Measurement")
                }
            }
            .navigationTitle("Unit Converter")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
}

func convertMeters(_ meters: Double, to convertedUnit: Units) -> String {
    switch convertedUnit {
    case .meters:
        return "\(meters) meters"
    case .kilometers:
        return "\(meters * 0.001) kilometers"
    case .feet:
        return "\(meters * 3.280839895) feet"
    case .yards:
        return "\(meters * 1.0936132983) yards"
    case .miles:
        return "\(meters * 0.0006213712) miles"
    }
}

func convertKilometers(_ kilometers: Double, to convertedUnit: Units) -> String {
    switch convertedUnit {
    case .meters:
        return "\(kilometers * 1000) meters"
    case .kilometers:
        return "\(kilometers) kilometers"
    case .feet:
        return "\(kilometers * 3280.839895) feet"
    case .yards:
        return "\(kilometers * 1093.6132983) yards"
    case .miles:
        return "\(kilometers * 0.6213711922) miles"
    }
}

func convertFeet(_ feet: Double, to convertedUnit: Units) -> String {
    switch convertedUnit {
    case .meters:
        return "\(feet * 0.3048) meters"
    case .kilometers:
        return "\(feet * 0.0003048) kilometers"
    case .feet:
        return "\(feet) feet"
    case .yards:
        return "\(feet * 0.3333333333) yards"
    case .miles:
        return "\(feet * 0.0001893939) miles"
    }
}

func convertYards(_ yards: Double, to convertedUnit: Units) -> String {
    switch convertedUnit {
    case .meters:
        return "\(yards * 0.9144) meters"
    case .kilometers:
        return "\(yards * 0.0009144) kilometers"
    case .feet:
        return "\(yards * 3) feet"
    case .yards:
        return "\(yards) yards"
    case .miles:
        return "\(yards * 0.0005681818) miles"
    }
}

func convertMiles(_ miles: Double, to convertedUnit: Units) -> String {
    switch convertedUnit {
    case .meters:
        return "\(miles * 1609.344) meters"
    case .kilometers:
        return "\(miles * 1.609344) kilometers"
    case .feet:
        return "\(miles * 5280) feet"
    case .yards:
        return "\(miles * 1760) yards"
    case .miles:
        return "\(miles) miles"
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

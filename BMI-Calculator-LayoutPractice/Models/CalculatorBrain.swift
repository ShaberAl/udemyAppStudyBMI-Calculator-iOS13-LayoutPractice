//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by MacOS on 23.10.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        bmi?.color ?? .white
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        switch bmiValue {
        case ..<18.5:
            bmi = BMI(value: bmiValue, advice: "You need to gain more weight!", color: .systemBlue)
        case 18.5..<24.9:
            bmi = BMI(value: bmiValue, advice: "Just your normal weight.", color: .systemGreen)
        case 24.9...:
            bmi = BMI(value: bmiValue, advice: "Too much weight for you!", color: .systemRed)
        default:
            print("Something went terribly wrong!")
        }
    }
}

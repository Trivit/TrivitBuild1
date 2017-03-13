//
//  PeakCadenceArray.swift
//  TrivitBuild1
//
//  Created by TRIVIT on 3/13/17.
//  Copyright © 2017 TRIVIT. All rights reserved.
//


import UIKit

var str = "Hello, playground"

class PeakCadenceArray: NSObject {
    
    private var cadenceArray : [Double];
    
    override init() {
        cadenceArray = [Double](repeating: 0.0, count: 30)
    }
    
    func hasSpace() -> Bool {
        for i in cadenceArray {
            if i == 0.0 {
                return true;
            }
        }
        return false;
    }
    func addValue(data : Double) -> Bool {
        
        
        if (data <= min()) {
            return false;
        }
        cadenceArray.append(data);
        cadenceArray = cadenceArray.sorted().reversed()
        let kickOut = cadenceArray.remove(at: 30)
        return kickOut != data;
    }
    func printArray() {
        for i in cadenceArray {
            print(i)
        }
    }
    func printTop5() {
        for i in 0...4 {
            print(cadenceArray[i])
        }
    }
    func sizeInBounds() -> Bool {
        return cadenceArray.count == 30
    }
    
    func max() -> Double {
        return cadenceArray.max()!
    }
    func min() -> Double {
        return cadenceArray.min()!
    }
    func getArray() -> [Double] {
        return cadenceArray;
    }
}

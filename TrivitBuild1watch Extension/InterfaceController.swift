//
//  InterfaceController.swift
//  TrivitBuild1watch Extension
//
//  Created by TRIVIT on 3/12/17.
//  Copyright © 2017 TRIVIT. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion


class InterfaceController: WKInterfaceController {

    @IBOutlet var StepsCount: WKInterfaceLabel!
    @IBOutlet var CadenceCount: WKInterfaceLabel!
    @IBOutlet var PaceCount: WKInterfaceLabel!
    
    fileprivate let corePedometer = CMPedometer()
    
    var CadenceArray = PeakCadenceArray()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        self.StepsCount.setText("-")
        self.CadenceCount.setText("- m/s")
        self.PaceCount.setText("- sec/m")
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        startPedometerUpdates()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        self.corePedometer.stopUpdates()
    }

    func startPedometerUpdates(){
        
        /*
        
        if CMPedometer.isPaceAvailable() {
            corePedometer.startUpdates(from: Date()) { (data : CMPedometerData?, error) -> Void in
                if (error == nil) {
                    
                    
                    self.StepsCount.setText("\(data!.numberOfSteps)");
                    let dubFormat = ".2";
                    let cadence : Double;
                    let pace : Double;
                    if (data!.currentCadence != nil){
                        cadence = Double(data!.currentCadence!);
                        self.CadenceCount.setText("\(cadence.format(f: dubFormat)) m/s");
                    }
                    if data!.currentPace != nil {
                        pace = Double(data!.currentPace!);
                        self.PaceCount.setText("\(pace.format(f: dubFormat)) sec/m");
                    }
                    
                }
            }
        }
        
        */
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}
extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

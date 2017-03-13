//
//  ViewController.swift
//  TrivitBuild1
//
//  Created by TRIVIT on 3/12/17.
//  Copyright © 2017 TRIVIT. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var stepCount: UILabel!
    @IBOutlet weak var cadenceCount: UILabel!
    @IBOutlet weak var paceCount: UILabel!
    
    fileprivate let corePedometer = CMPedometer()
    
    fileprivate var steps = String()
    fileprivate var cadence = String()
    fileprivate var pace = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TEST")
        // Do any additional setup after loading the view, typically from a nib.
        self.stepCount.text = "-";
        self.cadenceCount.text = "- m/s";
        self.paceCount.text = "- sec/m";
        print("NOW")
        startPedometer();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startPedometer() {
        let date: Date = Date()
        let calendar: Calendar? = Calendar(identifier: Calendar.Identifier.gregorian)
        let startDate = calendar!.startOfDay(for: date)
        print("HERE")
        
        corePedometer.startUpdates(from: Date()) { (data : CMPedometerData?, error) -> Void in
            if(error == nil){
                //print(data?.numberOfSteps ?? "Data not available")
                //self.steps = "Steps : \(data!.numberOfSteps)\n";
                self.stepCount.text = "\(data!.numberOfSteps)";
                // self.cadence = "Cadence : \(data!.currentCadence!)m/s\n"
                self.cadenceCount.text = "\(data!.currentCadence)";
                // self.pace = "Pace : \(data!.currentPace!)sec/m\n"
                self.paceCount.text = "\(data!.currentPace)";
            }
            else{
                print("Error in query: \(error!)")
            }
        }
/*
       if CMPedometer.isStepCountingAvailable() {
           self.corePedometer.startUpdates(from: startDate, withHandler: { (data: CMPedometerData?, error: NSError?) -> Void in
               DispatchQueue.main.async( execute: { () -> Void in
                
                print("HELLO");
                    if error == nil{

                        //self.steps = "Steps : \(data!.numberOfSteps)\n";
                        self.stepCount.text = "\(data!.numberOfSteps)";
                       // self.cadence = "Cadence : \(data!.currentCadence!)m/s\n"
                        self.cadenceCount.text = "\(data!.currentCadence)";
                       // self.pace = "Pace : \(data!.currentPace!)sec/m\n"
                        self.paceCount.text = "\(data!.currentPace)";
                    }

                })
            } as! CMPedometerHandler)
        }
 
        let cal = Calendar.current
        _ = cal.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
        
        if(CMPedometer.isStepCountingAvailable()){
            print("is available")
            self.corePedometer.queryPedometerData(from: startDate, to: Date()) { (data: CMPedometerData? , error) -> Void in
                print(data!.numberOfSteps)
                DispatchQueue.main.async(execute: { () -> Void in
                    if(error == nil){
                        //self.steps = "Steps : \(data!.numberOfSteps)\n";
                        self.stepCount.text = "\(data!.numberOfSteps)";
                        // self.cadence = "Cadence : \(data!.currentCadence!)m/s\n"
                        self.cadenceCount.text = "0";
                        // self.pace = "Pace : \(data!.currentPace!)sec/m\n"
                        self.paceCount.text = "\(data!.averageActivePace!)";

                    }
                })
            }
        } */
        
        
    }

}


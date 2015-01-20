//
//  ViewController.swift
//  Stopwatch
//
//  Created by Vignesh Ravichandran on 1/14/15.
//  Copyright (c) 2015 Prankster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var hours: UILabel!
    @IBOutlet var minutes: UILabel!
    @IBOutlet var seconds: UILabel!
    
    var countHours = 0
    var countMinutes = 0
    var countSeconds = 0
    var timer:NSTimer!
    
    let Log = "Stopwatch"
    
    @IBAction func startStopWatch(sender: AnyObject) {
        
        println(Log + ": " + "Entered startStopWatch() \n")
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("run"), userInfo: nil, repeats: true)
        
        
    }
    
    @IBAction func resetStopWatch(sender: AnyObject) {
        
        println(Log + ": " + "Entered resetStopWatch() \n")
        
        countHours = 0
        countMinutes = 0
        countSeconds = 0
        
        hours.text = String(countHours)
        minutes.text = String(countMinutes)
        seconds.text = String(countSeconds)
    }
    
    @IBAction func stopStopwatch(sender: AnyObject) {
        
        println(Log + ": " + "Entered stopStopwatch() \n")
        
        timer.invalidate()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    func run(){
        println(Log + ": " + "Entered run() \n")
        
        if countSeconds < 59 {
                countSeconds++
                seconds.text = String(countSeconds)
        }
        
        else if countMinutes < 59 && countSeconds == 59  {
            
            countSeconds = 0
            seconds.text = String(countSeconds)
            
            countMinutes++
            minutes.text = String(countMinutes)
        }

        else if countHours < 12 && countMinutes == 59 && countSeconds == 59 {
            
            countSeconds = 0
            seconds.text = String(countSeconds)
            
            countMinutes = 0
            minutes.text = String(countMinutes)
            
            countHours++
            hours.text = String(countHours)
            
        }
        
        else{
            
            resetStopWatch(self)
            
        }
    
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  MusicPlayerSlider
//
//  Created by Dharmesh on 13/06/16.
//  Copyright © 2016 dharmesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewFirstBottom: UIView!
    @IBOutlet weak var viewSecondTop: UIView!
    @IBOutlet weak var viewSecond: UIView!
    
    @IBOutlet weak var layoutFirstBottomTop: NSLayoutConstraint!
    
    @IBOutlet var panFirst: UIPanGestureRecognizer!
    @IBOutlet var panSecond: UIPanGestureRecognizer!
    
    var lastChange : Double!
    var finalSpeed : CGPoint!
    
    //MARK: Memory Management Method
    
    override func didReceiveMemoryWarning() {
        
    }
    
    //------------------------------------------------------
    
    deinit { //same like dealloc in ObjectiveC
        
    }
    
    //------------------------------------------------------
    
    //MARK: PanGesture
    
    @IBAction func handlePan(recognizer: UIPanGestureRecognizer) {
     
        let location = recognizer.locationInView(self.view)
      
        let state: UIGestureRecognizerState = recognizer.state
        //let gestureTranslation: CGPoint = recognizer.translationInView(self.viewFirstBottom)
        let gestureVelocity: CGPoint = recognizer.velocityInView(viewFirstBottom)
      
        if state == .Changed {
            
            self.lastChange = CFAbsoluteTimeGetCurrent()
            layoutFirstBottomTop.constant = location.y
            
        }  else if state == .Ended {
           
            let curTime: Double = CFAbsoluteTimeGetCurrent()
            let timeElapsed: Double = curTime - lastChange
            
            if timeElapsed < 0.01 {
            
                if recognizer == panSecond {
                   
                     layoutFirstBottomTop.constant = UIScreen.mainScreen().bounds.height - viewFirstBottom.bounds.height
                }
                
            } else {
                
                if recognizer == panFirst{
                    
                    layoutFirstBottomTop.constant = -viewFirstBottom.bounds.height
                }
            }            
        }
    }
    
    //------------------------------------------------------
    
    //MARK: UIView Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutFirstBottomTop.constant = UIScreen.mainScreen().bounds.height - viewFirstBottom.bounds.height
    }
    
    //------------------------------------------------------
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //------------------------------------------------------
}



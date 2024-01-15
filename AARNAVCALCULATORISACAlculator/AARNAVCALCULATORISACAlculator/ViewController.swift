//
//  ViewController.swift
//  AARNAVCALCULATORISACAlculator
//
//  Created by Aarnav Koushik on 3/17/20.
//  Copyright © 2020 Aarnav Koushik. All rights reserved.
//

import UIKit

    
struct parenthesis{
    public var previous: Double = 0
     var operation: Int = 0
    
    init (
        previous2: Double? = 0,
        operation2: Int = 0
        
    ){
        self.previous = previous2!
        self.operation = operation2
    }
    mutating func restart(){
        previous=0
        operation=0
        
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var op: parenthesis = parenthesis()
    var reset = true
    var array1: [parenthesis] = []
    var current: Double = 0
    
    var condition =  false
    var savenum:Double = 0
    var previous2: Double = 0
    var op2: Int  =  0
    
    @IBOutlet weak var Output: UILabel!
    
    
    @IBAction func Pressnum(_ sender: UIButton) {

       if(reset) {
           current = 0
       }
       if(current != 0) {
           Output.text = Output.text! + String(sender.tag)
       } else {
           Output.text = String(sender.tag)
       }
       reset = false
       current = Double(Output.text!)!
        
    }
    
    
 
    @IBAction func ondivide(_ sender: UIButton) {
        
        operations();
        op.previous=current;
        
        reset = true
        op.operation = 10

        
    }
    
    
    @IBAction func onmultiiply(_ sender: UIButton) {
        operations();
               op.previous=current;
               
               reset = true
               op.operation = 11

        
    }
    
    
    
    @IBAction func onminues(_ sender: UIButton) {
        operations();
               op.previous=current;
               
               reset = true
               op.operation = 12

        
    }
    
    
    @IBAction func onadd(_ sender: UIButton) {
        operations();
               op.previous=current;
               
               reset = true
               op.operation = 13

        
    }
    
    func domath() -> Double{
        switch(op.operation){
        case 10:
            return op.previous/current
        case 11:
            return op.previous*current
        case 12:
            return op.previous-current
        case 13:
            return op.previous + current
            
        default:return 0
        }
        
    }
    
    func operations() {
        if op.operation != 0 {
            let ret :Double = domath()
            Output.text = String(ret)
            current = ret
            reset = true
            
        }
    }
    
    @IBAction func onequal(_ sender: UIButton) {
        current = Double(Output.text!)!
        operations()
        op.previous = 0
        op.operation = 0
    }
    
    
    
    @IBAction func onclear(_ sender: UIButton) {
      current = 0
      op.previous = 0
      reset = false
      op.operation = 0
      Output.text = "0"
        
    }
    
    
    
    @IBAction func openparenthisis(_ sender: UIButton) {
        array1.append(op)
        op.restart()
        
    }
    
    
    @IBAction func closeparethisis(_ sender: UIButton) {
        operations()
        op = array1.removeLast()
    
    }
    @IBAction func plusmines(_ sender: UIButton) {
        let ret = Double(Output.text!)! * -1
        Output.text = String(ret)
    
    
    
    
    
    
    
    }
    
    
    
    @IBAction func percent(_ sender: UIButton) {
        let ret = Double(Output.text!)! * 0.01
        Output.text = String(ret)
    }
    
    
    
    @IBAction func dot(_ sender: UIButton) {
        if(Output.text!.contains(".")) {
              } else {
                  Output.text = Output.text! + "."
                  if reset == true {
                      Output.text = "0."
                      reset = false
                  }
              }
            current = Double(Output.text!)!
          }
        
    }
    
    
    
    
    
    

    



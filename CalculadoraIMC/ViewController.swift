//
//  ViewController.swift
//  CalculadoraIMC
//
//  Created by José Luis de la Torre Pulido on 23/4/16.
//  Copyright © 2016 José Luis de la Torre Pulido. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var peso: UITextField!
    @IBOutlet weak var altura: UITextField!
    @IBOutlet weak var scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        peso.delegate=self
        altura.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldDidBeginEditing(textField: UITextField) {
        var punto : CGPoint
        punto = CGPointMake(0, textField.frame.origin.y - 50)
        self.scroll.setContentOffset(punto, animated: true)
    }
    
    @IBAction func textFieldDidEndEditing(textField: UITextField) {
        self.scroll.setContentOffset(CGPointZero, animated: true)
    }
    
    @IBAction func calcular(sender: AnyObject) {
        var IMC : Double
        let pesoLocal : Double
        pesoLocal = Double (self.peso.text!)!
        let estaturaLocal : Double = Double(self.altura.text!)!
        IMC = pesoLocal/(estaturaLocal*estaturaLocal)
        print("Tu IMC:\(IMC)")
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder() // ocultar teclado
    }
    
    @IBAction func bgTap(sender: UIControl){
        peso.resignFirstResponder()
        altura.resignFirstResponder()
    }


}


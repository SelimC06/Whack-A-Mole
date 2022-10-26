//
//  ViewController.swift
//  Whack-A-Mole
//
//  Created by Coskunuzer, Selim on 8/31/22.
//

import UIKit

class ViewController: UIViewController {
    
    var screenWidth = 0
    var screenHeight = 0
    var lblHorizontal = UILabel()
    var lblVertical = UILabel()
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Button: UIButton!
    var counter = 0
    var buttonPressed = false
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        print("Screen width = \(screenWidth), screen height = \(screenHeight)")
        
        // horizontal label, full screen width
        lblHorizontal.frame = CGRect(x: 20, y: 40, width: screenWidth-80, height: 50)
        lblHorizontal.backgroundColor = UIColor.blue
        lblHorizontal.text = "Screen width: \(screenWidth), Label width: \(screenWidth-40)"
        view.addSubview(lblHorizontal)
        
        // vertical label, full screen height
        
        
        self.view = view
        
        if (!buttonPressed){
            timer=Timer.scheduledTimer(timeInterval:5.0, target:self,selector:#selector(timerFunction),userInfo:nil, repeats:true)
        }else{
            buttonPressed = true
        }
        
    }
    
    override func viewDidLayoutSubviews() { super.viewDidLayoutSubviews()
        NSLog("bounds = \(self.view.bounds)")
        let screenBounds: CGRect = UIScreen.main.bounds
        
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        lblHorizontal.frame = CGRect(x: 0, y: 40, width: screenWidth-280, height: 50)
        lblHorizontal.text = String(counter)
        lblHorizontal.textAlignment = .center
        
        
    }
    @IBAction func Pressed(_ sender: Any) {
        counter+=1
        lblHorizontal.text = String(counter)
        buttonPressed = true
        let randomX = Int.random(in: 20..<300)
        let randomY = Int.random(in: 20..<600)
        Button.frame = CGRect(x:randomX, y:randomY, width: 90,  height: 50)
        if (!Image.isHidden){
            Image.isHidden = true
        }
    }
    
    @objc func timerFunction(_ sender: UIButton){
        let randomX = Int.random(in: 20..<300)
        let randomY = Int.random(in: 20..<600)
        Button.frame = CGRect(x:randomX, y:randomY, width: 90,  height: 50)
    }
}


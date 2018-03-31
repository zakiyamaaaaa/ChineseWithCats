//
//  TestViewController.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/10/02.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    var value = 150
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let progressValue:Float = Float(Float(value%100)/100)
        
        progressView.progress = progressValue
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func up(_ sender: Any) {
        let oldValue = value%100
        let newValue = oldValue + 20
        value += 20
        
        if newValue > 100{
            DispatchQueue.main.async {
                self.progressView.setProgress(1, animated: true)
                //レベルアップの画面へ遷移
                self.flag = true
                self.performSegue(withIdentifier: "segue", sender: nil)
                
//                self.progressView.setProgress(0.1, animated: true)
                
            }
            
        }else{
            progressView.setProgress(Float(Float(newValue)/100), animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SecondTestViewController
        vc.flag = flag
    }
    
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
        let vc = segue.source as! SecondTestViewController
        if vc.flag == true{
            progressView.progress = 0
            print("up")
        }else{
            progressView.progress = 1
            print("down")
        }
        
        let progressValue:Float = Float(Float(value%100)/100)
        progressView.setProgress(progressValue, animated: true)
    }
    
    @IBAction func down(_ sender: Any) {
        let oldValue = value/100
        let newValue = oldValue - 20
        value -= 20
        
        if newValue < 0{
            DispatchQueue.main.async {
                self.progressView.setProgress(0, animated: true)
                //レベルアップの画面へ遷移
                self.flag = false
                self.performSegue(withIdentifier: "segue", sender: nil)
                
                //                self.progressView.setProgress(0.1, animated: true)
                
            }
            
        }else{
            progressView.setProgress(Float(Float(newValue)/100), animated: true)
        }
    }

}

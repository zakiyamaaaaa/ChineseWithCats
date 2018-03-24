//
//  AppPurcaseTestViewController.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/10/11.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import UIKit

class AppPurcaseTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        IAPService.shared.getProducts()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        IAPService.shared.purchase(product: .nonConcumeblae)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

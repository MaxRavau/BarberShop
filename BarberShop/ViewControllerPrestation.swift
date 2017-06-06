//
//  ViewControllerPrestation.swift
//  BarberShop
//
//  Created by Maxime Ravau on 06/06/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit


class ViewControllerPrestation: UIViewController, BWWalkthroughViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
       
    }
    
  
    
    
    @IBAction func buttonShowPrestations() {
    
        
        let stb = UIStoryboard(name: "Main", bundle: nil)
        let walkthrough = stb.instantiateViewController(withIdentifier: "wok") as! BWWalkthroughViewController
        let page0 = stb.instantiateViewController(withIdentifier: "wok0") as UIViewController
        let page1 = stb.instantiateViewController(withIdentifier: "wok1") as UIViewController
        let page2 = stb.instantiateViewController(withIdentifier: "wok2") as UIViewController
        
        
        walkthrough.delegate = self
        walkthrough.add(viewController: page0)
        walkthrough.add(viewController: page1)
        walkthrough.add(viewController: page2)
        
        self.present(walkthrough, animated: true, completion: nil)
    
    }
    
}

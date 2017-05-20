//
//  ViewControllerHome.swift
//  BarberShop
//
//  Created by Maxime Ravau on 09/05/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit

class ViewControllerHome: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var imageLogoView: UIImageView!
    
    @IBOutlet var viewCoordonee: UIView!
    
    @IBOutlet var label1: UILabel!
   
    @IBOutlet var label2: UILabel!

    @IBOutlet var label3: UILabel!
    
    @IBOutlet var menuView: UIView!
    
    @IBOutlet var darkFillView: UIView!
    
    @IBOutlet var toggleMenuButton: UIButton!
    
    @IBOutlet var buttonInstagram: UIButton!
    
    @IBOutlet var buttonFacebook: UIButton!
    
    @IBOutlet var buttonTwitter: UIButton!
    
    @IBOutlet var viewCenterNumber: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        
        
               
    }
    
    func initUI(){
        
        
        effetVisual()
        
        label1.alpha = 0
        label2.alpha = 0
        label3.alpha = 0
        
        buttonTwitter.alpha = 0
        buttonFacebook.alpha = 0
        buttonInstagram.alpha = 0
        
        
    }
    
    @IBAction func toggleMenu(_ sender: UIButton) {
        
        if darkFillView.transform == .identity{
            UIView.animate(withDuration: 1, animations: {
                
                 self.darkFillView.transform = CGAffineTransform(scaleX: 11, y: 11)
                 self.menuView.transform = CGAffineTransform(translationX: 0, y: -67)
                self.toggleMenuButton.transform = CGAffineTransform(rotationAngle: self.radians(180))
                
            }) { (true) in
                
                UIView.animate(withDuration: 0.5, animations: {
                     self.toggleSharedButtons()
                })
                
        }
        
        }else{
        
        UIView.animate(withDuration: 1, animations: {
            self.darkFillView.transform = .identity
            self.menuView.transform = .identity
            self.toggleMenuButton.transform = .identity
            self.toggleSharedButtons()
        })
    }
}
    
    func toggleSharedButtons(){
        
        buttonTwitter.alpha = buttonTwitter.alpha == 0 ? 1 : 0
        buttonInstagram.alpha = buttonInstagram.alpha == 0 ? 1 : 0
        buttonFacebook.alpha = buttonFacebook.alpha == 0 ? 1 : 0
        
    }
    
    func radians(_ degrees: Double) -> CGFloat{
        
        return CGFloat(degrees * .pi / degrees)
        
    }
    
    func effetVisual(){
        
        viewCoordonee.layer.cornerRadius = 10
        viewCoordonee.layer.borderColor = UIColor.black.cgColor
        viewCoordonee.layer.borderWidth = 1
        
        imageLogoView.layer.cornerRadius = imageLogoView.frame.size.height / 2
        imageLogoView.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 1, animations: {
            
            self.label1.alpha = 1
        }) { (true) in
            
            self.showTitle1()
        }
        
        
    }

    
    func showTitle1(){
        
        UIView.animate(withDuration: 1, animations: {
            
            self.label2.alpha = 1
            
        }, completion: { (true) in
            
            self.showTitle2()
        })

        
    }
    
    func showTitle2(){
        
        UIView.animate(withDuration: 1, animations: {
            
            self.label3.alpha = 1
       
        })

        
        
    }
    
    
    func animateIn(){
        
        self.view.addSubview(viewCoordonee)
        viewCoordonee.center = self.viewCenterNumber.center
        
        viewCoordonee.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        viewCoordonee.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            
            
            self.viewCoordonee.alpha = 1
            self.viewCoordonee.transform = CGAffineTransform.identity
            
            
            
        }
        
    }
    
    func animateOut(){
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.viewCoordonee.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.viewCoordonee.alpha = 0
            
            
            
        }) { (success: Bool) in
            self.viewCoordonee.removeFromSuperview()
        }
    }

   
    @IBAction func buttonPhoneBar(_ sender: Any) {
        
        animateIn()
    }
  
    @IBAction func buttonViewDismiss(_ sender: Any) {
        
        animateOut()
    }
    @IBAction func buttonPhoneNumber(_ sender: Any) {
        
        var url: NSURL = NSURL(string: "tel://0983697787")!
        UIApplication.shared.openURL(url as URL)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}

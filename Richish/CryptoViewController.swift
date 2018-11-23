//
//  pickCrypto.swift
//  Richish
//
//  Created by Joy Paul on 11/8/18.
//  Copyright © 2018 Joy Paul. All rights reserved.
//

import UIKit

//protocol func
protocol getCrypto {
    func userChosenCrypto (crypto :String)
}


class cryptoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //declaring the delegate for this func
    var cryptoViewControllerDelegate : getCrypto?
    
    //passing back a specific string once a button is pressed via the IBAction
    @IBAction func btc(_ sender: UIButton) {
        cryptoViewControllerDelegate?.userChosenCrypto(crypto: "BTCUSD")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ltc(_ sender: UIButton) {
        cryptoViewControllerDelegate?.userChosenCrypto(crypto: "LTCUSD")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func eth(_ sender: UIButton) {//
        cryptoViewControllerDelegate?.userChosenCrypto(crypto: "ETHUSD")
        self.dismiss(animated: true, completion: nil)
    }
    
}


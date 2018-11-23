//
//  pickCrypto.swift
//  Richish
//
//  Created by Joy Paul on 11/8/18.
//  Copyright © 2018 Joy Paul. All rights reserved.
//

import UIKit

protocol getCrypto {
    func userChosenCrypto (crypto :String)
}


class pickCrypto: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var getCryptoDelegate : getCrypto?
    
    @IBAction func btc(_ sender: UIButton) {
        let name: String = "BTC"
        getCryptoDelegate?.userChosenCrypto(crypto: name)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ltc(_ sender: UIButton) {
        //getCryptoDelegate?.userChosenCrypto(crypto: "LTC")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func eth(_ sender: UIButton) {
        //getCryptoDelegate?.userChosenCrypto(crypto: "ETH")
        self.dismiss(animated: true, completion: nil)
    }
    
}

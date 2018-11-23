//
//  ViewController.swift
//  Richish
//
//  Created by Joy Paul on 11/7/18.
//  Copyright © 2018 Joy Paul. All rights reserved.
//

//required imports
import UIKit
import Foundation
import Alamofire
import SwiftyJSON

//getCrypto is the protocol, and the two pickerView extensions are required for uiPickerView
class ViewController: UIViewController, getCrypto, UIPickerViewDelegate, UIPickerViewDataSource{
   
    var root_url : String = "https://apiv2.bitcoinaverage.com/indices/global/ticker/"
    //values for the uiPicker
    private let dataSource = ["USD", "BRL", "CAD", "CNY", "EUR", "GBP", "HKD", "JPY"]
    
    @IBOutlet weak var nameOfCrypto: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    //protocol func
    func userChosenCrypto(crypto: String) {
        print(crypto)
        getData(crypto: crypto)
    }
    
    //prepare for segue and specify the delegate in order to pass data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cryptoScreen"{
            let destinationVC = segue.destination as! cryptoViewController
            destinationVC.cryptoViewControllerDelegate = self
        }
    }
    
    //function to update the screen
    func updateScreen(name : String, cryptoPrice : String){
        nameOfCrypto.text = name
        price.text = cryptoPrice
    }
    
    //function to fetch data and update screen when done
    func getData(crypto : String){
        //adding the type of crypto selected at the end of root url
        let full_url = root_url+crypto
        Alamofire.request(full_url, method: .get).responseJSON{
            response in
            if response.result.isSuccess{
                self.updateScreen(name: crypto, cryptoPrice: JSON(response.result.value!)["ask"].stringValue)

            }
            else{
                self.updateScreen(name: "Connection issue", cryptoPrice: "Connection issue")
            }
        }
    }
    
    
    //next four funcs are for pickerView implementation
    //this is for how many columns to display
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //this is for how many data to display
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    //lets you know what is picked
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(dataSource[row])
        
    }
    //this is to set the data source for the selection
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
    

}


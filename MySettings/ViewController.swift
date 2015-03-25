//
//  ViewController.swift
//  MySettings
//
//  Created by Todd Johnson on 3/24/15.
//  Copyright (c) 2015 Rock Valley College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func btnClear(sender: UIButton) {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(nil, forKey: "title")
        defaults.setObject(nil, forKey: "comment")
        defaults.setObject(nil, forKey: "place")
        
        defaults.synchronize()
        
        txtTitle.text = ""
        txtComment.text = ""
        place.selectRow(0,inComponent: 0, animated: true)
        txtTitle.becomeFirstResponder()
    }
    
    
    //places
    var selectedplace:String!
    let pickerplace = ["Home","Work","School"]
    
    @IBAction func btnLoad(sender: UIButton) {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if let titleNotNill = defaults.objectForKey("name") as? String {
            self.txtTitle.text = defaults.objectForKey("name") as String
        }
        
        if let commentIsNotNill = defaults.objectForKey("event") as? String {
            self.txtComment.text = defaults.objectForKey("event") as String
        }
        
        
        if let placeIsNotNill = defaults.objectForKey("spot") as? String {
            var favoriteplaceSelected = defaults.objectForKey("spot") as String
            var Selectedplace:Int = find(pickerplace, favoriteplaceSelected)!
            place.selectRow(Selectedplace,inComponent: 0, animated: true)
        }
    }
    
    
    
    @IBOutlet weak var txtTitle: UITextField!
    
    
    
    @IBOutlet weak var txtComment: UITextField!
    
    
    @IBOutlet weak var place: UIPickerView!
    
    
    
    @IBAction func btnSave(sender: UIButton) {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(self.txtTitle.text, forKey: "name")
        defaults.setObject(self.txtComment.text, forKey: "event")
        defaults.setObject(selectedplace, forKey: "spot")
        
        
        defaults.synchronize()
    }
    
        //Needed for picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerplace.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        selectedplace=pickerplace[row]
        return pickerplace[row]
        
    }
    //new method hiding keyboard
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    //set delegate to all uitextfields
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true)
        return false
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


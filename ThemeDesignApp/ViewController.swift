//
//  ViewController.swift
//  ThemeDesignApp
//
//  Created by Maruf Howlader on 6/12/20.
//  Copyright © 2020 Creative Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    var isDarkTheme = false
    @IBOutlet weak var uiSegmentApperence: UISegmentedControl!
    
    @IBOutlet weak var themeTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        isDarkTheme = defaults.bool(forKey: "isDarkTheme")
       loadUserDefaults(isDarkTheme)
    }
    
    @IBAction func getThemeChoice(_ sender: UISegmentedControl) {
        let senderCurrentSellection = sender.selectedSegmentIndex
        isDarkTheme = sender.selectedSegmentIndex == 1
        updateUserDefaults(isDarkTheme)
        loadUserDefaults(isDarkTheme)
        print("senderCurrentSellection: \(senderCurrentSellection),")
        print("isDarkTheme: \(isDarkTheme),")

    }
       
    struct Colors{
        static let darkColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        static let lightColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
    }
    
    func updateUserDefaults(_ isDarkTheme: Bool){
         defaults.set(isDarkTheme, forKey: "isDarkTheme")
    }
   
    func loadUserDefaults(_ isDarkTheme: Bool){
        let userCurretChoiceIs = defaults.bool(forKey: "isDarkTheme")
         print("userCurretChoiceIs: \(userCurretChoiceIs),")
        if userCurretChoiceIs {
            uiSegmentApperence.selectedSegmentIndex = 1
            themeTitle.text = "DARK"
        }else{
           themeTitle.text = "LIGHT"
        }
        view.backgroundColor = isDarkTheme ? Colors.darkColor : Colors.lightColor
    }

}


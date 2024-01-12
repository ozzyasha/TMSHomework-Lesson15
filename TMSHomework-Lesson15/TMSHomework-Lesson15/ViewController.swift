//
//  ViewController.swift
//  TMSHomework-Lesson15
//
//  Created by Наталья Мазур on 11.01.24.
//

import UIKit

class ViewController: UIViewController {
    
    let deleteCatButton = UIButton()
    let showCatButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        setupAlertViewFrame()
        setupCatViewFrame()
        setupCatButtons(button: deleteCatButton)
        setupCatButtons(button: showCatButton)
    }
    
    private func setupAlertViewFrame() {
        
        let alertViewWidth: CGFloat = 270
        let alertViewHeight: CGFloat = 240
        let centerX = view.frame.maxX / 2 - alertViewWidth / 2
        let centerY = view.frame.maxY / 2 - alertViewHeight / 2
        
        let alertView = AlertView(frame: CGRect(x: centerX, y: centerY, width: alertViewWidth, height: alertViewHeight))
        
        view.addSubview(alertView)
    }
    
    private func setupCatViewFrame(){
        let catViewWidth: CGFloat = 150
        let catViewHeight: CGFloat = 150
        let centerX = view.frame.maxX / 2 - catViewWidth / 2
        let cat = CatView(frame: CGRect(x: centerX, y: view.frame.minY + 70, width: catViewWidth, height: catViewHeight))
        
        view.addSubview(cat)
    }
    
    private func setupCatButtons(button: UIButton) {
        button.backgroundColor = .white
    }
    


}

// ДЗ:
// Создать кастомную view в виде алерта.
// Попробовать ее показывать и скрывать по нажатию на кнопку.

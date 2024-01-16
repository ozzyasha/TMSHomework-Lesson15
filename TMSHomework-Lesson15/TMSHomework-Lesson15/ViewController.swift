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
        view.backgroundColor = .systemGray5

        setupCatViewFrame()
        setupCatButtons(button: deleteCatButton)
        setupCatButtons(button: showCatButton)
    }

    private func setupCatViewFrame() {
        let catViewWidth: CGFloat = 250
        let catViewHeight: CGFloat = 250
        let centerX = view.frame.maxX / 2 - catViewWidth / 2
        let cat = CatView(frame: CGRect(x: centerX, y: view.frame.minY + 70, width: catViewWidth, height: catViewHeight))

        view.addSubview(cat)
    }

    private func setupCatButtons(button: UIButton) {
        button.backgroundColor = .white

        button.setTitleColor(.black, for: .normal)

        if button == deleteCatButton {
            button.setTitle("Удалить котика", for: .normal)
            button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        } else if button == showCatButton {
            button.setTitle("Показать котика", for: .normal)
            button.addTarget(self, action: #selector(showButtonTapped), for: .touchUpInside)
        }

        view.addSubview(button)
        setupCatButtonConstraints(button: button)
    }

    private func setupCatButtonConstraints(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false

        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        if button == deleteCatButton {
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        } else if button == showCatButton {
            button.topAnchor.constraint(equalTo: deleteCatButton.bottomAnchor, constant: 20).isActive = true
        }
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 20
    }

    @objc func deleteButtonTapped() {
        let alertViewWidth: CGFloat = 270
        let alertViewHeight: CGFloat = 240
        let centerX = view.center.x - alertViewWidth / 2
        let alertY = view.frame.minY - alertViewHeight
        let alertView = AlertView(frame: CGRect(x: centerX, y: alertY, width: alertViewWidth, height: alertViewHeight))

        if view.subviews.firstIndex(where: { $0 is AlertView }) == nil {
            view.addSubview(alertView)
        }

        UIView.animate(withDuration: 1.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.0,
                       options: [],
                       animations: {
                           alertView.center = self.view.center
                       }, completion: nil)
    }

    @objc func showButtonTapped() {
        let catView = view.subviews.first { $0 is CatView } as? CatView
        catView?.catImage.image = UIImage(named: "Two of them")
    }
}

// ДЗ:
// Создать кастомную view в виде алерта.
// Попробовать ее показывать и скрывать по нажатию на кнопку.

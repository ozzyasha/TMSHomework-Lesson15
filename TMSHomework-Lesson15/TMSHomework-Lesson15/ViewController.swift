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

    private func setupCatViewFrame() {
        let catViewWidth: CGFloat = 150
        let catViewHeight: CGFloat = 150
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
        let view = self.view.subviews.first { view in
            view is AlertView
        }
        view?.isHidden = false
    }

    @objc func showButtonTapped() {
        let view = self.view.subviews.first { view in
            view is CatView
        }
        view?.isHidden = false
    }
}

// ДЗ:
// Создать кастомную view в виде алерта.
// Попробовать ее показывать и скрывать по нажатию на кнопку.

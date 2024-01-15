//
//  AlertView.swift
//  TMSHomework-Lesson15
//
//  Created by Наталья Мазур on 12.01.24.
//

import UIKit

class AlertView: UIView {
    let cancelButton = UIButton()
    let okButton = UIButton()
    let alertLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupAlertView()
        isHidden = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupAlertView() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 20
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray5.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10.0

        setupAlertLabel()
        setupButtonStyle(for: cancelButton)
        setupButtonStyle(for: okButton)
    }

    private func setupAlertLabel() {
        alertLabel.text = "Вы уверены, что хотите удалить котика с экрана?"
        alertLabel.textColor = .black
        alertLabel.numberOfLines = 2
        alertLabel.frame = CGRect(x: 20, y: 0, width: Int(frame.width) - 20 * 2, height: Int(frame.height) - 50)
        alertLabel.textAlignment = .center

        addSubview(alertLabel)
    }

    private func setupButtonStyle(for button: UIButton) {
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)

        if button == cancelButton {
            cancelButton.backgroundColor = .systemRed
            cancelButton.frame = CGRect(x: 0, y: Int(frame.height) - 50, width: Int(frame.width) / 2, height: 50)
            cancelButton.setTitle("Cancel", for: .normal)
            cancelButton.layer.maskedCorners = [.layerMinXMaxYCorner]

            cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        } else if button == okButton {
            okButton.backgroundColor = .systemGreen
            okButton.frame = CGRect(x: Int(frame.width / 2), y: Int(frame.height) - 50, width: Int(frame.width) / 2, height: 50)
            okButton.setTitle("OK", for: .normal)
            okButton.layer.maskedCorners = [.layerMaxXMaxYCorner]

            okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        }

        addSubview(button)
    }

    @objc func cancelButtonTapped() {
        isHidden = true
    }

    @objc func okButtonTapped() {
        let view = superview!.subviews.first { view in
            view is CatView
        }

        view?.isHidden = true

        isHidden = true
    }
}

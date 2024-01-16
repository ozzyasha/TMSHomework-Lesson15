//
//  CatView.swift
//  TMSHomework-Lesson15
//
//  Created by Наталья Мазур on 13.01.24.
//

import UIKit

class CatView: UIView {
    let catImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCatView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCatView() {
        catImage.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        catImage.contentMode = .scaleAspectFit
        catImage.image = UIImage(named: "Two of them")
        catImage.tintColor = .black

        addSubview(catImage)
    }
}

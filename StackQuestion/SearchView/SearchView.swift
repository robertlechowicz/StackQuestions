//
//  SearchView.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 06.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import UIKit
import SnapKit

class SearchView: UIView {

    let questionTextField = UITextField()
    let searchButton = UIButton(type: .system)

    func setup() {
        backgroundColor = .white

        setupQuestionTextField()
        setupSearchButton()
        setupLayout()
    }

    private func setupQuestionTextField() {
        questionTextField.placeholder = "Question"
        questionTextField.borderStyle = .roundedRect
    }

    private func setupSearchButton() {
        searchButton.setTitle("Search", for: .normal)
        searchButton.tintColor = .stackBlue
    }

    private func setupLayout() {
        addSubview(questionTextField)
        addSubview(searchButton)

        questionTextField.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        searchButton.snp.makeConstraints { make in
            make.top.equalTo(questionTextField.snp.bottom).offset(16)
            make.trailing.equalTo(-24)
        }
    }
}

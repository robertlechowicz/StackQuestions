//
//  QuestionsView.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 06.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import UIKit

class QuestionsView: UIView {

    let tableView = UITableView()

    func setup() {
        backgroundColor = .white

        setupLayout()
    }

    private func setupLayout() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

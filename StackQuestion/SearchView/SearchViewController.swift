//
//  SearchViewController.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 06.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import UIKit
import PKHUD

private extension Selector {
    static let onSearch = #selector(SearchViewController.onSearch)
}

class SearchViewController: UIViewController {

    private let mainView = SearchView()
    private let modelController = SearchModelController()

    override func viewDidLoad() {
        super.viewDidLoad()

        view = mainView
        mainView.setup()
        setupNavigationBar()
        setupActions()
    }

    private func setupNavigationBar() {
        title = "StackQuestion"
    }

    private func setupActions() {
        mainView.searchButton.addTarget(self, action: .onSearch, for: .touchUpInside)
    }

    private func showQuestion(question: String, questions: [Question]) {
        DispatchQueue.main.async {
            let questionsViewController = QuestionsViewController(question: question, questions: questions)
            self.navigationController?.pushViewController(questionsViewController, animated: true)
        }
    }
}

extension SearchViewController {
    @objc func onSearch() {
        guard let question = mainView.questionTextField.text, !question.isEmpty else {
            showAlert(with: "Query cannot be empty")
            return
        }

        HUD.show(.progress)
        modelController.fetchQuestions(question: question) { result in
            DispatchQueue.main.async {
                HUD.hide()
            }
            switch result {
            case .error(let error):
                self.showAlert(with: error.localizedDescription)
            case .success(let questions):
                self.showQuestion(question: question, questions: questions)
            }
        }
    }
}

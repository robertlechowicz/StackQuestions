//
//  AnswerViewController.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 07.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    let mainView = AnswerView()
    let modelController = AnswerModelController()

    var id: Int64?
    override func viewDidLoad() {
        super.viewDidLoad()

        view = mainView
        mainView.setup()

        if let id = id {
            fetchAnswer(id: id)
        }
    }

    func fetchAnswer(id: Int64) {
        modelController.fetchAnswer(id: id) { result in
            switch result {
            case .success(let answer):
                if let answer = answer {
                    DispatchQueue.main.async {
                        self.mainView.viewModel = AnswerViewModel.init(answer: answer)
                    }
                }
            case .error(let error):
                self.showAlert(with: error.localizedDescription)
            }
        }
    }
}

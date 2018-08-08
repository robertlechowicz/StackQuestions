//
//  QuestionViewController.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 06.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    let mainView = QuestionView()
    let modelController: QuestionModelController

    let answerController = AnswerViewController()

    init(question: Question) {
        modelController = QuestionModelController(question: question)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view = mainView
        mainView.setup()
        mainView.viewModel = QuestionViewModel.init(question: modelController.question)

        setupNavigationBar()
        setupAnswer()
    }

    private func setupNavigationBar() {
        title = modelController.question.title
    }

    private func setupAnswer() {
        if let id = modelController.question.acceptedAnswerId {
            answerController.id = id
            addChildViewController(answerController)
            mainView.addAnswer(view: answerController.view)
            answerController.didMove(toParentViewController: self)
        }
    }
}

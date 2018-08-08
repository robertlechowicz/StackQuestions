//
//  QuestionsViewController.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 06.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    private let mainView = QuestionsView()
    private let modelController: QuestionsViewModelController

    override func viewDidLoad() {
        super.viewDidLoad()

        view = mainView
        mainView.setup()
        setupNavigationBar()

        setupTable()
    }

    private func setupNavigationBar() {
        title = modelController.question
    }

    init(question: String, questions: [Question]) {
        modelController = QuestionsViewModelController(question: question, questions: questions)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTable() {
        mainView.tableView.register(QuestionCell.self, forCellReuseIdentifier: "QuestionCell")
        mainView.tableView.dataSource = modelController
        mainView.tableView.delegate = self
    }
}

extension QuestionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionViewController = QuestionViewController(question: modelController.questions[indexPath.row])
        navigationController?.pushViewController(questionViewController, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

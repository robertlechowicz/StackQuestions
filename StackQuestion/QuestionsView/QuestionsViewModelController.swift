//
//  QuestionsViewModelController.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 06.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import Foundation
import UIKit

class QuestionsViewModelController: NSObject {
    let questions: [Question]
    let question: String

    init(question: String, questions: [Question]) {
        self.questions = questions
        self.question = question
    }
}

extension QuestionsViewModelController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell") as? QuestionCell ?? QuestionCell()
        cell.viewModel = QuestionCell.ViewModel.init(question: questions[indexPath.row])
        return cell
    }
}

//
//  SearchModelController.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 06.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import Foundation
import SwiftyJSON

class SearchModelController {
    let networking = QuestionsNetworking()

    func fetchQuestions(question: String, completion: @escaping (QueryResult<[Question]>) -> Void) {

        networking.getQuestions(question: question) { result in
            switch result {
            case .success(let data):
                let questions = JsonParser.parseQuestions(data: data)
                completion(.success(questions))
            case .error(let error):
                completion(.error(error))
            }
        }
    }
}

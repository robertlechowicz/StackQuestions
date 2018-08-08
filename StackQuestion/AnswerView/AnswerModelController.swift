//
//  AnswerModelController.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 07.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import Foundation
import SwiftyJSON

class AnswerModelController: NSObject {
    let networking = AnswerNetworking()

    func fetchAnswer(id: Int64, completion: @escaping (QueryResult<Answer?>) -> Void) {

        networking.getQuestion(id: id) { result in
            switch result {
            case .success(let data):
                let answer = JsonParser.parseAnswer(data: data)
                completion(.success(answer))
            case .error(let error):
                completion(.error(error))
            }
        }
    }
}

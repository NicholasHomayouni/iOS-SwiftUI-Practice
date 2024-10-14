//
//  logicFunctions.swift
//  practice
//
//  Created by Nicholas Homayouni on 10/7/24.
//

import Foundation

final class logicFunctions {
    // This function takes an array of web URLs, fetches the content from each URL, and returns the length of the content in characters
    func fetchContentLength(urls: [String], completion: @escaping ([Int]) -> Void) {
        var contentLengths: [Int] = []      //initialize
        let dispatchGroup = DispatchGroup()
        
        for urlString in urls { // loop through each URL        //process
            guard let url = URL(string: urlString) else {   // validate each url
                contentLengths.append(0)
                continue
            }
            dispatchGroup.enter() // begin fetch task
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in // start data task to fetch content of url
                if let error = error {  // if theres an error,  handle error or data
                    print("Error fetching data from \(urlString): \(error)")
                    contentLengths.append(0)
                } else if let data = data { // if the request succeeds and data is received
                    contentLengths.append(data.count)
                } else { // if no data is received
                    contentLengths.append(0) // 0 indicates failure (since function is fetching length of url)
                }
                dispatchGroup.leave() // fetch task is finished
            }
            task.resume() // starts the task that was just created
        }
        dispatchGroup.notify(queue: .main) { // this tells the DispatchGroup to notify you when all tasks have completed
            completion(contentLengths) // all tasks are done, so the completion closure is called, passing the contentLengths
        }
    }
    
    // validate user input (QA): username(must be at least 5 characters long), password(must contain at least one uppercase letter, one number, and be at least 8 characters long)
    func validateUserInput(username: String, password: String) -> Bool {
        if username.count < 5 { // validate username
            return false
        }
        // validate password
        while (password.count >= 8) {
            let uppercase = password.contains { $0.isUppercase }
            let lowercase = password.contains { $0.isLowercase }
            let number = password.contains { $0.isNumber }
            return uppercase && lowercase && number
        }
        return false
    }
    
    func aggregateOrders(orders: [(userId:Int, orderAmount:Double)]) -> [Int:Double] {
        var orderSummary: [Int:Double] = [:]  // initialize new dict.
        for order in orders {
            orderSummary[order.userId, default: 0] += order.orderAmount
        }
        return orderSummary
    }
    
    // event log analysis(QA/Automation) // log format: "timestamp: status"
//    func countEventDurations(logs: [String]) -> [Int:Int] { // INPUT: "START: END"
//        // return a dictionary of the string given by splitting the two components by the colon :
//        // the first component is a number, so it should be converted to an integer from a string
//        // the 2nd component is a string
//        var eventDurations: [Int:Int]
//        var startTimes: [Int] = []
//        for log in logs {
//            var component =
//        }
//    }
    
    // log analyzer
    func analyzeLogs(logs: [String]) -> [String:Int] {
        var result: [String:Int] = ["SUCCESS":0, "FAILURE":0]   // initialize
        for log in logs { // process
            if log.contains("SUCCESS") { // check
                result["SUCCESS", default: 0] += 1  // store
            } else if log.contains("FAILURE") {
                result["FAILURE", default: 0] += 1
            }
        }
        return result   // return
    }
    
    // db query
    func findUnsafeQueries(queries: [String]) -> [String] {
        var unsafeQueries: [String] = []
        for query in queries {
            if query.uppercased().contains("DELETE") || query.uppercased().contains("DROP") {
                unsafeQueries.append(query)
            }
        }
        return unsafeQueries
    }
}

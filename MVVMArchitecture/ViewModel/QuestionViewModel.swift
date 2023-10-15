//
//  QuestionModel.swift
//  MVVMArchitecture
//
//  Created by yogesh rathod on 9/9/23.
//

import Foundation

class QuestionViewModel{
    
    func fetchFilms(completionHandler: @escaping ([MUserList]) -> Void) {
        let url = URL(string: "https://api.github.com/users?since=0")!

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
            return
          }
          
          guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
            print("Error with the response, unexpected status code: \(response)")
            return
          }

          if let data = data,
             let userList = try? JSONDecoder().decode([MUserList].self, from: data) {
              completionHandler(userList)
          }
        })
        task.resume()
      }
}

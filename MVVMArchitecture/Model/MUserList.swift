//
//  MUserList.swift
//

import Foundation
struct MUserList : Codable {
    let login : String?
  

    enum CodingKeys: String, CodingKey {

        case login = "login"
       
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        login = try values.decodeIfPresent(String.self, forKey: .login)
    }

}

//
//  TodoItem.swift
//  KtTodoList
//
//  Created by si.ha on 2019/10/23.
//  Copyright © 2019 komainu-ya. All rights reserved.
//

import SwiftUI

let todoData: [TodoItem] = load("todoData.json")

struct TodoItem: Hashable, Codable, Identifiable {
    var id: TimeInterval    //ID(unique) 作成時間(Unixエポック秒)
    var title: String   //タイトル

    var notificationTime: TimeInterval?  //option: 通知時間(Unixエポック秒)
    
    func notificationTimeString() -> String {
        guard let time = self.notificationTime else {
            return ""
        }
        let f = DateFormatter()
        f.timeStyle = .short
        f.dateStyle = .long
        f.locale = Locale(identifier: "ja_JP")
        let date = Date(timeIntervalSince1970: time)
        return f.string(from: date)
    }
}

// jsonからデータへ
func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

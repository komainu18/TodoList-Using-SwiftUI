//
//  TodoItemView.swift
//  KtTodoList
//
//  Created by si.ha on 2019/10/23.
//  Copyright © 2019 komainu-ya. All rights reserved.
//

import SwiftUI

struct TodoItemView: View {
    @State var todoItem: TodoItem
    
    var body: some View {
        // セクションに項目名
        Section(header: Text(verbatim: todoItem.title)) {
            // 時間あり？
            if self.todoItem.notificationTime != nil {
                if self.todoItem.notificationTime!.count == 1 {
                    // 時間1つ
                    HStack {
                        Image(systemName: "checkmark.square")    //SF Symbols
                        Text(self.todoItem.notificationDateString())
                        Spacer()
                    }.padding()
                }
                else {
                    // 時間複数
                    HStack {
                        ForEach(self.todoItem.notificationTime!.indices) { index in
                            // TODO:チェック型ボタンにする
                            // 角丸枠付きのテキスト
                            Text(self.todoItem.notificationTimeString(index))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4.0)
                                        .stroke(Color.black, lineWidth: 1.0)
                            )
                        }
                    }
                }
            }
            else {
                // 時間1つ。ひとまずチェックマーク
                HStack {
                    Image(systemName: "checkmark.square")    //SF Symbols
                    Spacer()
                }.padding()
            }
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodoItemView(todoItem: todoData[0])
            TodoItemView(todoItem: todoData[2])
            TodoItemView(todoItem: todoData[1])
        }
        .previewLayout(.fixed(width: 300, height: 45))
    }
}

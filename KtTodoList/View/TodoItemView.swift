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
        VStack {
            // タイトル
            HStack {
                Text(verbatim: todoItem.title)
                Spacer()
            }
            // 時間
            if self.todoItem.notificationTime != nil {
                if self.todoItem.notificationTime!.count == 1 {
                    HStack {
                        Text(self.todoItem.notificationDateString())
                            .font(.footnote)
                        Spacer()
                    }
                }
                else {
                    HStack {
                        ForEach(self.todoItem.notificationTime!.indices) { index in
                            Text(self.todoItem.notificationTimeString(index))
                                .font(.footnote)
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                        }
                    }
                }
            }
        }.frame(width: 300, height: 45)
        .padding()
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodoItemView(todoItem: todoData[0])
            TodoItemView(todoItem: todoData[1])
            TodoItemView(todoItem: todoData[2])
        }
        .previewLayout(.fixed(width: 300, height: 45))
    }
}

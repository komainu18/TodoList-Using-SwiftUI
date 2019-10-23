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
            HStack {
                Text(verbatim: todoItem.title)
                Spacer()
            }
            if self.todoItem.notificationTime != nil {
                HStack {
                    Text(self.todoItem.notificationTimeString())
                        .font(.footnote)
                    Spacer()
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
        }
        .previewLayout(.fixed(width: 300, height: 45))
    }
}

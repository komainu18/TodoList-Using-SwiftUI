//
//  ContentView.swift
//  KtTodoList
//
//  Created by si.ha on 2019/10/23.
//  Copyright © 2019 komainu-ya. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var list: [TodoItem] = todoData
   
    var body: some View {
        NavigationView {
            List {
                ForEach(list, id: \.self) { item in
                    TodoItemView(todoItem: item)
                }
//                .onMove(perform: move)  //ドラッグで入れ替え
                .onDelete(perform: delete)  //スワイプで削除
            }
            .navigationBarTitle(Text("やることリスト"))
            .navigationBarItems(trailing: EditButton()) // 編集ボタン.
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        list.move(fromOffsets: source, toOffset: destination)
    }

    func delete(at offsets: IndexSet) {
        list.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(list: todoData)
    }
}

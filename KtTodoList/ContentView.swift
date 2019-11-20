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
    @State var newItemName = ""
    @State var placeholder = "やることを追加する"
    @State var backgroundColor = UIColor.clear
   
    var body: some View {
        NavigationView {
            VStack {
                InputTextField(text: $newItemName, placeholder: $placeholder, backgroundColor: $backgroundColor)
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                List {
                    ForEach(list, id: \.self) { item in
                        TodoItemView(todoItem: item)
                    }
                    .onDelete(perform: delete)  //スワイプで削除
                    //                .onMove(perform: move)  //ドラッグで入れ替え

                }
                Spacer()
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

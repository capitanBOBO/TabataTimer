//
//  MainScreenView.swift
//  TabataTimer
//
//  Created by Иван Савин on 04.05.2020.
//  Copyright © 2020 Иван Савин. All rights reserved.
//

import UIKit
import SwiftUI

struct MainScreenView : View {
    var body: some View {
        MainScreenBottomView()
    }
}

struct MainScreenBottomView : View {
    var body: some View {
        HStack {
            Button("Edit") {
                
            }.border(Color.blue, width: 2).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            Button("Ready") {
                
            }.border(Color.blue, width: 2).cornerRadius(3.0)
        }
    }
}

struct MainScreenTimerView : View {
    var body: some View {
        EmptyView()
    }
}

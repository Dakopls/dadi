//
//  ViewDispatcher.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

final class ViewDispatcher {

    static var shared: ViewDispatcher = ViewDispatcher()
    var dispatcher: ViewDipatcherProtocol = DispatcherDefault()
    
    func execute(after: Double = 0, action: @escaping () -> Void) {
        dispatcher.execute(after: after, action: action)
    }    
}

protocol ViewDipatcherProtocol: class {
    
    func execute(after: Double, action: @escaping () -> Void)
}

extension ViewDipatcherProtocol {
    
    func execute(_ action: @escaping () -> Void) {
        execute(after: 0, action: action)
    }
}

class DispatcherDefault: ViewDipatcherProtocol {
    
    func execute(after: Double, action: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + after, execute: action)
    }
}

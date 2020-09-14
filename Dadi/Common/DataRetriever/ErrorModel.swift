//
//  ErrorModel.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

protocol ErrorModelProtocol {
    
    var string: String { get }
}

extension ErrorModelProtocol where Self: RawRepresentable, Self.RawValue == String {
    
    var string: String {
        return self.rawValue
    }
}

extension ErrorModelProtocol {
    
    func isEqual(_ lhs: ErrorModelProtocol) -> Bool {
        return type(of: lhs) == type(of: self) && lhs.string == self.string
    }
}

struct ErrorModel: LocalizedError, Equatable {
    
    let value: ErrorModelProtocol

    init(_ value: ErrorModelProtocol) {
        self.value = value
    }

    static func == (_ lhs: ErrorModel, _ rhs: ErrorModel) -> Bool {
        return lhs.value.isEqual(rhs.value)
    }
}

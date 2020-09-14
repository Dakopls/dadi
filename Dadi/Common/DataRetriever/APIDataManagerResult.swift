//
//  APIDataManagerResult.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

typealias JSONObject = [String: Any]
typealias JSONArray = [[String: Any]]

typealias APIDataManagerResult = Result<JSONArray, ErrorModel>
typealias APIDataManagerResultBlock = (Result<JSONArray, ErrorModel>) -> Void

typealias APIDataManagerObjectResult = Result<JSONObject, ErrorModel>
typealias APIDataManagerObjectResultBlock = (Result<JSONObject, ErrorModel>) -> Void

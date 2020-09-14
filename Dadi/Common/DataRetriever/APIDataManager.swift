//
//  APIDataManager.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

//TBD APIDataManagers

//enum APIRequestType {
//    case json
//    case multiPart(boundary: String)
//    case custom(contentType: String)
//
//    var headerValue: String {
//        switch self {
//        case .json: return "application/json; charset=utf-8"
//        case .multiPart(let boundary): return "multipart/form-data; boundary=\(boundary)"
//        case .custom(let contentType): return contentType
//        }
//    }
//}
//
//struct APIRequest {
//    let endpoint: EndpointProtocol
//    let parameters: Any?
//    weak var delegate: URLSessionTaskDelegate?
//    let headers: [String: String]?
//    let type: APIRequestType
//
//    init(endpoint: EndpointProtocol, headers: [String: String]? = nil, parameters: Any? = nil, type: APIRequestType = .json, delegate: URLSessionTaskDelegate? = nil) {
//        self.endpoint = endpoint
//        self.parameters = parameters
//        self.delegate = delegate
//        self.headers = headers
//        self.type = type
//    }
//}
//
//protocol APIDataManagerProtocol: class {
//    func makeAPIRequest(_ request: APIRequest, result: @escaping APIDataManagerObjectResultBlock)
//    func makeAPIRequest(_ request: APIRequest, result: @escaping APIDataManagerResultBlock)
//    func reset()
//}
//
//class APIDataManagerDefault: APIDataManagerProtocol {
//
//    // MARK: - APIDataManagerProtocol implementation
//
//    func makeAPIRequest(_ request: APIRequest, result: @escaping APIDataManagerObjectResultBlock) {
//        makeAPICall(request, result)
//    }
//
//    func makeAPIRequest(_ request: APIRequest, result: @escaping APIDataManagerResultBlock) {
//        makeAPICall(request, result)
//    }
//
//    func reset() {
//        isTreatingUnauthorised = false
//        removePendingCalls()
//    }
//
//    // MARK: - Private stuff
//
//    private var isTreatingUnauthorised: Bool = false
//    private var pendingObjectCalls: [(APIRequest, APIDataManagerObjectResultBlock)] = []
//    private var pendingArrayCalls: [(APIRequest, APIDataManagerResultBlock)] = []
//
//    private func makeAPICall<T>(_ apiRequest: APIRequest, _ resultBlock: ((Result<T, ErrorModel>) -> Void)?, isAuthorisingCall: Bool = false) {
//        // Saving the request for later in case we are unauthorised
//        if !isAuthorisingCall && isTreatingUnauthorised {
//            addPendingCall(apiRequest, resultBlock: resultBlock)
//            return
//        }
//
//        let request = createRequest(for: apiRequest)
//
//        let session = URLSession(configuration: .default, delegate: apiRequest.delegate, delegateQueue: nil)
//        let task = session.dataTask(with: request) { [weak self] data, response, _ in
//            if let httpResponse = response as? HTTPURLResponse {
//                if ForceUpdateManager.shared.check(httpResponse) {
//                    let error = APIErrorBuilder.build(data: data)
//                    switch (httpResponse.statusCode, error.value) {
//                    case (200 ... 299, _):
//                        self?.treatSuccess(with: data, and: resultBlock)
//                    case (401, APIError.General.invalidToken):
//                        self?.addPendingCall(apiRequest, resultBlock: resultBlock)
//                        self?.treatUnauthorised()
//                    default:
//                        resultBlock?(.failure(error))
//                    }
//                }
//            } else {
//                resultBlock?(.failure(ErrorModel(APIError.General.unknownException)))
//            }
//        }
//        task.resume()
//    }
//
//    private func createRequest(for apiRequest: APIRequest) -> URLRequest {
//
//        let url = URL(string: "\(apiRequest.endpoint.baseUrl)\(apiRequest.endpoint.value)")!
//        var request = URLRequest(url: url)
//        if apiRequest.endpoint.authenticated,
//            let token = Keychain(service: Constants.keychainServiceName)[Constants.keychainAccessToken] {
//            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        }
//        request.httpMethod = apiRequest.endpoint.method.rawValue
//        request.setValue(apiRequest.type.headerValue, forHTTPHeaderField: "Content-Type")
//        if let parameters = apiRequest.parameters {
//            switch apiRequest.endpoint.method {
//            case .POST, .PUT, .DELETE:
//                if let data = parameters as? Data {
//                    request.httpBody = data
//                } else if let dict = parameters as? [String: Any] {
//                    request.httpBody = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
//                }
//            case .GET:
//                if let dict = parameters as? [String: Any] {
//                    request.url = URL(string: "\(apiRequest.endpoint.baseUrl)\(apiRequest.endpoint.value)?\(dict.stringFromHttpParameters())")!
//                }
//            }
//        }
//
//        if apiRequest.endpoint.addBadiHeaders {
//            for element in HeadersDataManager.shared.headers {
//                request.addValue(element.value, forHTTPHeaderField: element.key)
//            }
//        }
//
//        for (key, value) in apiRequest.headers ?? [:] {
//            request.addValue(value, forHTTPHeaderField: key)
//        }
//
//        return request
//    }
//
//    private func treatSuccess<T>(with data: Data?, and resultBlock: (((Result<T, ErrorModel>) -> Void))?) {
//        if let data = data,
//            let dict = (try? JSONSerialization.jsonObject(with: data, options: [])) as? T {
//            resultBlock?(.success(dict))
//        } else if let emptyDict = [String: Any]() as? T {
//            resultBlock?(.success(emptyDict))
//        } else if let emptyArray = [[String: Any]]() as? T {
//            resultBlock?(.success(emptyArray))
//        }
//    }
//
//    private func treatUnauthorised() {
//        guard !isTreatingUnauthorised else { return }
//        isTreatingUnauthorised = true
//        guard let refreshParams = LoginModel().toRefreshTokenDict() else {
//            logOutUser()
//            return
//        }
//
//        let resultBlock: ((Result<JSONObject, ErrorModel>) -> Void) = { [weak self] refreshResult in
//            self?.isTreatingUnauthorised = false
//            switch refreshResult {
//            case .success(let successResult):
//                CommonLoginInteractor().treatLogin(successResult as [String: AnyObject])
//                // On success we call the pending requests
//                self?.handlePendingCalls()
//            case .failure:
//                self?.removePendingCalls()
//                self?.logOutUser()
//            }
//        }
//        makeAPICall(APIRequest(endpoint: Endpoint.Access.refreshToken, parameters: refreshParams), resultBlock, isAuthorisingCall: true)
//    }
//
//    private func addPendingCall<T>(_ apiRequest: APIRequest, resultBlock: ((Result<T, ErrorModel>) -> Void)?) {
//        if let resultBlock = resultBlock as? APIDataManagerObjectResultBlock {
//            pendingObjectCalls.append((apiRequest, resultBlock))
//        } else if let resultBlock = resultBlock as? APIDataManagerResultBlock {
//            pendingArrayCalls.append((apiRequest, resultBlock))
//        }
//    }
//
//    private func handlePendingCalls() {
//        for (request, resultBlock) in pendingObjectCalls {
//            makeAPIRequest(request, result: resultBlock)
//        }
//
//        for (request, resultBlock) in pendingArrayCalls {
//            makeAPIRequest(request, result: resultBlock)
//        }
//        removePendingCalls()
//    }
//
//    private func removePendingCalls() {
//        pendingObjectCalls.removeAll()
//        pendingArrayCalls.removeAll()
//    }
//
//    private func logOutUser() {
//        reset()
//        ViewDispatcher.shared.execute {
//            SettingsInteractor().logout()
//            SettingsWireFrame().navigateToInitialScreen()
//        }
//    }
//}
//
//class APIDataManager {
//
//    static let shared: APIDataManager = APIDataManager()
//    var apiDataManager: APIDataManagerProtocol = APIDataManagerDefault()
//
//    // MARK: - Public methods
//
//    func makeAPIRequest(forEndpoint endpoint: EndpointProtocol, headers: [String: String]? = nil, parameters: Any? = nil, contentTypeHeader: String, result: @escaping APIDataManagerObjectResultBlock) {
//        apiDataManager.makeAPIRequest(APIRequest(endpoint: endpoint, headers: headers, parameters: parameters, type: APIRequestType.custom(contentType: contentTypeHeader)), result: result)
//    }
//
//    func makeAPIRequest(forEndpoint endpoint: EndpointProtocol, headers: [String: String]? = nil, parameters: [String: Any]? = nil, result: @escaping APIDataManagerObjectResultBlock) {
//        apiDataManager.makeAPIRequest(APIRequest(endpoint: endpoint, headers: headers, parameters: parameters), result: result)
//    }
//
//    func makeAPIRequest(forEndpoint endpoint: EndpointProtocol, headers: [String: String]? = nil, parameters: [String: Any]? = nil, result: @escaping APIDataManagerResultBlock) {
//        apiDataManager.makeAPIRequest(APIRequest(endpoint: endpoint, headers: headers, parameters: parameters), result: result)
//    }
//
//    func makeMultiPartAPIRequest(forEndpoint endpoint: EndpointProtocol, headers: [String: String]? = nil, boundary: String, parameters: Data, delegate: URLSessionTaskDelegate? = nil, result: @escaping APIDataManagerObjectResultBlock) {
//        apiDataManager.makeAPIRequest(APIRequest(endpoint: endpoint, headers: headers, parameters: parameters, type: .multiPart(boundary: boundary), delegate: delegate), result: result)
//    }
//
//    func reset() {
//        apiDataManager.reset()
//    }
//}
//
//extension String {
//
//    /// Percent escapes values to be added to a URL query as specified in RFC 3986
//    ///
//    /// This percent-escapes all characters besides the alphanumeric character set and "-", ".", "_", and "~".
//    ///
//    /// http://www.ietf.org/rfc/rfc3986.txt
//    ///
//    /// :returns: Returns percent-escaped string.
//
//    func addingPercentEncodingForURLQueryValue() -> String? {
//        let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
//        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
//    }
//
//}
//
//extension Dictionary {
//
//    /// Build string representation of HTTP parameter dictionary of keys and objects
//    ///
//    /// This percent escapes in compliance with RFC 3986
//    ///
//    /// http://www.ietf.org/rfc/rfc3986.txt
//    ///
//    /// :returns: String representation in the form of key1=value1&key2=value2 where the keys and values are percent escaped
//
//    func stringFromHttpParameters() -> String {
//        let parameterArray = self.map { (key, value) -> String in
//            if let key = key as? String {
//                let percentEscapedKey = key.addingPercentEncodingForURLQueryValue()!
//                let percentEscapedValue = String(describing: value).addingPercentEncodingForURLQueryValue()!
//                return "\(percentEscapedKey)=\(percentEscapedValue)"
//            }
//            return ""
//        }
//
//        return parameterArray.joined(separator: "&")
//    }
//
//}

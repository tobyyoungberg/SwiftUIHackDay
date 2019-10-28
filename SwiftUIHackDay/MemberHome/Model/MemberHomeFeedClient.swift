//
//  MemberHomeFeedClient.swift
//  SwiftUIHackDay
//
//  Created by Toby Youngberg on 10/25/19.
//  Copyright © 2019 T-JAM Studios. All rights reserved.
//

import Foundation

enum MemberHomeFeedClientError: Error {
    case unknown
}

class MemberHomeViewModel: ObservableObject {
    @Published var accountSummary: MemberHomeFeedAccountSummary = MemberHomeFeedAccountSummary(accounts: [])
    @Published var feedPage: MemberHomeFeedPage = MemberHomeFeedPage(next: nil, content: [], flags: nil)
}

protocol MemberHomeFeedClient {
    var viewModel: MemberHomeViewModel { get }
    func getFeedPage(completion: @escaping (Result<MemberHomeFeedPage, MemberHomeFeedClientError>) -> Void)
    func getAccountSummary(completion: @escaping (Result<MemberHomeFeedAccountSummary, MemberHomeFeedClientError>) -> Void)
}

class MockMemberHomeFeedClient: MemberHomeFeedClient {
    var viewModel: MemberHomeViewModel
    
    init() {
        viewModel = MemberHomeViewModel()
        getAccountSummary { result in
            switch result {
            case .success(let accountSummary):
                self.viewModel.accountSummary = accountSummary
            case .failure(let error):
                print(error)
            }
        }
        
        getFeedPage { result in
            switch result {
            case .success(let feedPage):
                self.viewModel.feedPage = feedPage
            case .failure(let error):
                print(error)
            }
        }
    }
    
    let pageURL = Bundle.main.url(forResource: "MemberHomeFeedLimit3", withExtension: "json")!
    let accountURL = Bundle.main.url(forResource: "MemberAccountSummary", withExtension: "json")!
    
    func getFeedPage(completion: @escaping (Result<MemberHomeFeedPage, MemberHomeFeedClientError>) -> Void) {
        guard let pageData = try? Data(contentsOf: pageURL) else { return completion(.failure(.unknown)) }
        
        do {
            let decoder = JSONDecoder()
            let page = try decoder.decode(MemberHomeFeedPage.self, from: pageData)
            completion(.success(page))
        } catch {
            print(error)
            completion(.failure(.unknown))
        }
    }
    
    func getAccountSummary(completion: @escaping (Result<MemberHomeFeedAccountSummary, MemberHomeFeedClientError>) -> Void) {
        guard let accountData = try? Data(contentsOf: accountURL) else { return completion(.failure(.unknown))}
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let account = try decoder.decode(MemberHomeFeedAccountSummary.self, from: accountData)
            completion(.success(account))
        } catch {
            print(error)
            completion(.failure(.unknown))
        }
    }
}

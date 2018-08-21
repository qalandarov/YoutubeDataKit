//
//  ViewController.swift
//  Example
//
//  Created by Islam Qalandarov on 8/21/18.
//  Copyright © 2018 Qalandarov. All rights reserved.
//

import UIKit
import YoutubeDataKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testAPI()
    }
    
    private func testAPI() {
        // Get youtube chart ranking
        let request = VideoListRequest(part: [.id, .statistics], filter: .chart)
        
        // Send a request.
        ApiSession.shared.send(request) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failed(let error):
                print(error)
            }
        }
    }
    
}


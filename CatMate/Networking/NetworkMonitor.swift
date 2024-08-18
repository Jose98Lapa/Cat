//
//  ConnectionHelper.swift
//  Gatinhos
//
//  Created by José Miguel Lapa on 17/08/2024.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue.global(qos: .background)
    @Published var isNetworkAccessible: Bool = false
    
    init() {
        setupPathHandler()
    }
    
    func setupPathHandler() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isNetworkAccessible = path.status == .satisfied
        }
        
        monitor.start(queue: queue)
    }
}

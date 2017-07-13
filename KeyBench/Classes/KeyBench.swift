//
//  KeyBench.swift
//  KeyBench
//
//  Created by Henry Popp on 7/12/17.
//  Copyright © 2017 Codedge LLC. All rights reserved.
//

import Foundation

public class KeyBench {

    private var items: [String:CFAbsoluteTime] = [:]
    public static let sharedInstance = KeyBench()

    /**
     Starts a bench for given `id`.
     
     Will overwrite an existing bench with the same `id`.
     
     - Parameter id: Bench identifier.
    */
    public func start(_ id: String) {
        items[id] = CFAbsoluteTimeGetCurrent()
    }

    /**
     Stops a bench for given `id`.

     Prints elapsed time since bench start. Does nothing if bench hasn't been started.
     
     - Parameter id: Bench identifier.
     */
    public func stop(_ id: String) {
        let endTime = CFAbsoluteTimeGetCurrent()
        guard let startTime = items[id] else { return }

        let timeElapsed = endTime - startTime
        print("KeyBench :: [\(id)] finished in \(timeElapsed)s.")
        items.removeValue(forKey: id)
    }
}

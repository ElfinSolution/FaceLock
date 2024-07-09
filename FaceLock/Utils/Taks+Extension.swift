//
//  Taks+Extension.swift
//  FaceLock
//
//  Created by Harjot Bharti on 7/9/24.
//

import Foundation

extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: TimeInterval) async {
        try? await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
    }
}

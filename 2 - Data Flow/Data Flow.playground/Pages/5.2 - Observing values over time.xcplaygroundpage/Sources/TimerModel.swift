//
//  TimerModel.swift
//  
//
//  Created by Michael Skiba on 11/05/2025.
//

import Foundation

/*:

 It's important to note that if we don't explicitly cancel the task when we `cancel` it, then the timer will keep running.

 If we really wanted to observe a timer like this, a TimelineView would be a better option.

 */

@Observable
public class TimerModel {
    public private(set) var tick: Int = 0
    private var task: Task<Void, Never>? {
        didSet { oldValue?.cancel() }
    }

    public init() {}

    public func start() {
        guard !isRunning else { return }
        task = Task { @MainActor [weak self] in
            while !Task.isCancelled {
                self?.tick += 1
                try? await Task.sleep(for: .seconds(0.25))
            }
        }
    }

    public func stop() {
        task = nil
    }

    public var isRunning: Bool {
        task?.isCancelled == false
    }
}

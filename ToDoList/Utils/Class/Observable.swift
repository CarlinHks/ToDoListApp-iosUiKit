//
//  Observable.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 31/05/24.
//

import Foundation

// Observable Template
class Observable<T> {
    var value: T? {
        didSet {
            notifyListeners()
        }
    }

    init(_ value: T?) {
        self.value = value
    }

    private var listeners: [(UUID, (T?) -> Void)] = []

    func bind(_ listener: @escaping (T?) -> Void) -> UUID {
        let id = UUID()
        listeners.append((id, listener))
        listener(value)
        return id
    }

    func unbind(id: UUID?) {
        if let id {
            listeners.removeAll { $0.0 == id }
        }
    }

    private func notifyListeners() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            for (_, listener) in self.listeners {
                listener(self.value)
            }
        }
    }
}


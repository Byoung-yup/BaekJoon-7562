//
//  main.swift
//  BaekJoon#7562
//
//  Created by 김병엽 on 2023/05/12.
//
// Reference: https://icksw.tistory.com/163

import Foundation

struct Queue<T> {
    private var queue: [T] = []
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}

func solution() {
    
    // 나이트가 이동할 수 있는 모든 경우의 수
    let dx = [-1, -2, -1, -2, 1, 2, 2, 1]
    let dy = [-2, -1, 2, 1, -2, -1, 1, 2]
    
    let n = Int(readLine()!)!
    
    for _ in 0..<n {
        let size = Int(readLine()!)!
        let start = readLine()!.split(separator: " ").map { Int(String($0))! }
        let end = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: size), count: size)
        
        var queue = Queue<[Int]>()
        queue.enqueue(start + [0])
        
        visited[start[0]][start[1]] = true
        
        if start == end {
            print(0)
            continue
        }
        
        while(!queue.isEmpty) {
            let now = queue.dequeue()!
            let position = [now[0], now[1]]
            let time = now[2]
            
            if position == end {
                print(time)
                break
            }
            
            for i in 0..<8 {
                let x = position[1] + dx[i]
                let y = position[0] + dy[i]
                
                if x >= size || y >= size || x < 0 || y < 0 { continue }
                else if !visited[y][x] {
                    queue.enqueue([y, x, time + 1])
                    visited[y][x] = true
                }
            }
        }
    }
}

solution()

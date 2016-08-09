//
//  GaltonBall.swift
//  BeanMachineCLI
//
//  Created by Dustin Bowers on 8/4/16.
//  Copyright © 2016 Dustin Bowers. All rights reserved.
//

import Foundation

public class GaltonBall {
    
    //
    // declare some variables
    var x_history = [Int]()
    var x: Int = 0
    var row: Int = 0
    
    //
    // initialize the ball
    init(x: Int = 0, row: Int = 0) {
        self.initialize_ball(x, row: row)
    }
    private func initialize_ball(x: Int, row: Int) {
        self.x = x
        self.row = row
        self.log_history()
    }
    
    //
    // The good stuff
    private func drop(delta: Int) {
        self.x += delta
        self.row += 1
        self.log_history()
    }
    public func drop_left() -> (Int, Int) {
        self.drop(0)
        return (self.x, self.row)
    }
    public func drop_right() -> (Int, Int) {
        self.drop(1)
        return (self.x, self.row)
    }
    
    //
    // Getters and such
    public func get_loc() -> (Int, Int) {
        return (self.x, self.row)
    }
    public func get_x() -> Int {
        return self.x
    }
    public func get_row() -> Int {
        return self.row
    }
    public func get_history() -> [Int] {
        return self.x_history
    }
    public func log_history() {
        self.x_history.append(self.x)
    }
}
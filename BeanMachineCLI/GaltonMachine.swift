//
//  GaltonMachine.swift
//  BeanMachineCLI
//
//  Created by Dustin Bowers on 8/4/16.
//  Copyright © 2016 Dustin Bowers. All rights reserved.
//

import Foundation

public class GaltonMachine {
    
    //
    // Declare some stuff
    var render_each_cycle: Bool
    
    var board_size: Int
    var output: Array<Array<GaltonBall>>
    var lr_bias: Double
    var current_ball: GaltonBall
    
    //
    // Initialize the Galton machine
    init(board_size: Int = 5, lr_bias: Double = 0.5, render_each_cycle: Bool) {
        self.board_size = board_size
        self.lr_bias = lr_bias
        self.render_each_cycle = render_each_cycle
        self.current_ball = GaltonBall()
        self.output = Array(count: board_size, repeatedValue: [])
    }
    
    // Drop a new ball into the machine
    public func insert_ball() {
        self.current_ball = GaltonBall(x: 0, row: 0)
    }
    
    // Step the current ball down the board
    public func step() -> BooleanType {
        
        let row: Int
        
        if (self.get_random() < self.lr_bias) {
            (_, row) = self.current_ball.drop_left()
        } else {
            (_, row) = self.current_ball.drop_right()
        }
        return (row+1 <= self.board_size - 1 ? true : false)
    }
    
    // Run the current ball completely through the board
    private func run_single_cycle() {
        
        // Create a new ball
        self.current_ball = GaltonBall(x: 0, row: 0)
        if(self.render_each_cycle) {
            self.render_current_ball()
        }
        
        // Let gravity do its thing
        while self.step() {
            if (self.render_each_cycle) {
                // Render some stuff
                self.render_current_ball()
            }
        } //while self.step()
    }
    
    // Run multiple balls through the board
    public func simulate(iterations: Int) -> Array<Array<GaltonBall>> {
        
        for i in 0..<iterations {
            if self.render_each_cycle {
                // Render some stuff
                print("Insert Ball #",i+1)
            }
            
            self.run_single_cycle()
            let x = self.current_ball.get_x()
            self.render_current_ball()
            self.output[x].append(self.current_ball)
        
        }
        return self.output
    }
    

    
    // Render the current ball's position as it would appear on a real board
    public func render_current_ball() {
        let (x, row) = self.current_ball.get_loc()
        
        let left_padding_count = self.board_size * 2 - row
        let right_padding_count = row * 2 - x * 2
        
        print(String(count: left_padding_count, repeatedValue: Character(" ")),"/"
        , String(count: x*2, repeatedValue: Character(" ")),"o"
        , String(count: right_padding_count, repeatedValue: Character(" ")), "\\"
            , separator: "")
    }

    // Return a random number 0.0 to 1.0
    public func get_random() -> Double {
        return Double(arc4random())/Double(UInt32.max)
    }
    
    public func get_output() -> Array<Array<GaltonBall>> {
        return self.output
    }
}


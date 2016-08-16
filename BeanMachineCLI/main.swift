//
//  main.swift
//  BeanMachineCLI
//
//  Created by Dustin Bowers on 8/4/16.
//  Copyright © 2016 Dustin Bowers.
//

import Foundation

func run(size: Int, iterations: Int, lr_bias: Double, render_output: Bool) {

    // Initialize a new Galton Machine
    let galton = GaltonMachine(board_size: size, lr_bias: lr_bias, render_each_cycle: render_output)
    
    // Run the simulation
    let output = galton.simulate(iterations)
    
    // Output the final counts for each bin
    let counts: Array<String> = output.map { String($0.count) }
    let counts_str = counts.joinWithSeparator(", ")
    print("Counts: ", counts_str)
}

var num_slots = 10
var num_iterations = 100
var lr_bias = 0.5

// Override defaults if command line arguments are provided
if(Process.arguments.count != 1 || Process.arguments.count != 3) {
    print("Arguments available: [num slots] [num iterations]")
} else {
    num_slots = Int(Process.arguments[1])!
    num_iterations = Int(Process.arguments[2])!
}

// Go time
run(num_slots,
    iterations: num_iterations,
    lr_bias: lr_bias,
    render_output: true)

print("Done")




//
//  main.swift
//  BeanMachineCLI
//
//  Created by Dustin Bowers on 8/4/16.
//  Copyright © 2016 Dustin Bowers. All rights reserved.
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

// Ensure command line arguments are provided
if(Process.arguments.count < 3) {
    print("Arguments required: [num slots] [num iterations]")
}

// Go time
run(Int(Process.arguments[1])!, iterations: Int(Process.arguments[2])!, lr_bias: 0.5, render_output: true)

print("Done")




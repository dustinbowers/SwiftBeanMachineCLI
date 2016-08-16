//
//  SimpleGaltonDistribution.swift
//  BeanMachineCLI
//
//  Created by Dustin Bowers on 8/5/16.
//  Copyright © 2016 Dustin Bowers.
//

import Foundation

// A no-frills implementation of what the GaltonMachine simulator is doing

func simple_galton_distribution(rows: Int, iterations: Int, lr_bias: Double = 0.5) -> Array<Int> {
    
    var current_offset: Int
    var output: Array<Int> = Array(count: rows+1, repeatedValue: 0)
    
    for _ in 1...iterations {
        
        // reset the offset
        current_offset = 0
        
        for _ in 1...rows {
            
            // Randomly increase the offset based on the left-right bias (left is no movement, right is +1)
            let r = Double(arc4random())/Double(UInt32.max)
            if(r <= lr_bias) {
                current_offset += 1
            } /* else { current_offset += 0 } */
        }
        
        // Increase the count of the slot where the "ball" landed
        output[current_offset] += 1
        
    }
    
    return output
}

let dist: Array<Int> = simple_galton_distribution(10, iterations: 1000, lr_bias: 0.5)
let str: String = dist.map { String($0) }.joinWithSeparator(", ")
//print("Distribution:", str)

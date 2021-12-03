#!/usr/bin/env roc

app "aoc-day1"
    packages { base: "platform" }
    imports [ base.Task.{succeed, await}, base.Stdout ]
    provides [ main ] to base


Option a : [ Some a, None ]

Aggr : { numItems: Nat, first: Option Nat, second: Option Nat, third: Option Nat}

test : Aggr, Nat -> Aggr
test = \state, elem ->
        when Triple state.first state.second state.third is 
            Triple (Some first) (Some second) (Some third) ->
              if  elem + second + third > first + second + third then
                  { numItems: state.numItems + 1, first: Some second, second: Some third, third: Some elem}
              else
                  { state & first: Some second, second: Some third, third: Some elem }
            Triple _ second third ->
                { state & first: second, second: third, third: Some elem }
        

part2 = 
    nums = [199, 
         200, 208, 210, 200, 207, 240, 269, 260, 263]
    
    start: Aggr
    start = {numItems: 0, first: None, second: None, third: None}
            
    
    x = List.walk nums start test |> (\x2 -> Num.toStr x2.numItems) 
 
        
    Stdout.line x


part1 = 
    nums = [199, 
        200, 208, 210, 200, 207, 240, 269, 260, 263]
    first = 
        when List.first nums is
            Ok v -> v
            Err _ -> -1
   
    x = List.walk nums {numItems: 0, depth: first} (\state, elem ->
        if elem > state.depth then
            {numItems: state.numItems + 1, depth: elem}
        else
            {state & depth: elem}
        ) |> (\x2 -> Num.toStr x2.numItems) 

    Stdout.line x

main =
    _ <- await (succeed {})
    
    _ <- await (Stdout.line "part1")
    _ <- await (part1)

    _ <- await (Stdout.line "part2")
    _ <- await (part2)

    Stdout.line "done"
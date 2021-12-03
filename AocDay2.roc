#!/usr/bin/env roc

app "aoc-day1"
    packages { base: "platform" }
    imports [ base.Task.{succeed, await}, base.Stdout , base.readFile]
    provides [ main ] to base

Aggr : { forward: Nat, vertical: Nat}



part1 = 
    contents <- await readFile("2_1.txt")

  
    Stdout.line contents

main =
    _ <- await (succeed {})
    

    _ <- await (Stdout.line "part1")
    _ <- await (part1)

    Stdout.line "done"
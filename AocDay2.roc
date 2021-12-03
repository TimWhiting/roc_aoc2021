#!/usr/bin/env roc

app "aoc-day2"
    packages { base: "cli-platform/main.roc" }
    imports [ base.Task.{succeed, await, Task}, base.Stdout, base.File ]
    provides [ main ] to base

Aggr : { forward: Nat, vertical: Nat }

Dir: [ Forward, Down, Up ]
DirAmount: { dir: Dir, amount: Nat }

AocError a : [ ParseError ]a

# parseAmount: Str -> [ Nat, AocError ]
# parseAmount = \str ->
#     when str is
#         "0" -> 0
#         "1" -> 1
#         "2" -> 2
#         "3" -> 3
#         "4" -> 4
#         "5" -> 5
#         "6" -> 6
#         "7" -> 7
#         "8" -> 8
#         "9" -> 9
#         _ -> ParseError

# parseAmount: Str -> [ Dir, AocError ]
# parseDir = \str -> 
#     when dirStr is
#         "forward" -> Forward
#         "down" -> Down
#         "up" -> Up
#         _ -> ParseError

# process: List Str -> List DirAmount 
# process = \lines -> 
#     List.map lines \line ->
#         dirAmt = Str.split line " "
#         dir = parseDir (List.get dirAmt 0)
#         amt = parseAmount (List.get dirAmt 1)
#         when Tuple dir amt is
#             Tuple (Dir dir) (Nat amt) -> DirAmount {
#                     dir, amt
#                 }
#             Tuple _ _ -> DirAmount {
#                     dir: Forward,
#                     amt: 0
#                 }
            
            

main =
    _ <- await (succeed {})
    _ <- await (Stdout.line "part1")
    Stdout.line "part2"
#     result <- await (File.readUtf8 "2_1.txt")
#     when result is
#         InvalidFormat -> Stdout.line "error"
#         lines -> 
#             newLines = process lines
#             Stdout.line "success"

    Stdout.line "done"
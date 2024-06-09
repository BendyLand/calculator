package main

import "core:fmt"

main :: proc() {
    fmt.println("Hello Odin calculator!")
    test_addition()
    fmt.println()
    test_subtraction()
}

add_ints :: proc(a: int, b: int) -> int {
    return a + b
}
add_floats :: proc(a: f32, b: f32) -> f32 {
    return a + b
}
add :: proc{add_ints, add_floats}
test_addition :: proc() {
    add_res1 := add(1, 3)
    add_res2 := add(2.5, 3.3)
    add_res3 := add(3, 4.5)
    add_res4 := add(6.2, 9)
    fmt.println(add_res1)
    fmt.println(add_res2)
    fmt.println(add_res3)
    fmt.println(add_res4)
}

subtract_ints :: proc(a: int, b: int) -> int {
    return a - b
}
subtract_floats :: proc(a: f32, b: f32) -> f32 {
    return a - b
}
subtract :: proc{subtract_ints, subtract_floats}
test_subtraction :: proc() {
    sub_res1 := subtract(10, 2)
    sub_res2 := subtract(12.4, 8.1)
    sub_res3 := subtract(25, 4.1)
    sub_res4 := subtract(12.5, 6)
    fmt.println(sub_res1)
    fmt.println(sub_res2)
    fmt.println(sub_res3)
    fmt.println(sub_res4)
}

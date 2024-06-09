package main

import "core:fmt"

main :: proc() {
    fmt.println("Hello Odin calculator!")
    test_addition()
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



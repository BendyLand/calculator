package main

import "core:fmt"

main :: proc() {
    fmt.println("Hello Odin calculator!")
    test_addition()
    fmt.println()
    test_subtraction()
    fmt.println()
    test_multiplication()
    fmt.println()
    test_division()
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
    fmt.println("1 + 3 =", add_res1)
    fmt.println("2.5 + 3.3 =", add_res2)
    fmt.println("3 + 4.5 =", add_res3)
    fmt.println("6.2 + 9 =", add_res4)
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
    fmt.println("10 - 2 =", sub_res1)
    fmt.println("12.4 - 8.1 =", sub_res2)
    fmt.println("25 - 4.1 =", sub_res3)
    fmt.println("12.5 - 6 =", sub_res4)
}

multiply_ints :: proc(a: int, b: int) -> int {
    return a * b
}
multiply_floats :: proc(a: f32, b: f32) -> f32 {
    return a * b
}
multiply :: proc{multiply_ints, multiply_floats}
test_multiplication :: proc() {
    mul_res1 := multiply(2, 5)
    mul_res2 := multiply(2.5, 3.5)
    mul_res3 := multiply(5, 2.5)
    mul_res4 := multiply(3.5, 2)
    fmt.println("2 * 5 =", mul_res1)
    fmt.println("2.5 * 3.5 =", mul_res2)
    fmt.println("5 * 2.5 =", mul_res3)
    fmt.println("3.5 * 2 =", mul_res4)
}

divide_ints :: proc(a: int, b: int) -> int {
    result: int
    if b != 0 {
        result = a / b
    }
    else {
        result = 0
    }
    return result
}
divide_floats :: proc(a: f32, b: f32) -> f32 {
    result: f32
    if b != 0.0 {
        result = a / b
    }
    else {
        result = 0.0
    }
    return result
}
divide :: proc{divide_ints, divide_floats}
test_division :: proc() {
    div_res1 := divide(6, 2)
    div_res1_2 := divide(6, 0)
    div_res2 := divide(18.5, 6.5)
    div_res2_2 := divide(18.5, 0.0)
    div_res3 := divide(7, 3.5)
    div_res4 := divide(12.5, 2)
    fmt.println("6 / 2 =", div_res1)
    fmt.println("6 / 0 =", div_res1_2)
    fmt.println("18.5 / 6.5 =", div_res2)
    fmt.println("18.5 / 0 =", div_res2_2)
    fmt.println("7 / 3.5 =", div_res3)
    fmt.println("12.5 / 2 =", div_res4)
}


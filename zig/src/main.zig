const std = @import("std");

pub fn main() !void {
    const sum = add(5, 3);
    const difference = subtract(5, 3);
    const product = multiply(10, 2);
    const quotient = divide(6, 3);

    std.debug.print("Sum: {}\n", .{sum});
    std.debug.print("Difference: {}\n", .{difference});
    std.debug.print("Product: {}\n", .{product});
    std.debug.print("Quotient: {}\n", .{quotient});
}

pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

pub fn subtract(a: i32, b: i32) i32 {
    return a - b;
}

pub fn multiply(a: i32, b: i32) i32 {
    return a * b;
}

pub fn divide(a: f32, b: f32) f32 {
    var result: f32 = 0.0;
    if (b != 0) {
        result = a / b;
    }
    else {
        std.debug.print("No dividing by zero!\n", .{});
        result = 0.0;
    }
    return result;
}
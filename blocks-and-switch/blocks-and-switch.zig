const std = @import("std");

pub fn main() !void {
    // a block can define a new scope
    {
        const x: u8 = 42;
        std.debug.print("x: {}\n", .{x});
    }
    // x is no longer in scope here
    // std.debug.print("x: {}\n", .{x});

    // blocks are expressions and can return a value
    // using a label and a break
    const x: u8 = blk: {
        var y: u8 = 13;
        const z = 42;
        break :blk y + z;
    };
    std.debug.print("x: {}\n", .{x});

    // `switch` controls execution flow based on a value
    switch (x) {
        // range inclusive on both ends
        0...20 => std.debug.print("It's 0 to 33.\n", .{}),

        // you can combine several values to test with commas
        // this is like fallthrough behavior in other languages
        30, 31, 32 => std.debug.print("It's 40, 41, or 42", .{}),

        // you can capture the matched value
        40...60 => |n| std.debug.print("It's {}\n", .{n}),

        77 => {
            const a = 1;
            const b = 2;
            std.debug.print("a + b == {}\n", .{a + b});
        },

        blk: {
            const a = 100;
            const b = 2;
            break :blk a + b;
        } => std.debug.print("It's 102.\n", .{}),

        // `else` is the default if no other prong matches
        // mandatory if non-exhaustive switch
        else => std.debug.print("None of the above!\n", .{}),
    }

    // like `if`, `switch` can be an expression
    const answer: u8 = switch (x) {
        0...10 => 1,
        42 => 2,
        else => 3,
    };
    std.debug.print("answer: {}\n", .{answer});
}

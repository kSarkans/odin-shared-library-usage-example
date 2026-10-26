package main

import "core:fmt"
import Fw_Core "fw:core"

main :: proc() {
	fmt.printfln("Fibonacci of 10 = %d", Fw_Core.fib(10))
}

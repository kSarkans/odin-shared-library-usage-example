package core

// BINARY_DIR may vary depending on the configuration and platform:
// - build/linux/debug/bin
// - build/windows/release/bin
// So it is better to define that path as `-define:BINARY_DIR="build/linux/debug/bin"`
BINARY_DIR :: #config(BINARY_DIR, ".")
when ODIN_OS == .Windows {
	@(extra_linker_flags = "/LIBPATH:" + BINARY_DIR)
	foreign import libcore "system:FwCore"
} else {
	@(extra_linker_flags = "-L" + BINARY_DIR)
	foreign import libcore "system:FwCore"
}

foreign libcore {
	/*
	Returns the Fibonacci number at index `n`.

	Indexing: F(0) = 0, F(1) = 1.
	*/
	fib :: proc(n: int) -> int ---
}

package core

@(export)
fib :: proc(n: int) -> int {
	if (n == 0) do return 0
	else if (n == 1) do return 1
	else do return fib(n - 1) + fib(n - 2)
}

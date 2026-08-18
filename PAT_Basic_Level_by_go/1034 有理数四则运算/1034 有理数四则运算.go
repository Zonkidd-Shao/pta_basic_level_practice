/*
题目：1034 有理数四则运算
实现原理：以分子、分母保存分数，运算后用最大公约数约分并统一分母符号；分母为 0 时输出 Inf。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func abs64(x int64) int64 {
	if x < 0 {
		return -x
	}
	return x
}

func gcd(a, b int64) int64 {
	a, b = abs64(a), abs64(b)
	for b != 0 {
		a, b = b, a%b
	}
	return a
}

type rational struct {
	num, den int64
}

func simplify(r rational) rational {
	if r.den < 0 {
		r.num = -r.num
		r.den = -r.den
	}
	if r.den != 0 {
		g := gcd(r.num, r.den)
		if g != 0 {
			r.num /= g
			r.den /= g
		}
	}
	return r
}

func parse(s string) rational {
	parts := strings.Split(s, "/")
	num, _ := strconv.ParseInt(parts[0], 10, 64)
	den, _ := strconv.ParseInt(parts[1], 10, 64)
	return simplify(rational{num, den})
}

func format(r rational) string {
	r = simplify(r)
	if r.den == 0 {
		return "Inf"
	}
	if r.num == 0 {
		return "0"
	}
	if r.den == 1 {
		return strconv.FormatInt(r.num, 10)
	}
	if abs64(r.num) > r.den {
		integer := r.num / r.den
		rem := r.num % r.den
		if rem < 0 {
			rem = -rem
		}
		return fmt.Sprintf("%d %d/%d", integer, rem, r.den)
	}
	return fmt.Sprintf("%d/%d", r.num, r.den)
}

func add(a, b rational) rational { return simplify(rational{a.num*b.den + b.num*a.den, a.den * b.den}) }
func sub(a, b rational) rational { return simplify(rational{a.num*b.den - b.num*a.den, a.den * b.den}) }
func mul(a, b rational) rational { return simplify(rational{a.num * b.num, a.den * b.den}) }
func div(a, b rational) rational {
	if b.num == 0 {
		return rational{0, 0}
	}
	return simplify(rational{a.num * b.den, a.den * b.num})
}

// 有理数四则运算：对两个分数分别做 + - * / 并输出。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	a := parse(f[0])
	b := parse(f[1])
	ops := []struct {
		sym string
		fn  func(rational, rational) rational
	}{{" + ", add}, {" - ", sub}, {" * ", mul}, {" / ", div}}
	for _, op := range ops {
		fmt.Printf("%s%s%s = %s\n", format(a), op.sym, format(b), format(op.fn(a, b)))
	}
}

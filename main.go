package main

import (
	"fmt"
	"math"
)

type Operation func(x, y *float64) float64

func main() {
	fmt.Println("> calculator.go")

	var op string
	var x, y float64
	var code string

	for {
		operation := map[string]Operation{
			"add":      func(x, y *float64) float64 { return *x + *y },
			"subtract": func(x, y *float64) float64 { return *x - *y },
			"multiply": func(x, y *float64) float64 { return *x * *y },
			"divide": func(x, y *float64) float64 {
				if *y == 0 {
					fmt.Println("-> Error: Division by zero!")
					return 0
				}
				return *x / *y
			},
			"power": func(x, y *float64) float64 { return math.Pow(*x, *y) },
			"root": func(x, y *float64) float64 {
				if *y == 0 {
					fmt.Println("-> Error: Root by zero!")
					return 0
				}
				return math.Pow(*x, 1.0 / *y)
			},
		}

		fmt.Println("\n> Enter one of the following operations:")
		fmt.Println("-> add")
		fmt.Println("-> subtract")
		fmt.Println("-> multiply")
		fmt.Println("-> divide")
		fmt.Println("-> power")
		fmt.Println("-> root")

		fmt.Printf("\n> ")
		fmt.Scan(&op)

		if f, ok := operation[op]; ok {
			fmt.Println("> Enter two numbers in the format 'x, y' to calculate the result:")
			fmt.Printf("\n> ")
			fmt.Scanf("%f, %f", &x, &y)

			fmt.Printf("-> Result: %.2f", f(&x, &y))
		} else {
			fmt.Println("-> Invalid operation!")
		}

		fmt.Println("\n> Would you like to redo the process? 'Yes' or 'No'")
		fmt.Printf("> ")
		fmt.Scanf("%s", &code)

		if code == "No" || code == "no" {
			fmt.Println("\n-> Bye!")
			break
		}

		fmt.Println("Provide two numbers for adding")
	}
}

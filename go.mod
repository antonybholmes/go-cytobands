module github.com/antonybholmes/go-cytobands

go 1.23

replace github.com/antonybholmes/go-dna => ../go-dna

replace github.com/antonybholmes/go-sys => ../go-sys

replace github.com/antonybholmes/go-basemath => ../go-basemath

require (
	github.com/mattn/go-sqlite3 v1.14.24
	github.com/rs/zerolog v1.33.0
)

require (
	github.com/antonybholmes/go-basemath v0.0.0-20250205152412-840349f1ca5c // indirect
	golang.org/x/exp v0.0.0-20250128182459-e0ece0dbea4c // indirect
)

require (
	github.com/antonybholmes/go-dna v0.0.0-20250205152401-8d271cca2c21
	github.com/mattn/go-colorable v0.1.14 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	golang.org/x/sys v0.30.0 // indirect
)

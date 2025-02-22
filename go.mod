module github.com/antonybholmes/go-cytobands

go 1.24

toolchain go1.24.0

replace github.com/antonybholmes/go-dna => ../go-dna

replace github.com/antonybholmes/go-sys => ../go-sys

replace github.com/antonybholmes/go-basemath => ../go-basemath

require (
	github.com/mattn/go-sqlite3 v1.14.24
	github.com/rs/zerolog v1.33.0
)

require (
	github.com/antonybholmes/go-basemath v0.0.0-20250220232044-da65245fca93 // indirect
	golang.org/x/exp v0.0.0-20250218142911-aa4b98e5adaa // indirect
)

require (
	github.com/antonybholmes/go-dna v0.0.0-20250220232040-74ecfe3b89ba
	github.com/mattn/go-colorable v0.1.14 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	golang.org/x/sys v0.30.0 // indirect
)

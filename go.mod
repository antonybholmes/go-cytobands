module github.com/antonybholmes/go-cytobands

go 1.24

toolchain go1.24.0

replace github.com/antonybholmes/go-dna => ../go-dna

replace github.com/antonybholmes/go-sys => ../go-sys

replace github.com/antonybholmes/go-basemath => ../go-basemath

require (
	github.com/mattn/go-sqlite3 v1.14.28
	github.com/rs/zerolog v1.34.0
)

require (
	github.com/antonybholmes/go-basemath v0.0.0-20250603204422-af3eff854e10 // indirect
	golang.org/x/exp v0.0.0-20250606033433-dcc06ee1d476 // indirect
)

require (
	github.com/antonybholmes/go-dna v0.0.0-20250603204418-b939561ebadd
	github.com/mattn/go-colorable v0.1.14 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	golang.org/x/sys v0.33.0 // indirect
)

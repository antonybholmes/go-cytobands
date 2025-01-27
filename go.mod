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
	github.com/antonybholmes/go-basemath v0.0.0-20250107213632-9971295f8456 // indirect
	golang.org/x/exp v0.0.0-20250106191152-7588d65b2ba8 // indirect
)

require (
	github.com/antonybholmes/go-dna v0.0.0-20250110222441-27b549fda20d
	github.com/mattn/go-colorable v0.1.14 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	golang.org/x/sys v0.29.0 // indirect
)

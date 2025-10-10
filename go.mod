module github.com/antonybholmes/go-cytobands

go 1.25

replace github.com/antonybholmes/go-dna => ../go-dna

replace github.com/antonybholmes/go-sys => ../go-sys

replace github.com/antonybholmes/go-basemath => ../go-basemath

require (
	github.com/mattn/go-sqlite3 v1.14.32
	github.com/rs/zerolog v1.34.0
)

require (
	github.com/antonybholmes/go-basemath v0.0.0-20251008222328-9d996776e793 // indirect
	golang.org/x/exp v0.0.0-20251009144603-d2f985daa21b // indirect
)

require (
	github.com/antonybholmes/go-dna v0.0.0-20251008222323-bbf03fd1088e
	github.com/mattn/go-colorable v0.1.14 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	golang.org/x/sys v0.37.0 // indirect
)

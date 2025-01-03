module github.com/antonybholmes/go-cytobands

go 1.23

replace github.com/antonybholmes/go-dna => ../go-dna

replace github.com/antonybholmes/go-sys => ../go-sys

replace github.com/antonybholmes/go-basemath => ../go-basemath

require (
	github.com/mattn/go-sqlite3 v1.14.24
	github.com/rs/zerolog v1.33.0
)

require github.com/antonybholmes/go-basemath v0.0.0-20241223034309-5f70a342a0e3 // indirect

require (
	github.com/antonybholmes/go-dna v0.0.0-20241231004053-571f6c9d6eb6
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	golang.org/x/sys v0.28.0 // indirect
)

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
	github.com/antonybholmes/go-basemath v0.0.0-20250224005422-5b9bd198f1ca // indirect
	golang.org/x/exp v0.0.0-20250228200357-dead58393ab7 // indirect
)

require (
	github.com/antonybholmes/go-dna v0.0.0-20250222184121-6f6958db8983
	github.com/mattn/go-colorable v0.1.14 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	golang.org/x/sys v0.30.0 // indirect
)

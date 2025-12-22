package cytobanddb

import (
	"sync"

	"github.com/antonybholmes/go-cytobands"
)

var (
	instance *cytobands.CytobandDB
	once     sync.Once
)

func InitCytobandDB(dir string) *cytobands.CytobandDB {
	once.Do(func() {
		instance = cytobands.NewCytobandDB(dir)
	})

	return instance
}

func GetInstance() *cytobands.CytobandDB {
	return instance
}

func Dir() string {
	return instance.Dir()
}

func Cytobands(genome string, chr string) ([]cytobands.Cytoband, error) {
	return instance.Cytobands(genome, chr)
}

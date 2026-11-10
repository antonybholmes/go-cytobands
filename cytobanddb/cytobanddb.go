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

func Instance() *cytobands.CytobandDB {
	return instance
}

package cytobandsdbcache

import (
	"sync"

	"github.com/antonybholmes/go-cytobands"
)

var instance *cytobands.CytobandsDB
var once sync.Once

func InitCache(dir string) *cytobands.CytobandsDB {
	once.Do(func() {
		instance = cytobands.NewCytobandsDB(dir)
	})

	return instance
}

func GetInstance() *cytobands.CytobandsDB {
	return instance
}

func Dir() string {
	return instance.Dir()
}

func Cytobands(genome string, chr string) ([]cytobands.Cytoband, error) {
	return instance.Cytobands(genome, chr)
}

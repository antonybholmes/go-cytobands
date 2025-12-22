package cytobands

import (
	"database/sql"
	"fmt"
	"path/filepath"

	"github.com/antonybholmes/go-dna"
	"github.com/antonybholmes/go-sys"
	_ "github.com/mattn/go-sqlite3"
)

// const MAGIC_NUMBER_OFFSET_BYTES = 0
// const BIN_SIZE_OFFSET_BYTES = MAGIC_NUMBER_OFFSET_BYTES + 4
// const BIN_WIDTH_OFFSET_BYTES = BIN_SIZE_OFFSET_BYTES + 4
// const N_BINS_OFFSET_BYTES = BIN_WIDTH_OFFSET_BYTES + 4
// const BINS_OFFSET_BYTES = N_BINS_OFFSET_BYTES + 4

type (
	Cytoband struct {
		Location    *dna.Location `json:"loc"`
		Name        string        `json:"name"`
		GiemsaStain string        `json:"giemsaStain"`
	}

	CytobandDB struct {
		dir string
	}
)

const ChrSql = `SELECT id, chr, start, end, name, giemsa_stain 
	FROM cytobands 
	WHERE chr=:chr 
	ORDER BY chr, start, end`

func (tracksDb *CytobandDB) Dir() string {
	return tracksDb.dir
}

func NewCytobandDB(dir string) *CytobandDB {
	return &CytobandDB{dir: dir}
}

func (cytobandsDB *CytobandDB) Cytobands(genome string, chr string) ([]Cytoband, error) {
	var ret = make([]Cytoband, 0, 10)

	db, err := sql.Open(sys.Sqlite3DB, filepath.Join(cytobandsDB.dir, fmt.Sprintf("%s.db?mode=ro", genome)))

	if err != nil {
		return ret, err //fmt.Errorf("there was an error with the database query")
	}

	defer db.Close()

	rows, err := db.Query(ChrSql, sql.Named("chr", chr))

	if err != nil {
		return ret, err //fmt.Errorf("there was an error with the database query")
	}

	defer rows.Close()

	//var currentExon *GenomicSearchFeature

	var id int

	var start int
	var end int
	var name string
	var giemsaStain string

	for rows.Next() {
		//err := geneRows.Scan(&id, &level, &chr, &start, &end, &strand, &geneSymbol, &geneId, &transcriptId, &exonId)
		err := rows.Scan(&id, &chr, &start, &end, &name, &giemsaStain)

		if err != nil {
			return ret, err //fmt.Errorf("there was an error with the database query")
		}

		location, err := dna.NewLocation(chr, start, end)

		if err != nil {
			return ret, err
		}

		ret = append(ret, Cytoband{Location: location, Name: name, GiemsaStain: giemsaStain})
	}

	return ret, nil
}

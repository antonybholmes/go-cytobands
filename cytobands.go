package cytobands

import (
	"database/sql"
	"fmt"
	"path/filepath"

	"github.com/antonybholmes/go-dna"
	_ "github.com/mattn/go-sqlite3"
)

// const MAGIC_NUMBER_OFFSET_BYTES = 0
// const BIN_SIZE_OFFSET_BYTES = MAGIC_NUMBER_OFFSET_BYTES + 4
// const BIN_WIDTH_OFFSET_BYTES = BIN_SIZE_OFFSET_BYTES + 4
// const N_BINS_OFFSET_BYTES = BIN_WIDTH_OFFSET_BYTES + 4
// const BINS_OFFSET_BYTES = N_BINS_OFFSET_BYTES + 4

const CHR_SQL = `SELECT id, chr, start, end, name, giemsa_stain 
	FROM cytobands 
	WHERE chr=?1 
	ORDER BY chr, start, end`

type Cytoband struct {
	Name        string       `json:"name"`
	GiemsaStain string       `json:"giemsaStain"`
	Location    dna.Location `json:"loc"`
}

type CytobandsDB struct {
	dir string
}

func (tracksDb *CytobandsDB) Dir() string {
	return tracksDb.dir
}

func NewCytobandsDB(dir string) *CytobandsDB {

	return &CytobandsDB{dir: dir}
}

func (cytobandsDB *CytobandsDB) Cytobands(genome string, chr string) ([]Cytoband, error) {
	db, err := sql.Open("sqlite3", filepath.Join(cytobandsDB.dir, fmt.Sprintf("%s.db?mode=ro", genome)))

	if err != nil {
		return nil, err //fmt.Errorf("there was an error with the database query")
	}

	defer db.Close()

	rows, err := db.Query(CHR_SQL,
		chr)

	if err != nil {
		return nil, err //fmt.Errorf("there was an error with the database query")
	}

	defer rows.Close()

	//var currentExon *GenomicSearchFeature

	var id uint

	var start uint
	var end uint
	var name string
	var giemsaStain string

	var ret = make([]Cytoband, 0, 10)

	for rows.Next() {
		//err := geneRows.Scan(&id, &level, &chr, &start, &end, &strand, &geneSymbol, &geneId, &transcriptId, &exonId)
		err := rows.Scan(&id, &chr, &start, &end, &name, &giemsaStain)

		if err != nil {
			return nil, err //fmt.Errorf("there was an error with the database query")
		}

		ret = append(ret, Cytoband{Location: dna.Location{Chr: chr, Start: start, End: end}, Name: name, GiemsaStain: giemsaStain})
	}

	return ret, nil
}

package cytobands

import (
	"testing"

	"github.com/rs/zerolog/log"
)

func TestWithin(t *testing.T) {

	db := NewCytobandsDB("/home/antony/development/data/modules/cytobands")

	bands, err := db.Cytobands("chr12")

	if err != nil {
		t.Fatalf(`err %s`, err)
	}

	log.Debug().Msgf("%v", bands)
}

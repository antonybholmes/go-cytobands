package routes

import (
	"github.com/antonybholmes/go-cytobands/cytobanddb"
	"github.com/antonybholmes/go-web"
	"github.com/gin-gonic/gin"
)

func CytobandsRoute(c *gin.Context) {

	cytobands, _ := cytobanddb.Cytobands(c.Param("assembly"), c.Param("chr"))

	// if err != nil {
	// 	return web.ErrorReq(err)
	// }

	web.MakeDataResp(c, "", cytobands)
}

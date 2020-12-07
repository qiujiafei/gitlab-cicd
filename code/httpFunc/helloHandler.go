package httpFunc

import (
	"fmt"
	"net/http"
)

func SayHello(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello World!") //这个写入到w的是输出到客户端的
}

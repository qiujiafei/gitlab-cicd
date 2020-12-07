package test

import (
	"code/httpFunc"
	"io/ioutil"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestHelloWorld(t *testing.T) {
	mux := http.NewServeMux()
	mux.HandleFunc("/", httpFunc.SayHello)

	r, _ := http.NewRequest(http.MethodGet, "/", nil)
	w := httptest.NewRecorder()
	mux.ServeHTTP(w, r)
	resp := w.Result()
	if resp.StatusCode != http.StatusOK {
		t.Errorf("Response code is %v", resp.StatusCode)
	}
	body, _ := ioutil.ReadAll(resp.Body)
	defer resp.Body.Close()
	if string(body) != "Hello World!" {
		t.Errorf("Response Body is %s", string(body))
	}
}

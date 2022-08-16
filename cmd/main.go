package main

import (
	"github.com/konveyor/tackle2-addon/repository"
	"github.com/konveyor/tackle2-addon/ssh"
	hub "github.com/konveyor/tackle2-hub/addon"
	"os"
  "os/exec"
	"path"
  "log"
	"strings"
)

var (
	// hub integration.
	addon = hub.Addon
	Log   = hub.Log
)

type SoftError = hub.SoftError

func main() {
    cmd := exec.Command("python", "tca_cli.py", "-input_json","in_standard.json", "-output_json", "op_stand.json")
    cmd.Stdout = os.Stdout
    cmd.Stderr = os.Stderr
    log.Println(cmd.Run())
}

package main

import (
	"fmt"
	"os"
	"strconv"

	"github.com/cloudfoundry-community/go-cfenv"
	"gopkg.in/go-playground/webhooks.v3"
	"gopkg.in/go-playground/webhooks.v3/github"
)

var (
	path = "/validate"
)

func main() {

	appEnv, err := cfenv.Current()
	if err != nil {
		panic(err)
	}

	githubSecret := os.Getenv("GITHUB_WEBHOOK_SECRET")

	hook := github.New(&github.Config{Secret: githubSecret})
	hook.RegisterEvents(HandlePullRequest, github.PullRequestEvent)

	err = webhooks.Run(hook, ":"+strconv.Itoa(appEnv.Port), path)
	if err != nil {
		panic(err)
	}
}

// HandlePullRequest handles GitHub pull_request events
func HandlePullRequest(payload interface{}, header webhooks.Header) {

	fmt.Println("Handling Pull Request")

	pl := payload.(github.PullRequestPayload)

	// Do whatever you want from here...
	fmt.Printf("%+v", pl)
}

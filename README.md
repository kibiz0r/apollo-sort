# apollo-sort

## Purpose

In order to maintain consistency in a fundamentally unordered list of tasks, as a project manager, I want a Chrome extension to provide a button to sort a task list alphabetically.

## Usage

* Download [js/apollo-sort.user.js](https://github.com/kibiz0r/apollo-sort/raw/master/js/apollo-sort.user.js)
* Open the script with a text editor
* Replace `<YOUR API KEY GOES HERE>` with your API key (e.g. `api_key = 'ABCDEFG1234...';`)
* Open the script with Chrome
* Approve the installation

Whenever you hit a URL matching `*.apollohq.com`, the script will watch for task lists and add a `Sort A-Z` button to its row of buttons.

## Troubleshooting

[Check the JavaScript console](https://developers.google.com/chrome-developer-tools/docs/console), you should at least see some output saying the script has been initialized. Other than that, check out any error output and responses from the server.

## Development

First of all, put your API key in a file named `my_api_key`. This will be used when compiling the script.

To start automatically compiling the JS whenever changes are detected, run `guard`.

To start Chrome and have it load the user script for manual testing:

* Run `rake`
* Click the script when Chrome "downloads" it
* Approve the installation
* Refresh the task list

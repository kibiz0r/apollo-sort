# apollo-sort

## Purpose

In order to maintain consistency in a fundamentally unordered list of tasks, as a project manager, I want a Chrome extension to provide a button to sort a task list alphabetically.

## Usage

* Download `js/apollo-sort.user.js`
* Open the script with a text editor
* Replace `<YOUR API KEY GOES HERE>` with your API key
* Open the script with Chrome
* Approve the installation

Whenever you hit a URL matching *.apollohq.com, the script will watch for task lists and add a `Sort A-Z` button to its row of buttons.

## Troubleshooting

[Check the JavaScript console](https://developers.google.com/chrome-developer-tools/docs/console), you should at least see some output saying the script has been initialized. Other than that, check out any error output and responses from the server.

## Development

To start automatically compiling the JS whenever changes are detected, run `guard`.

To start Chrome and have it load the user script for manual testing:

* run `rake`
* click the script when Chrome "downloads" it
* approve the installation
* refresh the task list

# web-content-watcher
Watches websites and notifies on changes.

You can configure websites you want to watch. See file `websites/archlinux-linux-pkg.yml` for an example. It notifies if the linux packages change on the Arch Linux website.

You may call `./wcw` by cron, for example once a day.

The notification is done by hook files. The script outputs "Content has changed" or "No new content" and calls all files in the hooks directory (filename ending with .hooks).

When `./wcw` is called, if fetches the websites specified by the `websites/*.yml` files and compares the content with the previous stored version. The changed version is then stored in the `saved-content/` directory.

The second method is to provide a command in the yml file. Have a look at `websites/archlinux-linux-pkg-jq.yml`.
It fetches a website using curl and extracts only a subset of the returned json using the jq program in a pipe. Please note that all commands are run with the same user as wcw itself.


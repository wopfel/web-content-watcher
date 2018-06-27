# web-content-watcher
Watches websites and notifies on changes.

You can configure websites you want to watch. See file `websites/archlinux-linux-pkg.yml` for an example. It notifies if the linux packages change on the Arch Linux website.

You may call this by cron, for example once a day.

The notification is not implemented yet. The script just outputs "Content has changed" or "No new content" so far.

When `./wcw` is called, if fetches the websites specified by the `websites/*.yml` files and compares the content with the previous stored version. The changed version is then stored in the `saved-content/` directory.


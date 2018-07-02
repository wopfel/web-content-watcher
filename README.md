# web-content-watcher
Watches websites and notifies on changes.

You can configure websites you want to watch. See file `websites/archlinux-linux-pkg.yml.sample` for an example. If you copy this file to `websites/archlinux-linux-pkg.yml` (no .sample at the end) it notifies if the linux packages change on the Arch Linux website.

You may call `./wcw` by cron, for example once a day.

The notification is done by hook files. The script outputs "Content has changed" or "No new content" and calls all files in the hooks directory (filename ending with .hooks).

When `./wcw` is called, if fetches the websites (method 1) specified by the `websites/*.yml` files and compares the content with the previous stored version. The changed version is then stored in the `saved-content/` directory.

The second method is to provide a command in the yml file. Have a look at `websites/archlinux-linux-pkg-jq.yml.sample`.
It fetches a website using curl and extracts only a subset of the returned json using the jq program in a pipe. Please note that all commands are run with the same user as wcw itself.

## Config file

Config files are stored in the `websites/` directory. Only files ending in .yaml or .yml are processed.



## Hook file

Hook files are read from the `hooks/` directory. Only files ending with .hook are processed.
The file has to be executable (`chmod u+x`).

The hook files are called every time a config file is processed (independent of the change status).

When the hook file is called, up to 4 parameters are passed:

1. "changed" (if the content has changed) or "unchanged" (if it has not)
2. the config name (without the file extension)
3. the filename with the current content of the website
4. the filename with the previous (old) content (only passed when the content has changed)


## Getting started ##

This step-by-step instructions assumes you have a Pushover account (Pushover is a separate service, not related to this script). Otherwise, you can easily adopt the hook script for a Prowl notification or a mail.

At the end, you will receive a notification when the new Arch Linux ISO is ready. Usually this happens once a month on the 1st. When a new ISO is released no later than 1 hour you should get a notification (1 hour so the Arch web servers don't get stressed).

1. Copy `websites/archlinux-iso.yml.sample` to `websites/archlinux-iso.yml`
2. Copy `hooks/pushover.hook.sample` to `hooks/pushover.hook` and modify it to your needs
3. Execute ./wcw, it should detect there was no old file
4. Run a cron job calling the `wcw` script on the 1st day of each month every hour.



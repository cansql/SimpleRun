# SimpleRun (Minecraft Server Starter)

![New NebliyMSS banner.](https://static.cansahin.tr/images/simplerun-banner.jpg)

> A modern, interactive, one-command script to generate the perfect `start.sh` launcher for your Linux Minecraft server.

Stop manually writing `start.sh` scripts. NebliyMSS (Nebliy Minecraft Server Starter) provides a colorful, interactive terminal interface that asks you the right questions and generates a robust, auto-restarting launch script for you.

![License](https://img.shields.io/badge/license-MIT-blue.svg) ![Version](https://img.shields.io/badge/version-v0.0.1-green.svg) ![Shell](https://img.shields.io/badge/shell-bash-lightgrey.svg)
---

## 🚀 Key Features

* **One-Command Install:** Get started instantly. No `wget`, no `chmod`, no fuss.
* **Interactive Setup:** Asks for essential info (RAM, server path, JAR file name) in a user-friendly way.
* **Auto-Restart:** The generated `start.sh` script is wrapped in a `while true` loop. If your server crashes, it will automatically restart after 5 seconds.

## ⚡ One-Command Installation

To run the generator, just paste the following command into your Linux terminal:

```bash
bash <(curl -sSL https://simplerun.cansahin.tr/simplerun.sh)

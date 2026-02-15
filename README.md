# SimpleRun (Minecraft Server Starter)

![New SimpleRun banner.](https://static.cansahin.tr/images/simplerun-banner.jpg)

> A modern, interactive, one-command script to generate the perfect `start.sh` launcher for your Linux Minecraft server.

Stop manually writing `start.sh` scripts. SimpleRun provides a colorful, interactive terminal interface that asks you the right questions and generates a robust, auto-restarting launch script for you.

![License](https://img.shields.io/badge/license-MIT-blue.svg) ![Version](https://img.shields.io/badge/version-v0.1.0-green.svg) ![Shell](https://img.shields.io/badge/shell-bash-lightgrey.svg)
---

## 🚀 Key Features

* **Java Optimization:** Includes 3 levels of **Aikar's Flags** (Standard, Aggressive, Vanilla) to minimize GC lag.
* **Discord Integration:** Detailed monitoring via Webhook. Get notified when the server starts, stops, or crashes.
* **Advanced Tracking:** Reports **Last Uptime**, Java version, and OS environment directly to your Discord channel.
    * **Smart Restart:** Automatically restarts on crashes but stops on manual `/stop` commands.
    * **Secure Code:** Sanitized inputs to prevent shell injection.
* **Professional UI:** Step-by-step installation wizard with a sleek terminal interface.

## ⚡ One-Command Installation

To run the generator, just paste the following command into your Linux terminal:

```bash
bash <(curl -sSL get.cansahin.tr/simplerun)
```

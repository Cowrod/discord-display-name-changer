# discord-display-name-changer \[[readme.md by ChatGPT](https://chat.openai.com/)\]

**Disclaimer:** Using this tool may lead to your Discord account getting banned. The developer of this tool does not guarantee its safety, and it should be used at your own risk.

## Description

`discord-display-name-changer` is a Lua script designed to change your Discord display name using the Luvit runtime environment. The script fetches the `coro-http` and `secure-socket` libraries and allows you to change your display name on a Discord server automatically.

## Requirements

- [Luvit runtime environment](https://luvit.io/)

## Setup

1. Ensure you have the Luvit runtime environment installed on your system.
2. Download the required libraries using the `setup.lua` script. This will fetch `coro-http` and `secure-socket`, which are necessary for the main script.
3. Run the setup script with the following command:

   ```sh
   luvit setup.lua
   ```

   Note: You can replace `luvit` with the correct command for running Luvit on your system.

### Auto Setup (requires [git](https://git-scm.com))

#### Windows:

```batch
:: Download Repo
git clone https://github.com/Cowrod/discord-display-name-changer
cd discord-display-name-changer
:: Download Luvit
PowerShell -NoProfile -ExecutionPolicy unrestricted -Command "[Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iex ((new-object net.webclient).DownloadString('https://github.com/luvit/lit/raw/master/get-lit.ps1'))"
:: Download Required Libraries
luvit setup --no-lit-log --no-lit-prompt
luvit init
```

#### Linux (don't know how to write comments in linux soo-):

```sh
git clone https://github.com/Cowrod/discord-display-name-changer
cd discord-display-name-changer
curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh
./luvit setup --no-lit-log --no-lit-prompt
./luvit init
```

## How to Use

1. Ensure you have completed the setup steps mentioned above before proceeding.
2. Create a file named `token.txt` in the same directory as the main script (`init.lua`).
3. Inside `token.txt`, paste your Discord bot token. Ensure that the token is valid and belongs to a bot account.
4. Create a file named `serverid.txt` in the same directory as the main script (`init.lua`).
5. Inside `serverid.txt`, paste the ID of the Discord server where you want to change your display name.
6. Run the main script with the following command:

   ```sh
   luvit init.lua
   ```

   Note: You can replace `luvit` with the correct command for running Luvit on your system.

**Note:** You can just run "luvit init" and enter the token and server ID in the code itself instead of saving them into separate files.

**Note:** If you are going to use this tool for an actual bot, put your input in this format "BOT token-here".

## Warnings

- The tool may result in your Discord account being banned due to potential "selfbotting" violations.
- Use this tool at your own risk, as the developer does not guarantee its safety or compliance with Discord's terms of service.

## Status Messages

By default, the script uses the following list of messages to change your Discord display name randomly. You can modify this list by editing the `displayNames.txt` file or provide your custom list in JSON format.

```json
["username1", "username2", "username3"]
```

## Important Notes

- The script will keep running indefinitely, changing your display name periodically.
- The script provides real-time feedback on the number of successful display name changes and failures, as well as the current token and display name being used.
- This project was made for educational purposes only. The developer takes no responsibility for any actions you take with this program.
- also, DO NOT USE THIS TOOL WITH ANOTHER TOOL THAT INTERACTS WITH DISCORD API WITH THE SAME TOKEN LIKE [discord-stat-changer](https://github.com/Cowrod/discord-stat-changer) YOU CAN GET RATE-LIMITED

**Use this script responsibly and be aware of the potential consequences of using self-bots on Discord.**

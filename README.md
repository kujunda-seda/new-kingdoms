# New Kingdoms Game Engine
New Kingdoms is a game engine for coders.

The main benefit of the New Kingdoms is not the code itself, but a readily implemented concept of decoupled and independently programmed object behaviours and their (optional) presentation. The code sets the minimal required interaction between the game layers, that bring those objects to life in a sandboxed universe.

Please read the [New Kingdoms reference docs](https://newkingdoms.io) to understand how to create games with it and follow the examples.

There will be many changes to the engine after 1.0, but this should not discourage you from starting now. New Kingdoms is provided without packaging and is dedicated to public domain, so you can tailor it to your games' needs as you wish. 

<img alt="public domain" src="https://github.com/kujunda-seda/new-kingdoms/assets/25789576/76810063-52c4-4b7a-9213-df88387d1c99" height="33"/>

## Installation
New Kingdoms is distributed as template code in `src` folder. It is very thin and all-modifiable. Copy the contents of the folder into your repo and run it in the project folder with `love ./` using terminal or with a shortcut using a [plugin](https://marketplace.visualstudio.com/items?itemName=pixelbyte-studios.pixelbyte-love2d) described below.

To experiment with the examples, check out to one of the `working-samples/` branches and run the code with `love src`.

## Prerequisites
To create games with New Kingdoms you will need LÖVE framework, VS Code, and Lua Language Server. Instructions here are provided for macOS, but it will work on Linux and Windows as well.

### 1. LÖVE framework
To be able to run and compile LÖVE games you need to install the framework/app.
1. Download the latest version of LÖVE from [the website](http://love2d.org/#download), choose: MacOS 64-bit zipped.
2. Unzip the app and move it into the **Applications** folder.
3. To call `love` from terminal in IDE and see console output, add an alias to `~/.zshrc`:
```
alias love="/Applications/love.app/Contents/MacOS/love"
```
4. Check that it works with `love --version`

### 2. Install [Visual Studio Code](https://code.visualstudio.com/download)

### 3. Add Lua Language Server
Lua Language Server (LuaLS) provides code completion and annotations that make it easy to write OOP code in dynamically-typed Lua. You can read more on that in a [detailed primer](https://medium.com/@yankalbaska/oop-in-lua-9962e47ed603).
1. Add VS Code plugin [Lua Language Server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
2. It will automatically (at least upon restart) ask you to configure your project to run with LÖVE, when it detects certain keywords. After applied, it will result in `.vscode/settings.json` file:
```
{
    "Lua.runtime.version": "LuaJIT",
    "Lua.runtime.special": {
        "love.filesystem.load": "loadfile"
    },
    "Lua.workspace.library": [
        "${3rd}/love2d/library"
    ]
}
```
### 4. (Optional) Shortcut plugin
To run games from the IDE with a shortcut, install [Love 2D Support](https://marketplace.visualstudio.com/items?itemName=pixelbyte-studios.pixelbyte-love2d) plugin and configure its path to Love executable (same alias you provided earlier for LÖVE settings) which is also added to workspace settings file above:
```
/Applications/love.app/Contents/MacOS/love
```

## Docs
Docs for the New Kingdoms are published on update of the `/docs` folder with a GitHub Actions [workflow](.github/workflows/jekyll.yml) and [Jekyll](https://jekyllrb.com) static site generator. If you want to render website changes locally before the deployment, you will need to install Jekyll. Instructions are for macOS, assuming you don't have anything installed:

1. Install [Homebrew](https://brew.sh)
1. System Ruby is not recommended by Jekyll. Install Ruby version manager `chruby` to be able to select Ruby version, Ruby installation tool `ruby-install`, and compression tool `xz`:
```
brew install chruby ruby-install xz
```
3. Install the Jekyll-supported Ruby:
```
ruby-install ruby 3.1.3
```
4. Set `zsh` to use `chruby` and to automatically change ruby version by folder containing `.ruby-version` file:
```
echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
```
**If you've cloned the repo and already have the docs, skip steps 4-7.** 

4. Don't get straight into installing `jekyll`, as you will also need `bundler` to install gems into a local path. The `bundler` itself is pre-installed with the latest Ruby. In your docs folder create a bundle and configure it to use local path:
```
mkdir docs
cd docs
bundle init
bundle config set --local path 'vendor/bundle'
```
5. Install `jekyll` gem as part of the bundle:
```
bundle add jekyll
```
6. Create the new Jekyll site forcing because Gemfile is already created and the folder is not empty:
```
bundle exec jekyll new --force --skip-bundle .
```
7. For Ruby 3.0+ add [WEBrick](https://github.com/ruby/webrick) HTTP server as it is no longer pre-installed with Ruby:
```
bundle add webrick
```
8. Install gems into the bundle:
```
bundle install
```
9. Run the Jekyll server on the bundle:
```
bundle exec jekyll serve
```
You should be able to access the generated docs via browser at http://127.0.0.1:4000/.

## License
This is free and unencumbered software released into the public domain, see [the Unlicense](LICENSE).  
However, in jurisdictions where this provides complications for the licensees, [MIT license](LICENSE.MIT) can be used.

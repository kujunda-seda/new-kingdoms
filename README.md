# New Kingdoms Game Engine
New Kingdoms is a game engine for coders.

## Prerequisites


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
**If you've cloned the repo and already have the docs, skip steps 4-6.** 

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
7. Install gems into the bundle:
```
bundle install
```
8. For Ruby 3.0+ add [WEBrick](https://github.com/ruby/webrick) HTTP server as it is no longer pre-installed with Ruby:
```
bundle add webrick
```
9. Run the Jekyll server on the bundle:
```
bundle exec jekyll serve
```
You should be able to access the generated docs via browser at http://127.0.0.1:4000/.

## License
This is free and unencumbered software released into the public domain, see [the Unlicense](LICENSE).  
However, in jurisdictions where this provides complications for the licensees, [MIT license](LICENSE.MIT) can be used.
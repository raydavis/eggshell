#Eggshell

The pre-release of CalCentral

## Dependencies

* [Ruby 1.9.3-p194](http://www.ruby-lang.org/en/)
* [Rubygems](http://rubyforge.org/frs/?group_id=126)
* [Rails 3.2.8](http://rubyonrails.org/download)
* [Bundler](http://gembundler.com/rails3.html)

## Recommendation

* [Rvm](https://rvm.io/rvm/install/) - Ruby version managers

## Installation

1. Clone this repository (or your own fork)
```bash
git clone git@github.com:ets-berkeley-edu/eggshell.git
```

2. Go inside the `eggshell` repository
```bash
cd eggshell
```

3. Download the appropriate gems
```bash
bundle install
```

4. Start the server
```bash
rails server
```

## Debugging

1. `.../lib/sqlite3/sqlite3_native.bundle: [BUG] Segmentation fault`
Fix this with running the following:
```bash
gem uninstall sqlite3
gem install sqlite3
```
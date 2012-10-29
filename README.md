#Eggshell

The pre-release of CalCentral

## Dependencies

* [Ruby 1.9.3-p286](http://www.ruby-lang.org/en/)
* [Rubygems](http://rubyforge.org/frs/?group_id=126)
* [Rails 3.2.8](http://rubyonrails.org/download)
* [Bundler](http://gembundler.com/rails3.html)
* [Rvm](https://rvm.io/rvm/install/) - Ruby version managers

## Installation

1. Fork this repository, then:
```bash
git clone git@github.com:[your_github_acct]/eggshell.git
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

Tip: You can use the shorthand:

```bash
rails s
```

## Debugging

### Segmentation fault

```bash
.../lib/sqlite3/sqlite3_native.bundle: [BUG] Segmentation fault
```

Fix it with running:

```bash
gem uninstall sqlite3
gem install sqlite3
```
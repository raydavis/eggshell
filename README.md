#Eggshell [![Build Status](https://secure.travis-ci.org/ets-berkeley-edu/eggshell.png)](http://travis-ci.org/ets-berkeley-edu/eggshell)

The pre-release of CalCentral

## Dependencies

* [Bundler](http://gembundler.com/rails3.html)
* [JRuby 1.7.0](http://jruby.org/)
* [Rails 3.2.8](http://rubyonrails.org/download)
* [Rubygems](http://rubyforge.org/frs/?group_id=126)
* [Rvm](https://rvm.io/rvm/install/) - Ruby version managers

## Installation

1. Install postgres
```bash
brew update
brew install postgresql
initdb /usr/local/var/postgres
```

2. Start postgres, add the user and create the necessary databases
```bash
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
psql postgres
create database eggshell_development;
create user eggshell_development with password 'secret';
grant all privileges on database eggshell_development to eggshell_development;
create database eggshell_production;
create user eggshell_production with password 'secret';
grant all privileges on database eggshell_production to eggshell_production;
create database eggshell_test;
create user postgres;
ALTER DATABASE eggshell_test OWNER TO postgres; # DEVELOPER MACHINES ONLY
grant all privileges on database eggshell_test to postgres; # DEVELOPER MACHINES ONLY
```

3. Fork this repository, then:
```bash
git clone git@github.com:[your_github_acct]/eggshell.git
```

4. Go inside the `eggshell` repository
```bash
cd eggshell
# Answer "yes" if it asks you to trust a new .rvmrc file.
```

5. Install jruby
```bash
rvm get head
rvm install jruby-1.7.0
cd ..
cd eggshell
# Answer "yes" again if it asks you to trust a new .rvmrc file.
```

6. (Optional for development) Make JRuby faster & enable C extensions by running this or put in your .bashrc:
```bash
export JRUBY_OPTS="-Xcext.enabled=true -J-d32 -J-client -X-C"
```

7. Download the appropriate gems
```bash
bundle install
```

8. Copy and update the settings
```
cp config/settings.yml config/settings.local.yml
cp config/settings/testext.yml config/settings/testext.local.yml
```
and update the settings in the `.local.yml` files.
These won't be committed to the repository.

9. Install JDBC driver (for Oracle connection)
  * Download [ojdbc6.jar](http://www.oracle.com/technetwork/database/enterprise-edition/jdbc-112010-090769.html)
  * Copy ojdbc6.jar to eggshell/lib

10. Start the server
```bash
rails s
```

## LiveReload & Testing

See code changes happening live in the browser and look at the testing

Run `foreman start` in the terminal, it will:
* Start the rails server
* Expose the [jasmine](http://pivotal.github.com/jasmine/) tests at http://localhost:8888
* Start [Guard](https://github.com/guard/guard) for livereload.

## Debugging

### Emulating production mode locally

1. Precompile the assets: [(more info)](http://stackoverflow.com/questions/7275636/rails-3-1-0-actionviewtemplateerrror-application-css-isnt-precompiled)
```bash
bundle exec rake assets:precompile
```

2. Serve static assets through rails
```
config.serve_static_assets = true
```

3. Start the server in production mode
```bash
rails s -e production
```

4. After testing, remove the static assets and generated pages
```bash
bundle exec rake assets:clean
rm public/index.html
# remove other pages ...
```

### Test connection

Make sure you are on the Berkeley network or connected through [VPN](https://kb.berkeley.edu/jivekb/entry.jspa?externalID=2665) for the oracle connection.
If you use VPN, set the `connect to` to `ucbvpn-2-external.Berkeley.EDU` and use group #1 (campus_vpn split tunnel)

### Tips

1. On Mac OS X, to get RubyMine to pick up the necessary environment variables, open a new shell, set the environment variables, and:
```bash
/Applications/RubyMine.app/Contents/MacOS/rubymine &
```

2. If you want to explore the oracle database on Mac OS X, use [SQL Developer](http://www.oracle.com/technetwork/developer-tools/sql-developer/overview/index.html)

### Styleguide

* Use an editor that supports [.editorconfig](http://editorconfig.org/#overview). Feel free to have a look at the [editor plug-ins](http://editorconfig.org/#download)
* Use `data-ng-` instead of `ng-` or `ng:`

:-1:
```html
<ng:view>
<span ng-bind="name"></span>
```
:+1:
```html
<div data-ng-view></div>
<span data-ng-bind="name"></span>
```

## API Endpoints:

```
/api/user:
  logged_in: true/false boolean
  uid: (if logged in, uid string)

/api/user/{uid}: Eventually return something useful (name, profile information)
  first_name: <string if exists else "">
  last_name: <string if exists else "">
  uid: <uid string>
  widget_data: <JSONObject>
```

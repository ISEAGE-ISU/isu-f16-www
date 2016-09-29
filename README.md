# Installing the Marketing App
These instructions are targeted for Debian.
## Networking
The marketing box needs to two NICs. One should be one the Competition Network and one on your HQ network.

### Setup Static Routes
In order to each the SCADA devices you will need to add some static routes.

- `ip route add 192.168.2.0/24 via 192.168.1.1 dev eth1`
- `ip route add 192.168.3.0/24 via 192.168.1.1 dev eth1`

You might need to change `eth1` to something depending on how you setup your NICs.

To keep the routes persistent you need to add some lines to your `/etc/network/interfaces`

```
  post-up ip route add 192.168.2.0/24 via 1192.168.1.1
  post-up ip route add 192.168.3.0/24 via 1192.168.1.1
```

### Setup the proxy
- Check the setup documents for more details

## Install VM Tools and git
Makes managing the VM easier
- Install the package `open-vm-tools`

Git will used for installing `rbenv`
- Install the package `git`

## Install `python-dev` package

## Add a line to header file
  - Due to odd issue you need add a to line to bottom of `/usr/include/python2.7/pyconfig.h`

  `#define HAVE_MEMMOVE 1`

## Install PyXML
- Download [PyXML](http://downloads.sourceforge.net/project/pyxml/pyxml/0.8.4/PyXML-0.8.4.tar.gz)
- Extract the archive
- Run `python setup.py install` inside the extract directory as root

## Install ZSI
- [Download](https://pypi.python.org/pypi/ZSI/) `ZSI-2.0-rc3.tar.gz`
- Extract the archive
- Run `python setup.py install` inside the extract directory as root

## Download PyOPC
   - Download  [PyOPC](http://downloads.sourceforge.net/project/pyopc/pyopc/PyOPC-0.1a/PyOPC-0.1a.tar.gz)

## Install PyOPC
- Extract the archive
- Copy the `PyOPC` directory from the zip into `/usr/local/lib/python2.7/dist-packages/`

## Install SQLite3 database packages
- Install the packages `sqlite3` and `libsqlite3-dev`.

## Get the code on the machine
The simplest way is to clone the git repo into the machine. Other methods for getting the code on the server are exercises left to the reader.

## Configure the IPs of your SCADA machines on `config.py`
- The application needs direct access to SCADA machines in order to collect stats.

## Install Build Environment
Find the line for your operating system and install the packages on ruby-build wiki.

 [ruby-build wiki](https://github.com/rbenv/ruby-build/wiki#suggested-build-environment)

##  Install Ruby
 - Install [rbenv](https://github.com/rbenv/rbenv).
 - Be sure to install the  [ruby-build](https://github.com/rbenv/ruby-build) plugin.
 - [Install Ruby](https://github.com/rbenv/ruby-build#usage)

## Install Bundler
- `gem install bundler --no-document`

## Install Ruby Dependencies
- Run from inside the Marketing App `bundle install`

## Setup Database
- Run from inside the Marketing App `rake db:setup`

## Run the site
- Run from inside the Marketing App `rackup`

## Visit the site
The site will hosted on [localhost:9292](http://localhost:9292)

# Notes

## Production Server Suggestion
- [Phusion Passenger](https://www.phusionpassenger.com)

## Database
- You can switch out the database. Check the docs for [ActiveRecord](http://api.rubyonrails.org/classes/ActiveRecord/Base.html) and [sinatra-activerecord](https://github.com/janko-m/sinatra-activerecord) for more details.

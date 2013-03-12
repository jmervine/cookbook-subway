# subway cookbook

# Requirements

* [git](http://community.opscode.com/cookbooks/git)
* [nodejs](http://community.opscode.com/cookbooks/nodejs)
* [nginx](http://community.opscode.com/cookbooks/nginx)
* [nginx_proxy](http://github.com/rubyops/cookbook-nginx_proxy)

## This has been tested on:

* CentOS 6.2

# Usage

    // file: nodes/host.json
    {
        // Include autoconf recipe.
        "run_list": [ "recipe[subway]" ]
    }

# Attributes

    // file: nodes/host.json
    //
    // defaults:
    {
       "subway": {
           "src_url": "https://github.com/jmervine/subway.git",
           "git_branch": "master",
           "user": "root",
           "destination": "/var/local/subway"
             // only used when user == 'root'
             // otherwise, destination == '/home/USER'
       }
    }


# Author

Author:: Joshua P. Mervine (<joshua@mervine.net>)

# subway cookbook

# Requirements

* [git](http://community.opscode.com/cookbooks/git)
* [nodejs](http://community.opscode.com/cookbooks/nodejs)
* [nginx](http://community.opscode.com/cookbooks/nginx)
* [nginx_proxy](http://github.com/rubyops/cookbook-nginx_proxy)

## This has been tested on:

* CentOS 6.2
* Ubuntu 10.04.4 LTS (lucid64)

# Usage

    // file: nodes/host.json
    {
        // Include autoconf recipe.
        "run_list": [ "recipe[subway]" ]
    }

# Attributes

    // file: nodes/host.json
    {
       "subway": {
           "src_url": "https://github.com/jmervine/subway.git",
           "git_branch": "master",
           "destination": "~"
       }
    }


# Author

Author:: Joshua P. Mervine (<joshua@mervine.net>)

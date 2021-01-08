# V fancy logs
Logging levels with colors, in a simple v module !

## Preview:
![Preview gif](https://raw.githubusercontent.com/ifndev/v-fancy-logs/master/.readme-assets/demo.gif)

## Installation and Import

### Using vpkg:

```
vpkg get flogs
```

Import:
```v
import flogs
```


### Using vpm:

Install/Update:
```
v install ifndev.flogs
```

Import:
```v
import ifndev.flogs
```

### Using github (*least recommended*):

Install (from your project folder):
```
git clone https://github.com/ifndev/v-fancy-logs/ flogs
```

Update (from your project folder):
```
cd flogs
git pull
```

Import:
```v
import flogs
```

## Usage

```v
Logger.log(<String>, <Level>) // (See examples)
````

### Levels

- verbose
- info
- warning
- error
- critical

### Examples

#### basic

```v
module main
import ifndev.flogs
// If downloaded from github, use:
// import flogs

const (
    l = flogs.Logger {
        min_logging_level: .verbose // Minimum level to be printed to console
        // For example, if you choose .warning, only warnings, errors and
        // critical errors will be displayed
    }
)

fn main() {
    l.verbose("ignore me, unless you don't want to.")
    l.info("you might want to know this")
    l.warning("that's probably important")
    l.error("i don't feel so good")
    l.critical("really bad")
    
    // You can also use the 'log' method:
    l.log('custom error', .error) // == l.error('custom error')
}
```

#### --log-level option

```v
module main

import ifndev.flogs
import os

fn main() {
    // You can't declare your logger in const, or it won't be able to capture args
    l := flogs.Logger{
        min_logging_level: get_level_from_args() 
    }
    l.log("ignore me, unless you don't want to.", .verbose)
    l.log('you might want to know this', .info)
    l.log("that's probably important", .warning)
    l.log("i don't feel so good", .error)
    l.log('really bad', .critical)
}

fn get_level_from_args() flogs.Level {
    if os.args.len == 3 && os.args[1] == "--log-level" {
        match os.args[2] {
            "verbose" { return .verbose }
            "info" { return .info }
            "warning" { return .warning }
            "error" { return .error }
            "critical" { return .critical }
            else { return .verbose } // used by default if input is invalid
        }
    }
    else {
        return .verbose // used by default if no input
    }
}
```

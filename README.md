# V fancy logs
Logging levels with colors, in a simple v module !

:warning: This is still a work in progress !

## Preview:
![Preview gif](https://raw.githubusercontent.com/ifndev/v-fancy-logs/master/readme-assets/demo.gif)

## Installation and Import

### From vpm (*recommended*):

Install (from anywhere):
```
v install ifndev.flogs
```

Import:
```v
import ifndev.flogs
```

### From github:

Install (from your project folder):
```
git clone https://github.com/ifndev/v-fancy-logs/ flogs
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
		// For example, if you choose .warning, only warnings, errors and critical errors will be displayed
	}
)

fn main() {

	l.log("ignore me, unless you don't want to.", .verbose)
	l.log("you might want to know this", .info)
	l.log("that's probably important" , .warning)
	l.log("i don't feel so good", .error)
	l.log("really bad" , .critical)
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
			"verbose" {return .verbose}
			"info" {return .info}
			"warning" {return .warning}
			"error" {return .error}
			"critical" {return .critical}

			else {return .verbose} //used by default if input is invalid
		}
	}
	else {
		return .verbose //used by default if no input
	}
}
```

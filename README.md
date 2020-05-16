# V fancy logs
Logging levels with colors, in a simple v module !

:warning: This is still an early work in progress !

## Preview:
![Preview of the different colored outputs](https://raw.githubusercontent.com/ifndev/v-fancy-logs/master/readme-assets/demo.png)

## Installation and Import

### From vpm (*recommended*):

Install:
```
v install ifndev.flogs
```

Import:
```v
import ifndev.flogs
```

### From github:

Install:
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

### Example
Here is the code for the preview higher up:

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

# V fancy logs
Logging levels with colors, in a simple v module !

:warning: This is still an early wotk in progress !

## Preview:
![Preview of the different colored outputs](https://raw.githubusercontent.com/ifndev/v-fancy-logs/master/readme-assets/demo.png)

## Usage

```v
log(<String>, <Level>) // (See examples)
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
import flogs

fn main() {
	flogs.log("ignore me, unless you don't want to.", .verbose)
	flogs.log("you might want to know this", .info)
	flogs.log("that's probably important" , .warning)
	flogs.log("i don't feel so good", .error)
	flogs.log("really bad" , .critical)
}
```

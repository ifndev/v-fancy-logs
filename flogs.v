/*
USAGE:

log(<String>, < .verbose | .info | .warning | .error | .critical >)

*/

module flogs
//import os

fn init() int {
	//TODO: Check color support only once if possible
    return 1
}

pub enum Level {
	verbose
	info
	warning
	error
	critical
}

pub fn log(txt string, lvl Level) { //NOTE: Consider making the Level optional, defaulting to verbose or info
	match get_color_support() {
		true { println(match lvl {
				.verbose { '\033[90m[VERBOSE] ' + txt + '\033[0m' }
				.info { '[\033[34mINFO\033[0m] ' + txt + '\033[0m' }
				.warning { '[\033[33mWARNING\033[0m] ' + txt + '\033[0m' }
				.error { '[\033[31;4mERROR\033[0m] ' + txt + '\033[0m' }
				.critical { '\033[1;31m[CRITICAL] ' + txt + '\033[0m' }
			}) }
		else { println(match lvl {
				.verbose { '[VERBOSE] ' + txt }
				.info { '[INFO] ' + txt}
				.warning { '[WARNING] ' + txt}
				.error { '[ERROR] ' + txt}
				.critical { '[CRITICAL] ' + txt}
			}) }
	}
}

fn get_color_support() bool {
	//term := os.getenv('TERM')
	//TODO: Implement color support checking
	return true
}
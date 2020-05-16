/*
USAGE:

log(<String>, < .verbose | .info | .warning | .error | .critical >)
*/
module flogs

import term

pub enum Level {
	verbose
	info
	warning
	error
	critical
}

const (
	colors_supported = term.can_show_color_on_stdout()
	levels_ranking   = [flogs.Level.critical, .error, .warning, .info, .verbose]
)

pub struct Logger {
	min_logging_level Level
}

fn is_important_enough(lvl, minlvl Level) bool {
	for value in levels_ranking {
		match value {
			lvl {return true}
			minlvl {return false}
			else {}
		}
	}
	return false
}

pub fn (l Logger) log(txt string, lvl Level) { // NOTE: Consider making the Level optional, defaulting to verbose or info
	match is_important_enough(lvl, l.min_logging_level) {
		true { match colors_supported {
				true { println(match lvl {
						.verbose { '\033[90m[VERBOSE] ' + txt + '\033[0m' }
						.info { '[\033[34mINFO\033[0m] ' + txt + '\033[0m' }
						.warning { '[\033[33mWARNING\033[0m] ' + txt + '\033[0m' }
						.error { '[\033[31mERROR\033[0m] ' + txt + '\033[0m' }
						.critical { '\033[1;31m[CRITICAL] ' + txt + '\033[0m' }
					}) }
				else { println(match lvl {
						.verbose { '[VERBOSE] ' + txt }
						.info { '[INFO] ' + txt }
						.warning { '[WARNING] ' + txt }
						.error { '[ERROR] ' + txt }
						.critical { '[CRITICAL] ' + txt }
					}) }
			} }
		else {}
	}
}

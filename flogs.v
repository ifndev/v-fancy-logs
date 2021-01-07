module flogs

import term

pub enum Level {
	verbose
	info
	warning
	error
	critical
}

const colors_supported = term.can_show_color_on_stdout()
const levels_ranking = [Level.critical, .error, .warning, .info, .verbose]

pub struct Logger {
	min_logging_level Level
}

fn is_important_enough(lvl Level, minlvl Level) bool {
	for value in levels_ranking {
		match value {
			lvl { return true }
			minlvl { return false }
			else {}
		}
	}
	return false
}

// NOTE: Consider making the Level optional, defaulting to verbose or info
pub fn (l Logger) log(txt string, lvl Level) {
	if is_important_enough(lvl, l.min_logging_level) {
		println(match lvl {
			.verbose { '\033[90m[VERBOSE] $txt\033[0m' }
			.info { '[\033[34mINFO\033[0m] $txt\033[0m' }
			.warning { '[\033[33mWARNING\033[0m] $txt\033[0m' }
			.error { '[\033[31mERROR\033[0m] $txt\033[0m' }
			.critical { '\033[1;31m[CRITICAL] $txt\033[0m' }
		})
	} else {
		println(match lvl {
			.verbose { '[VERBOSE] $txt' }
			.info { '[INFO] $txt' }
			.warning { '[WARNING] $txt' }
			.error { '[ERROR] $txt' }
			.critical { '[CRITICAL] $txt' }
		})
	}
}

pub fn (l Logger) verbose(msg string) {
	l.log(msg, .verbose)
}

pub fn (l Logger) info(msg string) {
	l.log(msg, .info)
}

pub fn (l Logger) warning(msg string) {
	l.log(msg, .warning)
}

pub fn (l Logger) error(msg string) {
	l.log(msg, .error)
}

pub fn (l Logger) critical(msg string) {
	l.log(msg, .critical)
}

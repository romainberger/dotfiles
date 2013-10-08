#!/usr/bin/env node

/**
 * Script to output a report from the timetip
 * logs with the tasks and the time spent on
 * in the given range of date
 *
 * usage: $ node script-time.js <date-start> <date-end>
 * example: $ node script-time.js 2013-10-01 2013-10-31
 */

'use strict';

var args    = process.argv
  , start   = args[2]
  , end     = args[3]
  , TimeLog = require('timetip').TimeLog
  , log     = new TimeLog('~/.timelogs')
  , start   = log.parseDate(start)
  , end     = log.parseDate(end)
  , month   = log.range([start, end])
  , tasks   = []
  , output  = []

/**
 * Converts milliseconds to time
 */
function msToTime(s) {
  var ms = s % 1000
  s = (s - ms) / 1000
  var secs = s % 60
  s = (s - secs) / 60
  var mins = s % 60
    , hrs = (s - mins) / 60

  return hrs + ':' + mins + ':' + secs + '.' + ms
}

month.dates.forEach(function(date) {

  date.entries.forEach(function(entry) {
    if (entry.type == 'break') {
      return
    }

    if (typeof tasks[entry.project] == 'undefined') {
      tasks[entry.project] = entry.duration
    }
    else {
     tasks[entry.project] += entry.duration
    }
  })

})

// Output the results
for (var task in tasks) {
  var time = msToTime(tasks[task])
  console.log(task + ' => ' + time)
}

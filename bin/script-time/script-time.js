#!/usr/bin/env node

/**
 * Script to output a report from the timetip logs with the tasks and the time
 * spent on in the given range of date. Default to the current month.
 *
 * usage: $ node script-time.js <date-start> <date-end>
 * example: $ node script-time.js 2013-10-01 2013-10-31
 */

'use strict';

var args    = process.argv
  , today   = new Date()
  , start   = typeof args[2] !== 'undefined' ? args[2] : today.getFullYear()+'-'+(today.getMonth() + 1)+'-01'
  , end     = typeof args[3] !== 'undefined' ? args[3] : today.getFullYear()+'-'+(today.getMonth() + 1)+'-'+today.getDate()
  , TimeLog = require('timetip').TimeLog
  , log     = new TimeLog('~/.timelogs')
  , start   = log.parseDate(start)
  , end     = log.parseDate(end)
  , month   = log.range([start, end])
  , tasks   = []
  , output  = []
  , longest = 0

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

    if (entry.project.length > longest) {
      longest = entry.project.length
    }
  })
})

longest += 3

// Output the results
console.log('Report: '+start+' - '+end)
for (var task in tasks) {
  var time  = msToTime(tasks[task])
    , space = longest - task.length

  if (space > 0) {
    for (space; space; space--) {
      task += ' '
    }
  }

  console.log(task + ' => ' + time)
}

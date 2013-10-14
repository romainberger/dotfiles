# Script time

Simple node script for [Timetip](https://github.com/rstacruz/timetip). Outputs the total time spent for each tasks on a given range of date.

## Installation

Download the files in this folder (package.json and script-time.js). Then run `npm install` to install the dependencies.

## Usage

Very easy:

    node script-time.js <date-start> <date-end>

    // example:
    node script-time.js 2013-10-01 2013-10-31

It will just log in the console the tasks and the total time for each of these tasks.

If you don't provide the date range it will output a report for the current month.

Colander [![Build Status](https://secure.travis-ci.org/mynewsdesk/colander.png?branch=master)](http://travis-ci.org/mynewsdesk/colander) [![Code Climate](https://codeclimate.com/repos/5295f61c89af7e32360008e1/badges/ca34746eb282fe18720b/gpa.png)](https://codeclimate.com/repos/5295f61c89af7e32360008e1/feed) [![Gem Version](https://badge.fury.io/rb/colander.png)](http://badge.fury.io/rb/colander) 
==============
Colander is a gem to collect emails from various file formats.

Supported formats

  * "Old" Ms Excel files, ending in .xls
  * Ms Excel files ending with .xlsx
  * CSV, Comma-separated values
  * Plain text files

Usage
-----

    parser = Colander.parse("/path/to/file.xls")
    parser.emails # => ["foo@bar.com"]

or

    parser = Colander.parse("/path/to/file_without_extension", "filename.xlsx")
    parser.emails # => ["foo@bar.com"]


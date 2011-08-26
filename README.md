EmailExtractor
==============
EmailExtractor is a gem to collect emails from various file formats.

Supported formats

  * "Old" Ms Excel files, ending in .xls
  * Ms Excel files ending with .xlsx

Usage
-----

    parser = EmailExtractor.parse("/path/to/file.xls")
    parser.emails # => ["foo@bar.com"]


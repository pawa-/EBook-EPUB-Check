package builder::MyBuilder;

use 5.008_001;
use strict;
use warnings;
use base 'Module::Build';
use File::Which qw/which/;

die('Java must be installed and set in your PATH!') unless which('java');

1;

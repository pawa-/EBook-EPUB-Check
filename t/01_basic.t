use strict;
use warnings;
use File::Which qw/which/;
use Test::More;
use Test::Warn;
use Test::Fatal;
use EBook::EPUB::Check qw/epubcheck/;

plan skip_all => 'Java must be installed and set in your PATH!' unless which('java');

my $exception = exception { epubcheck('epub/valid.epub') };
plan skip_all => $exception if defined $exception && $exception =~ /java/i;

subtest 'valid epub file' => sub {
    my $result = epubcheck('epub/valid.epub');
    ok($result->is_valid);
    like($result->report, qr/No errors or warnings detected/i);
    note($result->report);
};

subtest 'invalid epub file' => sub {
    my $result = epubcheck('epub/invalid.epub');
    ok( ! $result->is_valid );
    like($result->report, qr/Check finished with warnings or errors/i);
    note($result->report);
};

subtest 'epub file not found' => sub {
    my $result;
    warning_is { $result = epubcheck('epub/hoge.epub'); } 'epub file not found';
    ok( ! $result->is_valid );
    is($result->report, '');
};

subtest 'jar file not found' => sub {
    like(exception { epubcheck('epub/valid.epub', 'hoge') }, qr/jar file not found/);
};

subtest 'valid jar file path specified' => sub {
    my $result = epubcheck('epub/valid.epub', 'share/epubcheck-3.0.1/epubcheck-3.0.1.jar');
    ok($result->is_valid);
    like($result->report, qr/No errors or warnings detected/i);
    note($result->report);
};

subtest 'emtpy epub file path' => sub {
    my $result;
    warning_is { $result = epubcheck(''); } 'epub file not found';
    ok( ! $result->is_valid );
    is($result->report, '');
};

subtest 'undefined epub file path' => sub {
    my $result;
    warning_is { $result = epubcheck(undef); } 'epub file not found';
    ok( ! $result->is_valid );
    is($result->report, '');
};

done_testing;

use 5.006;
use strict;
use warnings;

use ExtUtils::MakeMaker;

# 
# The time is not yet ripe for faketime …
#
# sub is_fake_time_available { #_{
# 
#   my $command_out = readpipe('faketime "2012-12-12 12:12:12" /bin/date -I 2>&1');
# 
#   return $command_out =~ /2012-12-12/;
# 
# } #_}
# 
# print STDERR "WARNING: Install faketime to test Git::Repository::Internal\n" unless is_fake_time_available();

WriteMakefile(
    NAME             => 'Git::Repository::Internal',
    AUTHOR           => q{René Nyffenegger <rene.nyffenegger@adp-gmbh.ch>},
    VERSION_FROM     => 'lib/Git/Repository/Internal.pm',
#   ABSTRACT_FROM    => 'lib/Git/Repository/Internal.pm',
    LICENSE          => 'artistic_2',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    PREREQ_PM => {
        'Git::Repository' => 0,  # ? Version ?
    },
    BUILD_REQUIRES => {
    #   'Test::Simple' => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Git-Repository-Internal-*' },
);

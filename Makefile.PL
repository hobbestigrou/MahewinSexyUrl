use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'MahewinSexyUrl',
    AUTHOR              => q{Natal Ngétal <hobbestig@cpan.org>},
    VERSION_FROM        => 'lib/MahewinSexyUrl.pm',
    ABSTRACT            => 'Web application for shortening URLs',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More'           => 0,
        'YAML'                 => 0,
        'Dancer'               => 1.1904,
        'Data::Validate::URI'  => 0,
        'Dancer::Plugin::DBIC' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'MahewinSexyUrl-*' },
);

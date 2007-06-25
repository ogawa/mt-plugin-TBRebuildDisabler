package MT::Plugin::TBRebuildDisabler;
use strict;
use MT;
use base 'MT::Plugin';

our $VERSION = '0.01';
my $plugin = __PACKAGE__->new({
    name => 'TBRebuildDisabler Plugin',
    description => 'A patch to disable rebuilding after receiving trackback pings.',
    doc_link => 'http://code.as-is.net/wiki/TBRebuildDisabler',
    author_name => 'Hirotaka Ogawa',
    author_link => 'http://profile.typekey.com/ogawa/',
    version => $VERSION,
});
MT->add_plugin($plugin);

use MT::App::Trackback;
no warnings 'redefine';
*MT::App::Trackback::rebuild_indexes = sub { 1 };
*MT::App::Trackback::rebuild_entry = sub { 1 };

1;

#_{ Encoding and name
=encoding utf8
=head1 NAME

C<Git::Repository::Internal> - Analyze the internals of a Git Repostitory

=cut
package Git::Repository::Internal;

use strict;
use warnings;
use utf8;
#_}
#_{ Version
=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';
# our @ISA = qw();
#_}
#_{ Synopsis
=head1 SYNOPSIS

    use Git::Repository::Internal;
   
=cut
#_}
#_{ use …
use Carp;
use Git::Repository;
#_}
#_{ Methods
#_{ POD
=head1 METHODS

=cut
#_}
sub new { #_{

=head2 new

    my $class_diagram = GraphViz::Diagram::ClassDiagram->new('File.pdf');

Start drawing a class diagram.

=cut

  my $class          = shift;
  my $git_dir        = shift;

  my $self = {};

  $self->{git_repo} = Git::Repository->new(git_dir=>$git_dir) or carp "Could not initialize Git::Repository with git_dir $git_dir";

  bless $self, $class;
  return $self;

} #_}

#_}
#_{ Source Code

=head1 Source Code

The source code is on L<github|https://github.com/ReneNyffenegger/perl-Git-Repository-Internal>.

=cut

#_}

'tq84';

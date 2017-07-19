#_{ Encoding and name
=encoding utf8
=head1 NAME

C<Git::Repository::Internal::Object> - A git object.

=cut
package Git::Repository::Internal::Object;

use strict;
use warnings;
use utf8;
#_}
#_{ Version

our $VERSION = $Git::Repository::Internal::VERSION;

# our @ISA = qw();
#_}
#_{ Synopsis
=head1 SYNOPSIS

    use Git::Repository::Internal;

    etc.
   
=cut
#_}
#_{ use …
use Carp;
# use Git::Repository;
#_}
#_{ Methods
#_{ POD
=head1 METHODS

=cut
#_}
sub new { #_{
 #_{ POD
=head2 new

    TODO

=cut
 #_}
  my $class          = shift;
  my $gir            = shift;
  my $object_id      = shift;
  my $type           = shift;

  carp "Git::Repository::Internal::Object - $gir is not a Git::Repository::Internal" unless ref $gir eq 'Git::Repository::Internal';
  carp "Git::Repository::Internal::Object - new $object_id is not an object id" unless $object_id =~m |^[[[:xdigit:]]{40}$|;

  my $self = {};

  $self->{object_id} = $object_id;
  $self->{gir      } = $gir;
  $self->{type     } = $type;

  $self->{text     } = $self->{gir}->{git_repo}->run('cat-file' => $object_id, '-p');

  bless $self, $class;
  return $self;

} #_}
sub type { #_{
 #_{ POD
=head2 type

    $obj -> type();

Returns the type of of the object: blob, commit, tag or tree.

=cut
 #_}
 
 my $self = shift;
 return $self->{type};
} #_}


#_}
#_{ Source Code

=head1 Source Code

The source code is on L<github|https://github.com/ReneNyffenegger/perl-Git-Repository-Internal>.

=cut

#_}

'tq84';

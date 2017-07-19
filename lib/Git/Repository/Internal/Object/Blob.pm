#_{ Encoding and name
=encoding utf8
=head1 NAME

C<Git::Repository::Internal::Object::Blob> - A git blob object, descendant of L<Git::Repository::Internal::Object>

=cut
package Git::Repository::Internal::Object::Blob;

use strict;
use warnings;
use utf8;
use Carp;

use Git::Repository::Internal::Object;
#_}

our @ISA = qw(Git::Repository::Internal::Object);

#_{ Methods
#_{ POD
=head1 METHODS

=cut
#_}
sub new { #_{
#_{ POD
=head2 new

    internal internal only - to be called by L<Git::Repository::Internal>.

=cut
#_}
  my $class          = shift;
  my $gir            = shift;
  my $obj_id         = shift;

  carp "Git::Repository::Internal::Object::Blob - new, gir is not a Git::Repository::Internal" unless ref $gir eq 'Git::Repository::Internal';

  my $self = $class->SUPER::new($gir, $obj_id, 'blob');

# bless $self, $class;

  die unless $self->isa('Git::Repository::Internal::Object::Blob');
  return $self;

} #_}

#_}

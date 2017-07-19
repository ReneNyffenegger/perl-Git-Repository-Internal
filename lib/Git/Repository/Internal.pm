#_{ Encoding and name
=encoding utf8
=head1 NAME

C<Git::Repository::Internal> - Analyze the internals of a Git Repostitory

=cut
package Git::Repository::Internal;

use strict;
use warnings;
use utf8;

use Git::Repository::Internal::Object::Blob;
use Git::Repository::Internal::Object::Commit;
use Git::Repository::Internal::Object::Tag;
use Git::Repository::Internal::Object::Tree;
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
#_{ POD
=head2 new

    my $gri = Git::Repository::Internal->new('/path/to/git/repository/.git');

=cut
#_}
  my $class          = shift;
  my $git_dir        = shift;

  my $self = {};

  $self->{git_repo} = Git::Repository->new(git_dir=>$git_dir) or carp "Could not initialize Git::Repository with git_dir $git_dir";
  $self->{git_dir } = $git_dir;

  bless $self, $class;
  return $self;

} #_}
sub objects { #_{
#_{ POD
=head2 objects

    my @objects = $gri -> objects();

Returns a list of all objects in the repository.

=cut
#_}
  
  my $self = shift;
  my @object_files = glob("$self->{git_dir}/objects/*/*");
  my @objects = ();
  for my $object_id (map { s/.*(..)\/(......................................)/$1$2/; $_ } @object_files) { #_{

    push @objects, $self->create_object($object_id);

   } #_}


  return @objects;

} #_}
sub create_object { #_{
#_{ POD
=head2 create_object

    my $object = $gri -> create_object('20aeba2bad864cf6904f9caaea55f46f03ce6ac1');

Creates a descendant of L<Git::Repository::Internal::Object>;

=cut
#_}
  
  my $self   = shift;
  my $obj_id = shift;


  my $type = $self->{git_repo}->run('cat-file' => $obj_id, '-t');

  carp "Git::Repository::Internal - create_object object type = $type" unless grep { $_ eq $type } qw(blob commit tree tag);

  my $object;
  if    ($type eq 'blob') {
    $object = Git::Repository::Internal::Object::Blob->new($self, $obj_id);
  }
  elsif ($type eq 'commit') {
    $object = Git::Repository::Internal::Object::Commit->new($self, $obj_id);
  }
  elsif ($type eq 'tag') {
    $object = Git::Repository::Internal::Object::Tag->new($self, $obj_id);
  }
  elsif ($type eq 'tree') {
    $object = Git::Repository::Internal::Object::Tree->new($self, $obj_id);
  }
  return $object;

#_{ POD
=head2 create_

    my $gri = Git::Repository::Internal->new(…);

    my $obj_id = '20aeba2bad864cf6904f9caaea55f46f03ce6ac1';

    my $obj = Git::Repository::Internal::Object::create_($gri, $obj_id);

Static method. To be called by L<Git::Repository::Internal>.

=cut
#_}

} #_}

#_}
#_{ Source Code

=head1 Source Code

The source code is on L<github|https://github.com/ReneNyffenegger/perl-Git-Repository-Internal>.

=cut

#_}

'tq84';

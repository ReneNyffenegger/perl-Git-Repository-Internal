use strict;
use warnings;

use Test::More tests => 4;
use File::Slurp;
use File::Path;

use Git::Repository::Internal;


my $repo_dir = '/tmp/test-git-internal/';
rmtree $repo_dir if -d $repo_dir;
Git::Repository->run(init=>$repo_dir);
my $git_repo = Git::Repository->new(work_tree=>$repo_dir);

write_file("$repo_dir/aFile.txt", <<"FILE");
first line
second line
third line
FILE

write_file("$repo_dir/anotherFile.txt", <<"FILE");
numero ono
numero due
numero tre
FILE

$git_repo->run(add=>'aFile.txt');
$git_repo->run(add=>'anotherFile.txt');
$git_repo->run('commit', '-m', 'added two files.');

my $gri = Git::Repository::Internal->new("$repo_dir/.git");

my $cnt_blob    = 0;
my $cnt_commit  = 0;
my $cnt_tree    = 0;
my @objects = $gri -> objects();

my $obj_blob_1;
my $obj_blob_2;
my $obj_commit;
my $obj_tree;

is(@objects, 4, 'Four objects expected');
for my $object (@objects) {

  if ($object->type() eq 'blob') {
    $cnt_blob ++;

    if ($cnt_blob == 1) {
      $obj_blob_1 = $object;
    }
    elsif ($cnt_blob == 2) {
      $obj_blob_2 = $object;
    }
  }
  elsif ($object->type() eq 'commit') {
    $cnt_commit ++;
    $obj_commit = $object;
  }
  elsif ($object->type() eq 'tree') {
    $cnt_tree ++;
    $obj_tree = $object;
  }
  else {
    die "Unexpected object type " . $object->type();
  }


}
is($cnt_blob  , 2, "2 blob object expected  , got: $cnt_blob"  );
is($cnt_commit, 1, "1 commit object expected, got: $cnt_commit");
is($cnt_tree  , 1, "1 tree object expected  , got: $cnt_tree"  );

print "\n----------------\n\n";
print $obj_tree  ->{text};

print "\n----------------\n\n";
print $obj_commit->{text};

print "\n----------------\n\n";
print $obj_commit->{text};

print "\n----------------\n\n";
print $obj_blob_1->{text};

print "\n----------------\n\n";
print $obj_blob_2->{text};

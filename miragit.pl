#!/usr/bin/env perl

use strict;
use warnings;
use 5.012;

use File::Path qw(remove_tree);
use Getopt::Long;
use Cwd;
use File::Spec;

my $source = cwd;

not -f 'config.yml' and say 'you are not not in mira path' and exit(1);

my %opts= (
	    worktree => 'public/laravel-0-to-60/'
	   );

GetOptions(
    \%opts,
        "init",
        "push",
	"worktree|w=s",
    );

$opts{worktree} = "public$opts{worktree}" if $opts{worktree} =~ m:^/:;

# say "use one of command line argumments: --init or --push" and exit(1) unless ($opts{"init"} or $opts{'push'});
say "use only one of arguments: init or push" and exit(1) if ($opts{init} and $opts{push});

if ($opts{init})
{
    unless (-d '.git')
    {
        say qx{git init};
        open my $fh, '>', '.gitignore';
        say "add $opts{worktree} to gitignore...";
        print $fh $opts{worktree};
        close $fh;
    } else
    {
        if (-f '.gitignore')
        {
            my $gitignore;
            {
                open my $fh, '+<', '.gitignore';
                local $/ = undef;
                $gitignore = <$fh>;
                print $fh "\n$opts{worktree}" && say "add $opts{worktree} to gitignore..." if $gitignore !~ /^$opts{worktree}$/mg;
                close $fh;
            }
        } else
        {
            open my $fh, '>', '.gitignore';
            print $fh "$opts{worktree}";
            close $fh;
        }
    }

    say "add content to master and commit...";
    qx{git add --all};
    say qx{git commit -m 'add content'};

    say "delete $opts{worktree} directory and worktree...";
    remove_tree($opts{worktree}) if -e $opts{worktree};
    qx{git worktree prune};
    remove_tree(".git/worktrees/$opts{worktree}");

    say "Initializing gh-pages...";
    qx{git branch -D gh-pages};
    say qx{git checkout --orphan gh-pages};
    say qx{git reset --hard};
    say qx{git commit --allow-empty -m "Initializing gh-pages branch"};
    qx{git checkout master};

    say qx{git worktree add -B gh-pages $opts{worktree} gh-pages};
}

if ($opts{push} or (not $opts{init} and not $opts{push}))
{
    my $worktree = File::Spec->catdir($source, $opts{worktree});

    say "add contents to master...";
    say qx{git add --all};
    say qx{git commit -m 'add content'};

    say "Initializing publish...";
    chdir $worktree;
    say qx{git add --all};
    say qx{git commit -m 'publish'};
    chdir $source;

    say "push master and gh-pages to Remote(origin)...";
    say qx{git push origin master gh-pages};
}

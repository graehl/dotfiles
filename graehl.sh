. brew.sh
. .osx
cat <<EOF >~/.gitexcludes
# Compiled Python files
*.pyc

# Folder view configuration files
.DS_Store
Desktop.ini

# Thumbnail cache files
._*
Thumbs.db

# Files that might appear on external disks
.Spotlight-V100
.Trashes

# editor backups
*~

# objects
*.o
*.a
*.so

# apologies if you use this name for non-trash
trash.*
EOF
ln -sf .gdbinit ~/.gdbinit
ln -sf .gitexcludes ~/.agignore
cd ~
git clone git@github.com:graehl/carmel.git g
git clone git@github.com:graehl/.emacs.d.git
ln -sf u/aliases.sh a
ln -sf dotfiles/.e .
ln -sf dotfiles/.functions .
ln -sf dotfiles/.aliases .
ln -sf dotfiles/.bashrc .
ln -sf .e .bash_profile
ln -sf /Users/graehl/Library/Mobile Documents/com~apple~CloudDocs icloud
ln -sf g/util u
mkdir -p email/_g
mkdir -p email/_p
mkdir -p email/_r
cat <<EOF>local.sh
export OS=Darwin
. ~/bin/git-completion.bash
. ~/bin/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='[\u@mbp \w$(__git_ps1)]\$ '
gifdir=~/email/_g
jpgdir=~/email/_r
webmdir=~/email/_p
chromedir=~/downloads
mvforce() {
    mv -f "$@"
}
mpics() {
(
    set -x
    set +e
    cd $chromedir
    rm -f *' (1)'.jpg
    mvforce *.gif $gifdir/
    mvforce *.jpg $jpgdir/
    mvforce *.jpeg $jpgdir/
    mvforce *.png $jpgdir/
    mvforce *.mp4 $webmdir/
    mvforce *.webm $webmdir/
)
}
k() {
    open ~/k.vncloc
}
export ASAN_OPTIONS="handle_segv=1:detect_leaks=1:strict_init_order=1:suppressions=$HOME/x/jenkins/asan.fc12.debug.supp"
export HOMEBREW_CC=gcc-6
EOF
cat <<EOF>.gitconfig
[user]
	email = graehl@gmail.com
	name = graehl
[alias]
	co = checkout
[apply]
	whitespace = nowarn
[color]
    branch = auto
    diff = auto
    status = auto
[color "branch"]
    current = yellow reverse
    local = yellow
    remote = green
[color "diff"]
    meta = yellow bold
    frag = magenta bold
    old = red bold
    new = green bold
[color "status"]
    added = yellow
    changed = green
    untracked = cyan
EOF
(cd ~/bin
cat <<EOF>filter-gcc-errors
#!/usr/bin/perl
$|=1;
my $skipinstant='(boost|variant)';
while(<>) {
    s#/home/graehl#/Users/graehl#g;
    s/^(\S+\:\d+\:\s+instantiated from).*$skipinstant.*/\1 .../o;
    $|=0;
    print;
}
EOF
chmod +x filter-gcc-errors
)

Generate python packages with pip2nix
-------------------------------------

Some small tweaks are required to generate the python packages with pip2nix. These are described in the following sections.

Modify requirements.txt
.......................

The provides requirements.txt in the taiga-back sources contains a git-link
without branch specified. Because git has no concept of a default-branch pip2nix
requires a branch to be specified. The target repo contains only the "master"
branch therefore adding an "@master" to the git link of "django-pglocks" if
enought to make it work. At the time of writing master points to the commit
"f5df93eab4eea5a71db6b7f034932ca2947194b4".

git+https://github.com/Xof/django-pglocks.git@master

The resulting requirements.txt file is added to the current directory.

Additional dependencies of CairoSVG
...................................

To execute "python setup.py egg_info" for the cairocffi module we need some
extra dependencies to be fulfilled. We have to intsall the libffi and cairo
package from nixpkgs and set the LIBRARY_PATH for clang to find the installed
libffi library (tested on macos).

nix-env -iA nixpkgs.libffi
nix-env -iA nixpkgs.cairo
export LIBRARY_PATH=/nix/store/zk2davcpkqmhycnrhqhgxd785wfvd3w4-libffi-3.2.1/lib

import os

paths = os.getenv('OUT_PATHS').split()
argv = 'nix', 'sign-paths', '--key-file', '/etc/nix/key.private', *paths
os.execvp('nix', argv)

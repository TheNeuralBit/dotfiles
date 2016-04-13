#! /usr/bin/python

import os

DIR = os.path.dirname(os.path.abspath(__file__))

def link(fname):
    source = os.path.join(DIR, fname)
    link_name = os.path.join(os.path.expanduser('~'), '.%s' % fname)
    if os.path.exists(link_name):
        os.remove(link_name)
    os.symlink(source, link_name)

for fname in ('vim', 'vimrc'):
    link(fname);

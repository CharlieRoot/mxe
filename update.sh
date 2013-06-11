#!/bin/sh

git checkout master && git pull mxe master && \
git rebase master shared_boost_icu_qt5 && \
git push origin master && git push -f origin shared_boost_icu_qt5

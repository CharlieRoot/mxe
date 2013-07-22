#!/bin/sh

{ 
  git checkout master && git pull mxe master && \
  git rebase master shared_boost_icu_qt5 && \
  git push origin master && git push -f origin shared_boost_icu_qt5 
} || {
  echo "Update was unsuccessful" >/dev/stderr
  exit 1
}

myfiles=$(git whatchanged --pretty=short --format='%b' master.. | \
		  grep -vE '^$' | awk '{print $6}' | sort | uniq)

myfiles_db=./.myfiles.list

[ -r $myfiles_db ] && for f in $myfiles; do
  finfo=$(grep $f $myfiles_db)
  tstamp=$(echo $finfo| cut -f 2 -d ' ')
  csum=$(echo $finfo| cut -f 3 -d ' ')
  [ "$csum" = "$(md5 -q $f)" ] && touch -t $tstamp $f
done

for f in $myfiles; do
  echo $f $(stat -t '%Y%m%d%H%M.%S' $f | awk '{print $10}' | cut -f 2 -d '"') $(md5 -q $f)
done >$myfiles_db

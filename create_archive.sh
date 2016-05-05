#!/bin/sh

PROJECT=uptex-fonts
TMP=/tmp
PWDF=`pwd`
LATESTRELEASEDATE=`git tag | sort -r | head -n 1`
RELEASEDATE=`git tag --points-at HEAD | sort -r | head -n 1`

if [ -z "$RELEASEDATE" ]; then
    RELEASEDATE="**not tagged**; later than $LATESTRELEASEDATE?"
fi

echo " * Create $PROJECT.tds.zip"
git archive --format=tar --prefix=$PROJECT/ HEAD | (cd $TMP && tar xf -)
rm $TMP/$PROJECT/create_archive.sh
perl -pi.bak -e "s/\\\$RELEASEDATE/$RELEASEDATE/g" $TMP/$PROJECT/README.md
rm -f $TMP/$PROJECT/README.md.bak

mkdir -p $TMP/$PROJECT/doc/fonts/uptex
mv $TMP/$PROJECT/LICENSE $TMP/$PROJECT/doc/fonts/uptex/
mv $TMP/$PROJECT/README.md $TMP/$PROJECT/doc/fonts/uptex/
mv $TMP/$PROJECT/*.txt $TMP/$PROJECT/doc/fonts/uptex/

mkdir -p $TMP/$PROJECT/fonts/cmap/uptex
mv $TMP/$PROJECT/cmap/* $TMP/$PROJECT/fonts/cmap/uptex

mkdir -p $TMP/$PROJECT/source-new/fonts/uptex
mv $TMP/$PROJECT/source/* $TMP/$PROJECT/source-new/fonts/uptex/
rmdir $TMP/$PROJECT/source
mv $TMP/$PROJECT/source{-new,}

mkdir -p $TMP/$PROJECT/fonts/tfm/uptex/min
mv $TMP/$PROJECT/tfm/ugb* $TMP/$PROJECT/fonts/tfm/uptex/min/
mv $TMP/$PROJECT/tfm/urml* $TMP/$PROJECT/fonts/tfm/uptex/min/
mv $TMP/$PROJECT/tfm/*10* $TMP/$PROJECT/fonts/tfm/uptex/min/

mkdir -p $TMP/$PROJECT/fonts/tfm/uptex/jis
mv $TMP/$PROJECT/tfm/* $TMP/$PROJECT/fonts/tfm/uptex/jis

mkdir -p $TMP/$PROJECT/fonts/vf/uptex/min
mv $TMP/$PROJECT/vf/*10* $TMP/$PROJECT/fonts/vf/uptex/min

mkdir -p $TMP/$PROJECT/fonts/vf/uptex/jis
mv $TMP/$PROJECT/vf/* $TMP/$PROJECT/fonts/vf/uptex/jis

rmdir $TMP/$PROJECT/{cmap,tfm,vf}

cd $TMP/$PROJECT && zip -r $TMP/$PROJECT.tds.zip *
cd $PWDF
rm -rf $TMP/$PROJECT

echo
echo " * Create $PROJECT.zip ($RELEASEDATE)"
git archive --format=tar --prefix=$PROJECT/ HEAD | (cd $TMP && tar xf -)
rm $TMP/$PROJECT/create_archive.sh
perl -pi.bak -e "s/\\\$RELEASEDATE/$RELEASEDATE/g" $TMP/$PROJECT/README.md
rm -f $TMP/$PROJECT/README.md.bak

cd $TMP && zip -r $PWDF/$PROJECT.zip $PROJECT $PROJECT.tds.zip
rm -rf $TMP/$PROJECT $TMP/$PROJECT.tds.zip
echo
echo " * Done: $PROJECT.zip ($RELEASEDATE)"

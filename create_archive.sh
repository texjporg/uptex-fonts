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
rm $TMP/$PROJECT/.gitignore
rm $TMP/$PROJECT/create_archive.sh
rm -rf $TMP/$PROJECT/00uptex-0.30
rm -rf $TMP/$PROJECT/samples
perl -pi.bak -e "s/\\\$RELEASEDATE/$RELEASEDATE/g" $TMP/$PROJECT/README.md
rm -f $TMP/$PROJECT/README.md.bak

mkdir -p $TMP/$PROJECT/doc/fonts/$PROJECT
mv $TMP/$PROJECT/LICENSE $TMP/$PROJECT/doc/fonts/$PROJECT/
mv $TMP/$PROJECT/*.md $TMP/$PROJECT/doc/fonts/$PROJECT/
mv $TMP/$PROJECT/*.txt $TMP/$PROJECT/doc/fonts/$PROJECT/

mkdir -p $TMP/$PROJECT/fonts/cmap/$PROJECT
mv $TMP/$PROJECT/cmap/* $TMP/$PROJECT/fonts/cmap/$PROJECT/

mkdir -p $TMP/$PROJECT/fonts/source/$PROJECT
mv $TMP/$PROJECT/source/* $TMP/$PROJECT/fonts/source/$PROJECT/

#mkdir -p $TMP/$PROJECT/source-new/fonts/$PROJECT
#mv $TMP/$PROJECT/source/* $TMP/$PROJECT/source-new/fonts/$PROJECT/
#rmdir $TMP/$PROJECT/source
#mv $TMP/$PROJECT/source{-new,}

mkdir -p $TMP/$PROJECT/fonts/tfm/$PROJECT/min
mv $TMP/$PROJECT/tfm/ugb* $TMP/$PROJECT/fonts/tfm/$PROJECT/min/
mv $TMP/$PROJECT/tfm/urml* $TMP/$PROJECT/fonts/tfm/$PROJECT/min/
mv $TMP/$PROJECT/tfm/*10* $TMP/$PROJECT/fonts/tfm/$PROJECT/min/

mkdir -p $TMP/$PROJECT/fonts/tfm/$PROJECT/jis
mv $TMP/$PROJECT/tfm/up* $TMP/$PROJECT/fonts/tfm/$PROJECT/jis

mkdir -p $TMP/$PROJECT/fonts/vf/$PROJECT/min
mv $TMP/$PROJECT/vf/*10* $TMP/$PROJECT/fonts/vf/$PROJECT/min

mkdir -p $TMP/$PROJECT/fonts/vf/$PROJECT/jis
mv $TMP/$PROJECT/vf/up* $TMP/$PROJECT/fonts/vf/$PROJECT/jis

rm $TMP/$PROJECT/Makefile

rmdir $TMP/$PROJECT/source
rmdir $TMP/$PROJECT/cmap
rmdir $TMP/$PROJECT/tfm
rmdir $TMP/$PROJECT/vf

cd $TMP/$PROJECT && zip -r $TMP/$PROJECT.tds.zip *
cd $PWDF
rm -rf $TMP/$PROJECT

echo
echo " * Create $PROJECT.zip ($RELEASEDATE)"
git archive --format=tar --prefix=$PROJECT/ HEAD | (cd $TMP && tar xf -)
rm $TMP/$PROJECT/.gitignore
rm $TMP/$PROJECT/create_archive.sh
rm $TMP/$PROJECT/Makefile
rm -rf $TMP/$PROJECT/00uptex-0.30
rm -rf $TMP/$PROJECT/samples
perl -pi.bak -e "s/\\\$RELEASEDATE/$RELEASEDATE/g" $TMP/$PROJECT/README.md
rm -f $TMP/$PROJECT/README.md.bak

cd $TMP && zip -r $PWDF/$PROJECT.zip $PROJECT $PROJECT.tds.zip
rm -rf $TMP/$PROJECT $TMP/$PROJECT.tds.zip
echo
echo " * Done: $PROJECT.zip ($RELEASEDATE)"

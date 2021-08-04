#

stamp=$(date +%b%y | tr '[:upper:]' '[:lower:]')
find . -name '*~1' -delete
rm -f _site/*.pdf
rm -f output.pdf

bundle exec jekyll build

#rm mgc_cv_$stamp.pdf
if [ ! -e mgc_cv_$stamp.pdf ]; then
chromium --foreground --headless --disable-gpu --no-margins --print-to-pdf _site/index-fr.html
sleep 7;
cp -p output.pdf mgc_cv_$stamp.pdf
xdg-open ./mgc_cv_$stamp.pdf;
ls -l mgc_cv_$stamp.pdf
rm -f output.pdf
fi

#rm mgc_resume-en.pdf
if [ ! -e mgc_resume-en.pdf ]; then
chromium --foreground --headless --disable-gpu --no-margins --print-to-pdf _site/index-en.html
sleep 7;
cp -p output.pdf mgc_resume-en.pdf
git add mgc_resume-en.pdf
xdg-open ./mgc_resume-en.pdf;
cp -p mgc_resume-en.pdf michel_resume_print.pdf
cp -p mgc_resume-en.pdf mgc_resume_$stamp.pdf
ls -l ./mgc_resume-en.pdf;
rm -f output.pdf
fi


#rm mgc_resume-fr.pdf
if [ ! -e mgc_resume-fr.pdf ]; then
chromium --foreground --headless --disable-gpu --no-margins --print-to-pdf _site/index.html
cp -p output.pdf mgc_resume-fr.pdf
git add mgc_resume-fr.pdf
xdg-open ./mgc_resume-fr.pdf;
ls -l ./mgc_resume-fr.pdf;
rm -f output.pdf
fi


bundle exec jekyll build



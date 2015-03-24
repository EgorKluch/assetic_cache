branch=$(git rev-parse --abbrev-ref HEAD);

cd "ass_cache/";

if [ "$1" == "-l" ]; then
    if [ -n "$(git branch --list $branch)" ]; then
        git checkout $branch;
    else
        echo "Assets cache for $branch doesn't exists!";
        exit;
    fi

    cd "..";
    rm -rf "app/var/cache/dev/assetic/";
    cp -r "ass_cache/compiled/" "web/";
    cp -r "ass_cache/assetic/" "app/var/cache/dev/";

    exit;
fi;

if [ -n "$(git branch --list $branch)" ]; then
    git checkout $branch;
else
    git checkout -b $branch;
fi

rm -rf "compiled/";
rm -rf "assetic/";

cd "..";
cp -r "web/compiled/" "ass_cache/";
cp -r "app/var/cache/dev/assetic/" "ass_cache/";

cd "ass_cache/";
git add -u .;

git commit -m "Save assets";

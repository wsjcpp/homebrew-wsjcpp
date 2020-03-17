# homebrew-wsjcpp
Homebrew formula for wsjcpp "yet one c++ source manager" https://github.com/wsjcpp/wsjcpp

TL;DR: Just execute `brew tap wsjcpp/wsjcpp` and `brew install wsjcpp`.

## Update formula
```
export VERSION=0.0.2
export URL=https://github.com/wsjcpp/wsjcpp/archive/v$VERSION.tar.gz
wget $URL
export SHA=$(shasum -a 256 v$VERSION.tar.gz | awk '{ print $1 }')
rm v$VERSION.tar.gz
echo "class NlohmannJson < Formula" > wsjcpp.rb.tmp
echo "  desc \"JSON for Modern C++\"" >> wsjcpp.rb.tmp
echo "  homepage \"https://github.com/nlohmann/json\"" >> wsjcpp.rb.tmp
echo "  url \"$URL\"" >> wsjcpp.rb.tmp
echo "  sha256 \"$SHA\"" >> wsjcpp.rb.tmp
tail -n+6 wsjcpp.rb >> wsjcpp.rb.tmp
mv wsjcpp.rb.tmp wsjcpp.rb
git add wsjcpp.rb
git commit -m "v$VERSION"
git push
```
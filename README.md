# homebrew-wsjcpp
Homebrew formula for wsjcpp "yet one c++ source manager" https://github.com/wsjcpp/wsjcpp

TL;DR: Just execute `brew tap wsjcpp` and `brew install wsjcpp`.

## Update formula
```
export VERSION=0.0.1
export URL=https://github.com/wsjcpp/wsjcpp/archive/v$VERSION.tar.gz
wget $URL
export SHA=$(shasum -a 256 v$VERSION.tar.gz | awk '{ print $1 }')
rm v$VERSION.tar.gz
echo "class NlohmannJson < Formula" > nlohmann_json.rb.tmp
echo "  desc \"JSON for Modern C++\"" >> nlohmann_json.rb.tmp
echo "  homepage \"https://github.com/nlohmann/json\"" >> nlohmann_json.rb.tmp
echo "  url \"$URL\"" >> nlohmann_json.rb.tmp
echo "  sha256 \"$SHA\"" >> nlohmann_json.rb.tmp
tail -n+6 nlohmann_json.rb >> nlohmann_json.rb.tmp
mv nlohmann_json.rb.tmp nlohmann_json.rb
git add nlohmann_json.rb
git commit -m "v$VERSION"
git push
```
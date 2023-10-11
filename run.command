DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 

cd "$DIR"

swiftgen config run --config .swiftgenAdmiralTabsImages.yml
swiftgen config run --config .swiftgenAdmiralTabsSymbols.yml
swiftgen config run --config .swiftgenAdmiralUTabsViewerImages.yml
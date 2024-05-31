# chapchap

Prendre soin de ses cheveux sans se prendre la tête !

## Getting Started

Add this before get your project :

flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs

## Resolve all little issue

dart fix --apply


## Build on Web 

flutter run -d chrome --web-renderer html

flutter build web --web-renderer html --release

## deploy

firebase deploy --only hosting
firebase deploy --only hosting:chapchap

## change icon

flutter pub run flutter_launcher_icons:main


## GITHUB

git init
git add .
git commit -m "app"
git branch -M app
git remote add origin https://github.com/MizzUp/chapchap.git
git push -u origin app

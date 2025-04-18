# CHipCie Debian Repository

## Debian Repository
This is a Debian repository for packages used during programming contests organized by the CHipCie, which are not available elsewhere.

### How to add a package
1. Create a folder for package
2. Set up a build script which creates a .deb file, and places it in ``debian`` folder.
3. Run [packages script](/debian/create-packages.sh) so it is included in the list of packages

### How to use repository
Add [chipcie-repo.list](/debian/chipcie-repo.list) to your apt sources at ``/etc/apt/sources.list.d/``. Don't forget to ``apt update`` after adding the repository.

## Resources
- https://assafmo.github.io/2019/05/02/ppa-repo-hosted-on-github.html
- https://askubuntu.com/a/493577

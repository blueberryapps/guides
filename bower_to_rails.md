Rails-assets & bower
=================

> **Instalace Bower:**

> ~  `npm install -g bower`



Vytvoření vlastního Bower baličku
---------------------------------------

Balíčky jsou definovány souborem bower.json

#### Vytvoření bower.json:

> ve foldrů nového balíčku

 1. `bower init`
 
 > **name** (required): The name of your package
**version**: A semantic version number (see semver).
**main**: The primary acting files necessary to use your package.
**ignore**: An array of paths not needed in production that you want Bower to ignore when installing your package.
**keywords**: (recommended) helps make your package easier to discover
**dependencies**: Packages your package depends upon in production. Note that you can specify ranges of versions for your dependencies.
**devDependencies**: Development dependencies.
**private**: Set to true if you want to keep the package private

 2. `bower register <my-package-name> <git-endpoint>`

	> 
	-  **GIT repo**  musí být veřejně k dispozici.
	- balíček musí používať  Semantic Versioning v podobe "Tags" (1.0.1)

 3. https://rails-assets.org/components/new
    > někdy je nutné počkat pár hodin
    
